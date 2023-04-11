set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Ideal-802.11n-5GHz-server_20MHz_400ns_1SS-client_20MHz_400ns_1SS.eps"
set title "Results for 802.11n-5GHz with Ideal\nserver: width=20MHz GI=400ns nss=1\nclient: width=20MHz GI=400ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:80]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
30 72.2222
29 72.2222
28 72.2222
27 65
26 57.7778
25 57.7778
24 43.3333
23 43.3333
22 43.3333
21 43.3333
20 28.8889
19 28.8889
18 28.8889
17 28.8889
16 28.8889
15 6
14 6
13 6
12 6
11 6
10 6
9 6
8 6
e
30 65.3722
29 66.7648
28 66.7648
27 60.5389
26 54.0672
25 53.1661
24 40.96
23 40.2227
22 40.0589
21 39.895
20 27.5251
19 26.7878
18 1.14688
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
