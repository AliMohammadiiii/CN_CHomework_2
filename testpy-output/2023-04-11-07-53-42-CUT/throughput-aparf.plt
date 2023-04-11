set terminal post eps color enhanced
set output "throughput-aparf.eps"
set title "Throughput (AP to STA) vs time"
set xlabel "Time (seconds)"
set ylabel "Throughput (Mb/s)"
plot "-"  title "Throughput Mbits/s" with lines
5 29.1043
15 23.3789
25 23.5379
35 15.8472
45 14.2227
e
