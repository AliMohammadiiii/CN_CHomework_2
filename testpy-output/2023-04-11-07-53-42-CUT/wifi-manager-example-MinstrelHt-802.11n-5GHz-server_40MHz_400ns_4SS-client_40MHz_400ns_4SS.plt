set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-MinstrelHt-802.11n-5GHz-server_40MHz_400ns_4SS-client_40MHz_400ns_4SS.eps"
set title "Results for 802.11n-5GHz with MinstrelHt\nserver: width=40MHz GI=400ns nss=4\nclient: width=40MHz GI=400ns nss=4"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:35]
set yrange [0:640]
set key top left
plot "-"  title "802.11n-5GHz-rate selected" with lines, "-"  title "802.11n-5GHz-observed" with lines
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
10 54
9 27
8 40.5
e
30 16.3021
29 23.6749
28 24.0026
27 25.8048
26 26.3782
25 26.4602
24 26.4602
23 28.9997
22 37.1098
21 37.7651
20 49.152
19 49.5616
18 49.8074
17 47.5955
16 49.4797
15 1.47456
14 0
13 0
12 0
11 0
10 0
9 0
8 0
e
