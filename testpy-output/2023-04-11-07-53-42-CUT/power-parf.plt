set terminal post eps color enhanced
set output "power-parf.eps"
set title "Average transmit power (AP to STA) vs time"
set xlabel "Time (seconds)"
set ylabel "Power (mW)"
plot "-"  title "Average Transmit Power" with lines
5 1.09953
15 3.22759
25 15.4272
35 31.2371
45 36.6999
e
