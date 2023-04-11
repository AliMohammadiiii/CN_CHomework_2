set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Ideal-802.11n-2.4GHz-server_40MHz_400ns_4SS-client_40MHz_400ns_4SS.eps"
set title "Results for 802.11n-2.4GHz with Ideal\nserver: width=40MHz GI=400ns nss=4\nclient: width=40MHz GI=400ns nss=4"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:640]
set key top left
plot "-"  title "802.11n-2.4GHz-rate selected" with lines, "-"  title "802.11n-2.4GHz-observed" with lines
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
11 1
10 1
9 1
8 1
e
30 372.244
29 417.382
28 416.809
27 386.417
26 347.341
25 347.75
24 282.624
23 282.87
22 284.836
21 276.398
20 224.215
19 202.015
18 200.131
17 157.286
16 155.566
15 0.73728
14 0
13 0
12 0
11 0
10 0
9 0
8 0
e
