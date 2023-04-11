set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Minstrel-802.11b.eps"
set title "Results for 802.11b with Minstrel\n"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [-6:15]
set yrange [0:15]
set key top left
plot "-"  title "802.11b-rate selected" with lines, "-"  title "802.11b-observed" with lines
11 1
10 1
9 1
8 11
7 1
6 11
5 1
4 11
3 11
2 1
1 1
0 11
e
11 0
10 0
9 0
8 0
7 0
6 0
5 0
4 0
3 0
2 0
1 0
0 0
e
