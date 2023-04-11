set terminal post eps color enhanced
set output "power-aparf.eps"
set title "Average transmit power (AP to STA) vs time"
set xlabel "Time (seconds)"
set ylabel "Power (mW)"
plot "-"  title "Average Transmit Power" with lines
5 0.739296
15 3.36961
25 16.094
35 17.3712
45 24.9901
e
