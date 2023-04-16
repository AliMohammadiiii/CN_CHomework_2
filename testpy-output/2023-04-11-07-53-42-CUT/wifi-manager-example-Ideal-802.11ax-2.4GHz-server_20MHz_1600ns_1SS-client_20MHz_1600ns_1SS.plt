set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-Ideal-802.11ax-2.4GHz-server_20MHz_1600ns_1SS-client_20MHz_1600ns_1SS.eps"
set title "Results for 802.11ax-2.4GHz with Ideal\nserver: width=20MHz GI=1600ns nss=1\nclient: width=20MHz GI=1600ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:60]
set yrange [0:160]
set key top left
plot "-"  title "802.11ax-2.4GHz-rate selected" with lines, "-"  title "802.11ax-2.4GHz-observed" with lines
55 135.417
54 135.417
53 135.417
52 135.417
51 135.417
50 135.417
49 135.417
48 135.417
47 135.417
46 135.417
45 135.417
44 135.417
43 135.417
42 135.417
41 121.875
40 108.333
39 108.333
38 108.333
37 108.333
36 108.333
35 108.333
34 108.333
33 108.333
32 97.5
31 81.25
30 81.25
29 81.25
28 81.25
27 73.125
26 65
25 65
24 48.75
23 48.75
22 48.75
21 48.75
20 32.5
19 32.5
18 32.5
17 32.5
16 32.5
15 1
14 1
13 1
12 1
11 1
10 1
e
55 106.086
54 119.112
53 119.931
52 119.685
51 119.603
50 119.276
49 120.013
48 119.276
47 119.931
46 119.849
45 119.931
44 119.849
43 119.03
42 115.917
41 107.725
40 96.4198
39 97.6486
38 97.0752
37 96.8294
36 97.239
35 96.6656
34 97.8944
33 94.8634
32 87.8182
31 73.8918
30 73.728
29 73.5642
28 73.8099
27 66.519
26 59.3101
25 57.9994
24 44.8922
23 43.6634
22 44.3187
21 43.9091
20 30.8838
19 29.2454
18 1.55648
17 0
16 0
15 0
14 0
13 0
12 0
11 0
10 0
e