set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Ideal-802.11ax-2.4GHz-server_20MHz_3200ns_1SS-client_20MHz_3200ns_1SS.eps"
set title "Results for 802.11ax-2.4GHz with Ideal\nserver: width=20MHz GI=3200ns nss=1\nclient: width=20MHz GI=3200ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:60]
set yrange [0:160]
set key top left
plot "-"  title "802.11ax-2.4GHz-rate selected" with lines, "-"  title "802.11ax-2.4GHz-observed" with lines
55 121.875
54 121.875
53 121.875
52 121.875
51 121.875
50 121.875
49 121.875
48 121.875
47 121.875
46 121.875
45 121.875
44 121.875
43 121.875
42 121.875
41 109.688
40 109.688
39 97.5
38 97.5
37 97.5
36 97.5
35 97.5
34 97.5
33 97.5
32 87.75
31 73.125
30 73.125
29 73.125
28 73.125
27 65.8125
26 58.5
25 58.5
24 43.875
23 43.875
22 43.875
21 43.875
20 29.25
19 29.25
18 29.25
17 29.25
16 29.25
15 1
14 1
13 1
12 1
11 1
10 1
e
55 96.5018
54 108.134
53 108.462
52 108.462
51 108.38
50 108.052
49 109.281
48 107.397
47 109.036
46 108.872
45 108.462
44 108.462
43 109.036
42 107.725
41 98.8774
40 97.239
39 87.7363
38 87.4086
37 88.3098
36 87.6544
35 88.1459
34 87.5725
33 86.6714
32 78.4794
31 66.9286
30 66.2733
29 66.3552
28 65.8637
27 60.0474
26 53.9034
25 52.9203
24 40.3866
23 39.3216
22 39.6493
21 39.6493
20 26.8698
19 26.5421
18 0.4096
17 0
16 0
15 0
14 0
13 0
12 0
11 0
10 0
e
