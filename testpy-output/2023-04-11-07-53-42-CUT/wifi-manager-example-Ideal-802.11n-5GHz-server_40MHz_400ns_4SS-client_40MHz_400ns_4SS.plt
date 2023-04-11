set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Ideal-802.11n-5GHz-server_40MHz_400ns_4SS-client_40MHz_400ns_4SS.eps"
set title "Results for 802.11n-5GHz with Ideal\nserver: width=40MHz GI=400ns nss=4\nclient: width=40MHz GI=400ns nss=4"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:640]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
30 600
29 600
28 600
27 540
26 480
25 480
24 360
23 360
22 360
21 360
20 270
19 240
18 240
17 180
16 180
15 180
14 180
13 180
12 180
11 6
10 6
9 6
8 6
e
30 454.001
29 460.964
28 463.667
27 421.97
26 383.959
25 381.583
24 303.432
23 301.629
22 300.319
21 301.629
20 235.684
19 211.354
18 209.388
17 161.546
16 160.645
15 0.24576
14 0
13 0
12 0
11 0
10 0
9 0
8 0
e
