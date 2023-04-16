set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Ideal-802.11ax-2.4GHz-server_20MHz_800ns_1SS-client_20MHz_800ns_1SS.eps"
set title "Results for 802.11ax-2.4GHz with Ideal\nserver: width=20MHz GI=800ns nss=1\nclient: width=20MHz GI=800ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:60]
set yrange [0:160]
set key top left
plot "-"  title "802.11ax-2.4GHz-rate selected" with lines, "-"  title "802.11ax-2.4GHz-observed" with lines
55 143.382
54 143.382
53 143.382
52 143.382
51 143.382
50 143.382
49 143.382
48 143.382
47 143.382
46 143.382
45 143.382
44 143.382
43 143.382
42 129.044
41 129.044
40 114.706
39 114.706
38 114.706
37 114.706
36 114.706
35 114.706
34 114.706
33 114.706
32 103.235
31 86.0294
30 86.0294
29 86.0294
28 86.0294
27 77.4265
26 68.8235
25 68.8235
24 51.6176
23 51.6176
22 51.6176
21 51.6176
20 34.4118
19 34.4118
18 34.4118
17 34.4118
16 34.4118
15 1
14 1
13 1
12 1
11 1
10 1
e
55 111.985
54 125.829
53 126.566
52 125.829
51 124.6
50 127.468
49 125.092
48 126.812
47 126.894
46 125.747
45 126.239
44 126.157
43 125.501
42 114.36
41 113.213
40 102.318
39 102.4
38 102.236
37 102.81
36 102.072
35 103.137
34 101.499
33 99.9424
32 92.6515
31 79.2986
30 77.9878
29 77.9878
28 77.9878
27 69.632
26 62.6688
25 60.9485
24 47.8413
23 46.6125
22 47.0221
21 46.6944
20 31.9488
19 31.1296
18 0.16384
17 0
16 0
15 0
14 0
13 0
12 0
11 0
10 0
e