
The Wifi Simulator with one centeral node and one client and three mapper with ns3
================================

## Table of Contents:

1) [An overview](#an-overview)
2) [Building ns-3](#building-ns-3)
3) [Running ns-3](#running-ns-3)
4) [Getting access to the ns-3 documentation](#getting-access-to-the-ns-3-documentation)
5) [Working with the development version of ns-3](#working-with-the-development-version-of-ns-3)


## An Overview
In this experiment, ns has been used and its purpose is to investigate a Wi-Fi network topology that has 5 nodes. One node for the client, one central node and the rest are mappers. This is how the client sends a number to the central node with the UDP protocol, and the central node sends the data with the TCP protocol after receiving it for three mapper nodes. If the map has this number, it will be sent to the client using the UDP protocol.


## Building ns-3

The code for the framework and the default models provided
by ns-3 is built as a set of libraries. User simulations
are expected to be written as simple programs that make
use of these ns-3 libraries.

To build the set of default libraries and the example
programs included in this package, you need to use the
tool 'waf'. Detailed information on how to use waf is
included in the file doc/build.txt

However, the real quick and dirty way to get started is to
type the command
```shell
./waf configure --enable-examples
```

followed by

```shell
./waf
```

in the directory which contains this README file. The files
built will be copied in the build/ directory.


## Running ns-3

On recent Linux systems, once you have built ns-3 (with examples
enabled), it should be easy to run the sample programs with the
following command, such as:

```shell
./waf --run main
```

That program should generate a `main.tr` text
trace file and a set of `main-xx-xx.pcap` binary
pcap trace files, which can be read by `tcpdump -tt -r filename.pcap`
The program source can be found in the examples/routing directory.

## Structure
We did our programming in an object-oriented way, and in this program, a class for the header was created, which was inherited from the Header, and also three classes for different types of nodes, which were inherited from the Application. Several functions have been made to check the system performance and monitor it. We explain each of the classes and functions.
### MyHeader
This class is created for setting header for sending packet from each node so we customize this for this problem.
### client
This class has two public constructor and instructor functions, and the rest of its variables and functions are private.
```ruby
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
```
In the constructor, the variables are set and the initial value of the random function is also set to that date.
Here it keeps the port it listens through and also the sockets it has to the central node and the mapper.
It also keeps its own address as well as the address of the central node.
```ruby
void client::StartApplication (void)
```
In this function, first, two sockets are created to receive from the mapper and connect with the central node, then a callback is defined for the mapper socket, which calls the HandleRead function as soon as a packet is received. And it also creates a traffic and packets randomly.

```ruby
void client::HandleRead (Ptr<Socket> socket)
```
As long as it receives a packet and that packet has a size greater than zero, it removes the packet header and reads its contents.
### Central node
```ruby
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
```
It is similar to the client class. with the difference that it maintains its local address and the mapper address.
and maintains an array of sockets for tcp.

```ruby
void central::StartApplication (void)
```
First, it creates a socket for UDP communication with the client and sets the callback event to the HandleRead function for receiving this socket.
Then, we create a TCP socket with their addresses for the number of mappers we have as follows. And next we send a request to connection with mapper node
```ruby
        tcpSockets[i] = Socket::CreateSocket (GetNode (), TcpSocketFactory::GetTypeId ());
        InetSocketAddress remote = InetSocketAddress (mapperIp.GetAddress (i), port);
        tcpSockets[i]->Connect (remote);
```
```ruby
void central::HandleRead (Ptr<Socket> socket)
```
Like the client, after receiving a packet, it removes its header and reads its data. Then it prints the contents and adds its own header and sends it to the mapper nodes.
### Mapper
```ruby
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
```
The functions and variables of this class are the same as above. with these differences that the variables it keeps are its own address and also the address of the client, and it also keeps these two created sockets.
```ruby
void mapper::StartApplication (void);
```
First, it creates the TCP port and then listens to accept. As soon as a request is sent to it, it goes to HandleAccept and can establish this connection. The fact that you have to respond to a TCP connection request is a very important issue. Then it establishes its connection and socket with the client.

```ruby
void mapper::HandleAccept (ns3::Ptr<ns3::Socket> socket, const ns3::Address& from)
```
In this method, a message is sent as an exception, and then the received event is set to HandleRead
```ruby
void mapper::HandleRead (Ptr<Socket> socket)
```
First, it receives the packet, then extracts the header and reads the data. Now it checks that if the data is in the list of data that the map has, it creates a new packet and puts the relevant word inside it, corrects its header and sends it to the client in the form of UDP.
### General function
### ThroughputMonitor
This function shows data from tasks and system status every 10 seconds. (Source address, destination address, Tx Packets, Rx Packets, duration, time of receiving the last packet and Throughput, which shows the amount of received packets divided by the duration of sending packets)
This happens every 10 seconds.
### AverageDelayMonitor
It expresses data related to the time it takes for the packet to reach from the source to the destination ( Source address, destination address, Tx Packets, Rx Packets, duration, time of receiving the last packet, Sum of end to end Delay, Average of end to end Delay)
This happens every 10 seconds.
### static void GenerateTraffic (Ptr<Socket> socket, uint16_t data)
It creates a new packet and sets the data for it and also sets the header for it based on the sender. This happens every tenth of a second and a random number between 0 and 26 was created and sent to create the packet.

## Result
