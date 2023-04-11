set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Ideal-802.11n-5GHz-server_20MHz_800ns_2SS-client_20MHz_800ns_2SS.eps"
set title "Results for 802.11n-5GHz with Ideal\nserver: width=20MHz GI=800ns nss=2\nclient: width=20MHz GI=800ns nss=2"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:160]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
30 130
29 130
28 130
27 117
26 104
25 104
24 78
23 78
22 78
21 78
20 52
19 52
18 52
17 52
16 52
15 52
14 6
13 6
12 6
11 6
10 6
9 6
8 6
e
30 116.163
29 118.538
28 118.456
27 107.889
26 96.7475
25 94.8634
24 74.6291
23 71.7619
22 72.1715
21 72.2534
20 50.3808
19 48.169
18 0.32768
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
