set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Ideal-802.11n-5GHz-server_40MHz_800ns_1SS-client_40MHz_800ns_1SS.eps"
set title "Results for 802.11n-5GHz with Ideal\nserver: width=40MHz GI=800ns nss=1\nclient: width=40MHz GI=800ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:160]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
30 135
29 135
28 135
27 121.5
26 108
25 108
24 81
23 81
22 81
21 81
20 54
19 54
18 54
17 40.5
16 40.5
15 40.5
14 40.5
13 40.5
12 6
11 6
10 6
9 6
8 6
e
30 120.422
29 123.208
28 122.388
27 112.23
26 99.369
25 98.1402
24 75.0387
23 74.6291
22 75.2026
21 74.9568
20 51.8554
19 49.9712
18 49.8893
17 38.5024
16 37.3555
15 0.4096
14 0
13 0
12 0
11 0
10 0
9 0
8 0
e
