set terminal postscript eps color enh "Times-BoldItalic"
set output "wifi-manager-example-MinstrelHt-802.11ac-server_160MHz_400ns_1SS-client_160MHz_400ns_1SS.eps"
set title "Results for 802.11ac with MinstrelHt\nserver: width=160MHz GI=400ns nss=1\nclient: width=160MHz GI=400ns nss=1"
set xlabel "SNR (dB)"
set ylabel "Rate (Mb/s)"
set xrange [0:55]
set yrange [0:960]
set key top left
plot "-"  title "802.11ac-rate selected" with lines, "-"  title "802.11ac-observed" with lines
50 150
49 292.5
48 325
47 585
46 650
45 650
44 650
43 780
42 866.667
41 866.667
40 866.667
39 866.667
38 866.667
37 866.667
36 866.667
35 866.667
34 866.667
33 866.667
32 866.667
31 650
30 650
29 650
28 650
27 650
26 650
25 520
24 520
23 520
22 468
21 292.5
20 260
19 260
18 175.5
17 650
16 150
15 135
14 195
13 195
12 263.25
11 150
10 135
e
50 86.0979
49 247.398
48 277.053
47 442.614
46 474.563
45 498.237
44 502.743
43 568.607
42 620.462
41 617.677
40 614.646
39 615.793
38 620.544
37 601.047
36 619.725
35 588.677
34 599.327
33 574.341
32 462.029
31 236.012
30 476.201
29 472.924
28 496.845
27 423.69
26 283.607
25 68.4851
24 322.437
23 85.7702
22 0.57344
21 0
20 40.0589
19 0
18 64.1434
17 71.0246
16 59.9654
15 0
14 24.4122
13 121.487
12 45.3837
11 17.0394
10 15.0733
e