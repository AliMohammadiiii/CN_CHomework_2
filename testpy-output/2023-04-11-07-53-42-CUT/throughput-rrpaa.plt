set terminal post eps color enhanced
set output "throughput-rrpaa.eps"
set title "Throughput (AP to STA) vs time"
set xlabel "Time (seconds)"
set ylabel "Throughput (Mb/s)"
plot "-"  title "Throughput Mbits/s" with lines
5 27.6502
15 25.9462
25 26.3779
35 20.1299
45 14.5067
e
