set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-MinstrelHt-802.11n-5GHz-server_40MHz_400ns_1SS-client_40MHz_400ns_1SS.eps"
set title "Results for 802.11n-5GHz with MinstrelHt\nserver: width=40MHz GI=400ns nss=1\nclient: width=40MHz GI=400ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:160]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
30 43.3333
29 81
28 81
27 90
26 90
25 90
24 90
23 90
22 90
21 90
20 90
19 90
18 43.3333
17 81
16 81
15 15
14 15
13 90
12 43.3333
11 81
10 13.5
9 13.5
8 15
e
30 25.2314
29 55.7056
28 74.9568
27 81.7562
26 83.2307
25 83.2307
24 83.2307
23 79.2166
22 83.2307
21 82.985
20 79.5443
19 43.3357
18 13.6806
17 17.5309
16 12.6976
15 0
14 0
13 0
12 0
11 0
10 0
9 0
8 0
e
