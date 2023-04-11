set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-MinstrelHt-802.11n-2.4GHz-server_40MHz_400ns_4SS-client_40MHz_400ns_4SS.eps"
set title "Results for 802.11n-2.4GHz with MinstrelHt\nserver: width=40MHz GI=400ns nss=4\nclient: width=40MHz GI=400ns nss=4"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:640]
set key top left
plot "-"  title "802.11n-2.4GHz-rate selected" with lines, "-"  title "802.11n-2.4GHz-observed" with lines
30 26
29 26
28 26
27 28.8889
26 28.8889
25 28.8889
24 28.8889
23 40.5
22 40.5
21 40.5
20 54
19 54
18 54
17 54
16 54
15 54
14 54
13 54
12 54
11 54
10 28.8889
9 54
8 40.5
e
30 15.401
29 23.2653
28 23.593
27 25.8048
26 25.8048
25 25.9686
24 25.8867
23 30.0646
22 36.2906
21 36.2086
20 47.104
19 48.6605
18 48.7424
17 46.6125
16 48.4966
15 0.4096
14 0
13 0
12 0
11 0
10 0
9 0
8 0
e
