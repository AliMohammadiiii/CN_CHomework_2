#include <cstdlib>
#include <time.h>
#include <stdio.h>
#include <string>
#include <fstream>
#include <iomanip>

#include "ns3/core-module.h"
#include "ns3/point-to-point-module.h"
#include "ns3/network-module.h"
#include "ns3/applications-module.h"
#include "ns3/mobility-module.h"
#include "ns3/csma-module.h"
#include "ns3/internet-module.h"
#include "ns3/yans-wifi-helper.h"
#include "ns3/ssid.h"
#include "ns3/packet-sink.h"
#include "ns3/error-model.h"
#include "ns3/udp-header.h"
#include "ns3/tcp-header.h"
#include "ns3/enum.h"
#include "ns3/event-id.h"
#include "ns3/flow-monitor-helper.h"
#include "ns3/ipv4-global-routing-helper.h"
#include "ns3/traffic-control-module.h"
#include "ns3/flow-monitor-module.h"

using namespace ns3;
using namespace std;

NS_LOG_COMPONENT_DEFINE ("main");

const int TOTAL_MAPPER = 3;

static void GenerateTraffic (Ptr<Socket>, uint16_t);

//////////////////////////////////// Classes //////////////////////////////////////////

class MyHeader : public Header 
{
public:
    MyHeader ();
    virtual ~MyHeader ();
    void SetData (uint16_t data);
    uint16_t GetData (void) const;
    static TypeId GetTypeId (void);
    virtual TypeId GetInstanceTypeId (void) const;
    virtual void Print (std::ostream &os) const;
    virtual void Serialize (Buffer::Iterator start) const;
    virtual uint32_t Deserialize (Buffer::Iterator start);
    virtual uint32_t GetSerializedSize (void) const;
private:
    uint16_t m_data;
};

MyHeader::MyHeader ()
{
}

MyHeader::~MyHeader ()
{
}

TypeId
MyHeader::GetTypeId (void)
{
    static TypeId tid = TypeId ("ns3::MyHeader")
        .SetParent<Header> ()
        .AddConstructor<MyHeader> ()
    ;
    return tid;
}

TypeId
MyHeader::GetInstanceTypeId (void) const
{
    return GetTypeId ();
}

void
MyHeader::Print (std::ostream &os) const
{
    os << "data = " << m_data << endl;
}

uint32_t
MyHeader::GetSerializedSize (void) const
{
    return 2;
}

void
MyHeader::Serialize (Buffer::Iterator start) const
{
    start.WriteHtonU16 (m_data);
}

uint32_t
MyHeader::Deserialize (Buffer::Iterator start)
{
    m_data = start.ReadNtohU16 ();

    return 2;
}

void 
MyHeader::SetData (uint16_t data)
{
    m_data = data;
}

uint16_t 
MyHeader::GetData (void) const
{
    return m_data;
}



class client : public Application
{
public:
    client (uint16_t port, Ipv4InterfaceContainer& centralIp, Ipv4InterfaceContainer& localIp);
    virtual ~client ();

private:
    virtual void StartApplication (void);
    void HandleRead (Ptr<Socket> socket);

    uint16_t port;
    Ptr<Socket> centralSocket;
    Ptr<Socket> mapperSocket;
    Ipv4InterfaceContainer centralIp;
    Ipv4InterfaceContainer localIp;
};

client::client (uint16_t port, Ipv4InterfaceContainer& centralIp, Ipv4InterfaceContainer& localIp)
        : port (port),
          centralIp (centralIp),
          localIp (localIp)
{
    std::srand (time(0));
}

client::~client ()
{
}

void
client::StartApplication (void)
{
    centralSocket = Socket::CreateSocket (GetNode (), UdpSocketFactory::GetTypeId ());
    InetSocketAddress sockAddr = InetSocketAddress (centralIp.GetAddress (0), port);
    centralSocket->Connect (sockAddr);

    mapperSocket = Socket::CreateSocket (GetNode (), UdpSocketFactory::GetTypeId ());
    InetSocketAddress local = InetSocketAddress (localIp.GetAddress (0), port);
    mapperSocket->Bind (local);

    mapperSocket->SetRecvCallback (MakeCallback (&client::HandleRead, this));

    GenerateTraffic(centralSocket, 0);
}

void 
client::HandleRead (Ptr<Socket> socket)
{
    Ptr<Packet> packet;

    while ((packet = socket->Recv ()))
    {
        if (packet->GetSize () == 0)
        {
            break;
        }

        MyHeader destinationHeader;
        packet->RemoveHeader (destinationHeader);
        cout << char(destinationHeader.GetData()) << " >> Client";
    }

}



class central : public Application
{
public:
    central (uint16_t port, Ipv4InterfaceContainer& localIp, Ipv4InterfaceContainer& mapperIp);
    virtual ~central ();
private:
    virtual void StartApplication (void);
    void HandleRead (Ptr<Socket> socket);

    uint16_t port;
    Ptr<Socket> udpSocket;
    Ptr<Socket> tcpSockets [TOTAL_MAPPER];
    Ipv4InterfaceContainer localIp;
    Ipv4InterfaceContainer mapperIp;
};

central::central (uint16_t port, Ipv4InterfaceContainer& localIp, Ipv4InterfaceContainer& mapperIp)
        : port (port),
          localIp (localIp),
          mapperIp (mapperIp)
{
    std::srand (time(0));
}

central::~central ()
{
}

void
central::StartApplication (void)
{
    udpSocket = Socket::CreateSocket (GetNode (), UdpSocketFactory::GetTypeId ());
    InetSocketAddress local = InetSocketAddress (localIp.GetAddress (0), port);
    udpSocket->Bind (local);

    udpSocket->SetRecvCallback (MakeCallback (&central::HandleRead, this));

    for (int i = 0; i < TOTAL_MAPPER; i++)
    {
        tcpSockets[i] = Socket::CreateSocket (GetNode (), TcpSocketFactory::GetTypeId ());
        InetSocketAddress remote = InetSocketAddress (mapperIp.GetAddress (i), port);
        tcpSockets[i]->Connect (remote);
    }

}

void 
central::HandleRead (Ptr<Socket> socket)
{
    Ptr<Packet> packet;

    while ((packet = socket->Recv ()))
    {
        if (packet->GetSize () == 0)
        {
            break;
        }

        MyHeader destinationHeader;
        packet->RemoveHeader (destinationHeader);
        cout << setw(2) << setfill('0') << destinationHeader.GetData() << " >> Central >> " << setw(2) << setfill('0') << destinationHeader.GetData() << " >> ";
        for (int i = 0; i < TOTAL_MAPPER; i++)
        {
            Ptr<Packet> newPacket = new Packet();
            newPacket->AddHeader (destinationHeader);
            tcpSockets[i]->Send(newPacket);
        }
    }

}


class mapper : public Application
{
public:
    mapper (int id, uint16_t port, Ipv4InterfaceContainer& localIp, Ipv4InterfaceContainer& clientIp);
    virtual ~mapper ();

private:
    virtual void StartApplication (void);
    void HandleRead (Ptr<Socket> socket);
    void HandleAccept (Ptr<Socket> socket, const Address& from); 

    int id;
    uint16_t port;
    Ptr<Socket> tcpSocket;
    Ptr<Socket> udpSocket;
    Ipv4InterfaceContainer localIp;
    Ipv4InterfaceContainer clientIp;
};

mapper::mapper (int id, uint16_t port, Ipv4InterfaceContainer& localIp, Ipv4InterfaceContainer& clientIp)
        : id(id),
          port (port),
          localIp (localIp),
          clientIp (clientIp)
{
    std::srand (time(0));
}

mapper::~mapper ()
{
}

void
mapper::StartApplication (void)
{
    tcpSocket = Socket::CreateSocket (GetNode (), TcpSocketFactory::GetTypeId ());
    InetSocketAddress local = InetSocketAddress (localIp.GetAddress (id), port);
    tcpSocket->Bind (local);
    tcpSocket->Listen ();

    tcpSocket->SetAcceptCallback (
        MakeNullCallback<bool, ns3::Ptr<ns3::Socket>, const ns3::Address&> (),
        MakeCallback (&mapper::HandleAccept, this));
 

    udpSocket = Socket::CreateSocket (GetNode (), UdpSocketFactory::GetTypeId ());
    InetSocketAddress sockAddr = InetSocketAddress (clientIp.GetAddress (0), port);
    udpSocket->Connect (sockAddr);
}

void 
mapper::HandleAccept (ns3::Ptr<ns3::Socket> socket, const ns3::Address& from)
{
    cout << "\nMapper" << id << ": connection from central" << endl;
    socket->SetRecvCallback (MakeCallback (&mapper::HandleRead, this));
}

void
mapper::HandleRead (Ptr<Socket> socket)
{
    Ptr<Packet> packet;

    while ((packet = socket->Recv ()))
    {
        if (packet->GetSize () == 0)
        {
            break;
        }

        MyHeader destinationHeader;
        packet->RemoveHeader (destinationHeader);
        
        int data = destinationHeader.GetData();
        if (data % TOTAL_MAPPER == id) {
            Ptr<Packet> newPacket = new Packet();
            MyHeader newHeader;
            newHeader.SetData('a' + data);
            newPacket->AddHeader (newHeader);
            cout << setw(2) << setfill('0') << data << " >> Mapper" << id << " >> " << char(newHeader.GetData()) << " >> ";
            udpSocket->Send(newPacket);
        }
    }

}


//////////////////////////////////// Functions //////////////////////////////////////////

void
ThroughputMonitor (FlowMonitorHelper *fmhelper, Ptr<FlowMonitor> flowMon, double em)
{
    uint16_t i = 0;

    std::map<FlowId, FlowMonitor::FlowStats> flowStats = flowMon->GetFlowStats ();

    Ptr<Ipv4FlowClassifier> classing = DynamicCast<Ipv4FlowClassifier> (fmhelper->GetClassifier ());
    for (std::map<FlowId, FlowMonitor::FlowStats>::const_iterator stats = flowStats.begin (); stats != flowStats.end (); ++stats)
    {
        Ipv4FlowClassifier::FiveTuple fiveTuple = classing->FindFlow (stats->first);

        std::cout << "\nFlow ID			: "<< stats->first << " ; " << fiveTuple.sourceAddress << " -----> " << fiveTuple.destinationAddress << std::endl;
        std::cout << "Tx Packets = " << stats->second.txPackets << std::endl;
        std::cout << "Rx Packets = " << stats->second.rxPackets << std::endl;
        std::cout << "Duration		: "<< (stats->second.timeLastRxPacket.GetSeconds () - stats->second.timeFirstTxPacket.GetSeconds ()) << std::endl;
        std::cout << "Last Received Packet	: "<< stats->second.timeLastRxPacket.GetSeconds () << " Seconds" << std::endl;
        std::cout << "Throughput: " << stats->second.rxBytes * 8.0 / (stats->second.timeLastRxPacket.GetSeconds () - stats->second.timeFirstTxPacket.GetSeconds ()) / 1024 / 1024  << " Mbps" << std::endl;
    
        i++;

        std::cout << "---------------------------------------------------------------------------" << std::endl;
    }

    Simulator::Schedule (Seconds (10),&ThroughputMonitor, fmhelper, flowMon, em);
}

void
AverageDelayMonitor (FlowMonitorHelper *fmhelper, Ptr<FlowMonitor> flowMon, double em)
{
    uint16_t i = 0;

    std::map<FlowId, FlowMonitor::FlowStats> flowStats = flowMon->GetFlowStats ();
    Ptr<Ipv4FlowClassifier> classing = DynamicCast<Ipv4FlowClassifier> (fmhelper->GetClassifier ());
    for (std::map<FlowId, FlowMonitor::FlowStats>::const_iterator stats = flowStats.begin (); stats != flowStats.end (); ++stats)
    {
        Ipv4FlowClassifier::FiveTuple fiveTuple = classing->FindFlow (stats->first);
        std::cout << "\nFlow ID			: "<< stats->first << " ; " << fiveTuple.sourceAddress << " -----> " << fiveTuple.destinationAddress << std::endl;
        std::cout << "Tx Packets = " << stats->second.txPackets << std::endl;
        std::cout << "Rx Packets = " << stats->second.rxPackets << std::endl;
        std::cout << "Duration		: "<< (stats->second.timeLastRxPacket.GetSeconds () - stats->second.timeFirstTxPacket.GetSeconds ()) << std::endl;
        std::cout << "Last Received Packet	: "<< stats->second.timeLastRxPacket.GetSeconds () << " Seconds" << std::endl;
        std::cout << "Sum of e2e Delay: " << stats->second.delaySum.GetSeconds () << " s" << std::endl;
        std::cout << "Average of e2e Delay: " << stats->second.delaySum.GetSeconds () / stats->second.rxPackets << " s" << std::endl;
    
        i++;

        std::cout << "---------------------------------------------------------------------------" << std::endl;
    }

    Simulator::Schedule (Seconds (10),&AverageDelayMonitor, fmhelper, flowMon, em);
}

static void
GenerateTraffic (Ptr<Socket> socket, uint16_t data)
{
    Ptr<Packet> packet = new Packet();
    MyHeader m;
    m.SetData(data);

    cout << "\nClient >> " << setw(2) << setfill('0') << data << " >> ";

    packet->AddHeader (m);
    socket->Send(packet);

    Simulator::Schedule (Seconds (0.1), &GenerateTraffic, socket, rand() % 26);
}


//////////////////////////////////// Main //////////////////////////////////////////


int
main (int argc, char *argv[])
{
    double error = 0.000001;
    string bandwidth = "1Mbps";
    bool verbose = true;
    double duration = 20.0;
    bool tracing = false;
    uint16_t port = 1234;

    srand(time(NULL));

    CommandLine cmd (__FILE__);
    cmd.AddValue ("verbose", "Tell echo applications to log if true", verbose);
    cmd.AddValue ("tracing", "Enable pcap tracing", tracing);

    cmd.Parse (argc,argv);

    if (verbose)
    {
        LogComponentEnable ("UdpEchoClientApplication", LOG_LEVEL_INFO);
        LogComponentEnable ("UdpEchoServerApplication", LOG_LEVEL_INFO);
    }

    NodeContainer wifiStaNodeClient;
    wifiStaNodeClient.Create (1);

    NodeContainer wifiApNodeCentral;
    wifiApNodeCentral.Create (1);

    NodeContainer wifiStaNodeMapper;
    wifiStaNodeMapper.Create (TOTAL_MAPPER + 1);

    YansWifiChannelHelper channel = YansWifiChannelHelper::Default ();

    YansWifiPhyHelper phy;
    phy.SetChannel (channel.Create ());

    WifiHelper wifi;
    wifi.SetRemoteStationManager ("ns3::AarfWifiManager");

    WifiMacHelper mac;
    Ssid ssid = Ssid ("ns-3-ssid");
    mac.SetType ("ns3::StaWifiMac", "Ssid", SsidValue (ssid), "ActiveProbing", BooleanValue (false));

    NetDeviceContainer staDeviceClient;
    staDeviceClient = wifi.Install (phy, mac, wifiStaNodeClient);

    NetDeviceContainer staDeviceMapper;
    staDeviceMapper = wifi.Install (phy, mac, wifiStaNodeMapper);

    mac.SetType ("ns3::ApWifiMac", "Ssid", SsidValue (ssid));

    NetDeviceContainer apDeviceCentral;
    apDeviceCentral = wifi.Install (phy, mac, wifiApNodeCentral);

    Ptr<RateErrorModel> em = CreateObject<RateErrorModel> ();
    em->SetAttribute ("ErrorRate", DoubleValue (error));
    phy.SetErrorRateModel("ns3::YansErrorRateModel");

    MobilityHelper mobility;

    mobility.SetPositionAllocator ("ns3::GridPositionAllocator",
                                   "MinX", DoubleValue (0.0),
                                   "MinY", DoubleValue (0.0),
                                   "DeltaX", DoubleValue (5.0),
                                   "DeltaY", DoubleValue (10.0),
                                   "GridWidth", UintegerValue (3),
                                   "LayoutType", StringValue ("RowFirst"));

    mobility.SetMobilityModel ("ns3::RandomWalk2dMobilityModel", "Bounds", RectangleValue (Rectangle (-50, 50, -50, 50)));
    mobility.Install (wifiStaNodeClient);

    mobility.SetMobilityModel ("ns3::ConstantPositionMobilityModel");
    mobility.Install (wifiApNodeCentral);
    mobility.Install (wifiStaNodeMapper);

    InternetStackHelper stack;
    stack.Install (wifiStaNodeClient);
    stack.Install (wifiApNodeCentral);
    stack.Install (wifiStaNodeMapper);

    Ipv4AddressHelper address;

    Ipv4InterfaceContainer staNodeClientInterface;
    Ipv4InterfaceContainer apNodeCentralInterface;
    Ipv4InterfaceContainer staNodeMapperInterface;

    address.SetBase ("10.1.3.0", "255.255.255.0");
    staNodeClientInterface = address.Assign (staDeviceClient);
    apNodeCentralInterface = address.Assign (apDeviceCentral);
    staNodeMapperInterface = address.Assign (staDeviceMapper);

    Ipv4GlobalRoutingHelper::PopulateRoutingTables ();

    Ptr<client> clientNode = CreateObject<client> (port, apNodeCentralInterface, staNodeClientInterface);
    wifiStaNodeClient.Get (0)->AddApplication (clientNode);
    clientNode->SetStartTime (Seconds (0.0));
    clientNode->SetStopTime (Seconds (duration));  

    Ptr<central> centralNode = CreateObject<central> (port, apNodeCentralInterface, staNodeMapperInterface);
    wifiApNodeCentral.Get (0)->AddApplication (centralNode);
    centralNode->SetStartTime (Seconds (0.1));
    centralNode->SetStopTime (Seconds (duration));  

    for (int i = 0; i < TOTAL_MAPPER; i++)
    {
        Ptr<mapper> mapperNode = CreateObject<mapper> (i, port, staNodeMapperInterface, staNodeClientInterface);
        wifiStaNodeMapper.Get (i)->AddApplication (mapperNode);
        mapperNode->SetStartTime (Seconds (0.0));
        mapperNode->SetStopTime (Seconds (duration));
    }

    NS_LOG_INFO ("Run Simulation");

    Ptr<FlowMonitor> flowMonitor;
    FlowMonitorHelper flowHelper;
    flowMonitor = flowHelper.InstallAll();

    ThroughputMonitor (&flowHelper, flowMonitor, error);
    AverageDelayMonitor (&flowHelper, flowMonitor, error);

    Simulator::Stop (Seconds (duration));
    Simulator::Run ();
    Simulator::Destroy ();

    return 0;
}
