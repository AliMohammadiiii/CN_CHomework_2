set terminal post eps color enhanced
set output "throughput-parf.eps"
set title "Throughput (AP to STA) vs time"
set xlabel "Time (seconds)"
set ylabel "Throughput (Mb/s)"
plot "-"  title "Throughput Mbits/s" with lines
5 29.1043
15 22.7882
25 23.0722
35 20.2435
45 15.6768
e
