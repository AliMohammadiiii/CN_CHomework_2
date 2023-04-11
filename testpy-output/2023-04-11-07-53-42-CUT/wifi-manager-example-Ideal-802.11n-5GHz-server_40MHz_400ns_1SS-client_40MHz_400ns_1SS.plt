set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Ideal-802.11n-5GHz-server_40MHz_400ns_1SS-client_40MHz_400ns_1SS.eps"
set title "Results for 802.11n-5GHz with Ideal\nserver: width=40MHz GI=400ns nss=1\nclient: width=40MHz GI=400ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:160]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
30 150
29 150
28 150
27 135
26 120
25 120
24 90
23 90
22 90
21 90
20 60
19 60
18 60
17 45
16 45
15 45
14 45
13 45
12 45
11 6
10 6
9 6
8 6
e
30 133.202
29 135.987
28 135.414
27 123.453
26 110.428
25 108.872
24 83.8042
23 83.3946
22 83.3126
21 83.1488
20 57.1802
19 55.5418
18 55.4598
17 42.6803
16 41.5334
15 1.14688
14 0
13 0
12 0
11 0
10 0
9 0
8 0
e
