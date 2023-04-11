set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Minstrel-802.11p-5MHz.eps"
set title "Results for 802.11p-5MHz with Minstrel\n"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:30]
set yrange [0:60]
set key top left
plot "-"  title "802.11p-5MHz-rate selected" with lines, "-"  title "802.11p-5MHz-observed" with lines
27 1.5
26 9
25 13.5
24 9
23 12
22 6
21 9
20 1.5
19 13.5
18 12
17 6
16 6
15 12
14 1.5
13 13.5
12 9
11 6
10 9
9 9
8 6
e
27 1.39264
26 5.48864
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
