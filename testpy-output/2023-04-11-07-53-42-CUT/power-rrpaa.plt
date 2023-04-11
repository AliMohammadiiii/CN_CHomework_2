set terminal post eps color enhanced
set output "power-rrpaa.eps"
set title "Average transmit power (AP to STA) vs time"
set xlabel "Time (seconds)"
set ylabel "Power (mW)"
plot "-"  title "Average Transmit Power" with lines
5 7.28115
15 3.51294
25 17.3639
35 30.9014
45 33.1136
e
