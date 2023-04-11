set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-MinstrelHt-802.11n-5GHz-server_20MHz_400ns_1SS-client_20MHz_400ns_1SS.eps"
set title "Results for 802.11n-5GHz with MinstrelHt\nserver: width=20MHz GI=400ns nss=1\nclient: width=20MHz GI=400ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:80]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
30 43.3333
29 65
28 65
27 65
26 65
25 65
24 65
23 43.3333
22 43.3333
21 43.3333
20 43.3333
19 43.3333
18 43.3333
17 43.3333
16 43.3333
15 43.3333
14 39
13 28.8889
12 43.3333
11 43.3333
10 43.3333
9 39
8 28.8889
e
30 27.1155
29 49.0701
28 60.1293
27 59.6378
26 59.2282
25 46.5306
24 10.5677
23 36.0448
22 40.1408
21 39.895
20 36.7002
19 21.7088
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
