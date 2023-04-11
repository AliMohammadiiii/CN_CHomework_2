set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-MinstrelHt-802.11ac-server_80MHz_400ns_1SS-client_80MHz_400ns_1SS.eps"
set title "Results for 802.11ac with MinstrelHt\nserver: width=80MHz GI=400ns nss=1\nclient: width=80MHz GI=400ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:55]
set yrange [0:480]
set key top left
plot "-"  title "802.11ac-rate selected" with lines, "-"  title "802.11ac-observed" with lines
50 150
49 292.5
48 325
47 390
46 390
45 433.333
44 433.333
43 433.333
42 433.333
41 433.333
40 433.333
39 433.333
38 433.333
37 433.333
36 433.333
35 433.333
34 433.333
33 433.333
32 433.333
31 325
30 325
29 325
28 325
27 325
26 325
25 260
24 260
23 260
22 180
21 150
20 180
19 150
18 200
17 52
16 52
15 260
14 29.25
13 108
12 150
11 65
10 390
e
50 87.3267
49 249.119
48 275.825
47 298.435
46 326.697
45 353.731
44 354.877
43 355.86
42 358.564
41 345.702
40 357.908
39 345.293
38 356.434
37 354.304
36 356.352
35 352.256
34 353.567
33 337.265
32 281.559
31 158.106
30 264.684
29 276.562
28 261.98
27 256.819
26 168.018
25 91.095
24 193.249
23 76.6771
22 5.16096
21 0
20 4.01408
19 3.60448
18 1.88416
17 9.0112
16 0
15 12.9434
14 14.336
13 9.33888
12 0
11 0
10 0
e
