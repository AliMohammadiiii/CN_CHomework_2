set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-MinstrelHt-802.11p-10MHz.eps"
set title "Results for 802.11p-10MHz with MinstrelHt\n"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:30]
set yrange [0:60]
set key top left
plot "-"  title "802.11p-10MHz-rate selected" with lines, "-"  title "802.11p-10MHz-observed" with lines
27 18
26 24
25 24
24 24
23 18
22 12
21 27
20 24
19 18
18 12
17 12
16 27
15 12
14 12
13 18
12 12
11 18
10 6
9 12
8 6
e
27 6.71744
26 11.223
25 6.71744
24 2.53952
23 0.32768
22 0
21 0
20 0
19 0
18 0
17 0
16 0
15 0
14 0
13 0
12 0
11 0
10 0
9 0
8 0
e
