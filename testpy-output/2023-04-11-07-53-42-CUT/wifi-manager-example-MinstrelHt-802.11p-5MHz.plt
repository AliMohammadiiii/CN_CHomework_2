set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-MinstrelHt-802.11p-5MHz.eps"
set title "Results for 802.11p-5MHz with MinstrelHt\n"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:30]
set yrange [0:60]
set key top left
plot "-"  title "802.11p-5MHz-rate selected" with lines, "-"  title "802.11p-5MHz-observed" with lines
27 9
26 13.5
25 9
24 12
23 9
22 12
21 9
20 9
19 9
18 12
17 13.5
16 9
15 12
14 9
13 12
12 13.5
11 9
10 9
9 12
8 9
e
27 3.52256
26 4.66944
25 0.08192
24 0
23 0
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
