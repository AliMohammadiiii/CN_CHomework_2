set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-MinstrelHt-802.11n-5GHz-server_40MHz_800ns_1SS-client_40MHz_800ns_1SS.eps"
set title "Results for 802.11n-5GHz with MinstrelHt\nserver: width=40MHz GI=800ns nss=1\nclient: width=40MHz GI=800ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:160]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
30 81
29 121.5
28 121.5
27 135
26 135
25 121.5
24 121.5
23 81
22 81
21 81
20 81
19 81
18 135
17 81
16 54
15 13.5
14 13.5
13 13.5
12 81
11 54
10 54
9 54
8 135
e
30 47.2678
29 92.8154
28 111.493
27 112.722
26 85.6064
25 68.567
24 22.1184
23 65.6179
22 74.8749
21 74.793
20 67.8298
19 43.0899
18 21.8726
17 17.6947
16 23.1014
15 0
14 0
13 0
12 0
11 0
10 0
9 0
8 0
e
