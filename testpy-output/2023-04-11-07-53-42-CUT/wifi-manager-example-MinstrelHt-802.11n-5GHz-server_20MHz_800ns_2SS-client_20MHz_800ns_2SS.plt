set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-MinstrelHt-802.11n-5GHz-server_20MHz_800ns_2SS-client_20MHz_800ns_2SS.eps"
set title "Results for 802.11n-5GHz with MinstrelHt\nserver: width=20MHz GI=800ns nss=2\nclient: width=20MHz GI=800ns nss=2"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:160]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
30 78
29 117
28 117
27 130
26 130
25 117
24 117
23 104
22 104
21 78
20 78
19 78
18 78
17 78
16 78
15 78
14 104
13 39
12 39
11 52
10 117
9 104
8 52
e
30 45.6294
29 89.3747
28 107.561
27 110.838
26 98.7136
25 48.5786
24 46.6944
23 55.5418
22 10.6496
21 53.248
20 66.601
19 52.8384
18 0.49152
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
