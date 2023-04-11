set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Ideal-802.11n-5GHz-server_20MHz_800ns_1SS-client_20MHz_800ns_1SS.eps"
set title "Results for 802.11n-5GHz with Ideal\nserver: width=20MHz GI=800ns nss=1\nclient: width=20MHz GI=800ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:80]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
30 65
29 65
28 65
27 58.5
26 52
25 52
24 39
23 39
22 39
21 39
20 26
19 26
18 26
17 26
16 26
15 6
14 6
13 6
12 6
11 6
10 6
9 6
8 6
e
30 58.8186
29 60.1293
28 60.1293
27 54.4768
26 48.2509
25 47.5955
24 37.1098
23 36.2086
22 35.9629
21 35.881
20 24.9037
19 24.0845
18 0.90112
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
