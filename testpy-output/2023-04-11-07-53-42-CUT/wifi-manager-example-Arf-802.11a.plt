set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Arf-802.11a.eps"
set title "Results for 802.11a with Arf\n"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:30]
set yrange [0:60]
set key top left
plot "-"  title "802.11a-rate selected" with lines, "-"  title "802.11a-observed" with lines
27 54
26 48
25 48
24 36
23 36
22 24
21 24
20 24
19 18
18 18
17 18
16 18
15 18
14 18
13 18
12 18
11 18
10 18
9 18
8 18
e
27 11.8784
26 14.4998
25 13.7626
24 12.1242
23 10.9773
22 11.4688
21 11.6326
20 11.1411
19 9.58464
18 0.08192
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
