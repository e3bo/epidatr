
<!-- README.md is generated from README.Rmd. Please edit that file -->

# epidatr

<!-- badges: start -->

<!-- badges: end -->

The goal of epidatr is to provide a convenient way for R users to access
data released by the [Delphi group’s](https://delphi.cmu.edu/) [Epidata
API](https://cmu-delphi.github.io/delphi-epidata/). Currently, it
provides accesss only to the FluView and COVID-19 API endpoints. This is
not an official R client for the API in any sense. Rather it is simply
one contributed option.

## Installation

This package may be installed from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("e3bo/epidatr")
```

## Example

View the covid data available:

``` r
library(epidatr)
covidcast(source = "covidcast_meta")$epidata
#>       data_source                    signal time_type geo_type min_time
#> 1   doctor-visits              smoothed_cli       day   county 20200201
#> 2   doctor-visits              smoothed_cli       day      msa 20200201
#> 3   doctor-visits              smoothed_cli       day    state 20200201
#> 4       fb-survey                   raw_cli       day   county 20200406
#> 5       fb-survey                   raw_cli       day      hrr 20200406
#> 6       fb-survey                   raw_cli       day      msa 20200406
#> 7       fb-survey                   raw_cli       day    state 20200406
#> 8       fb-survey                   raw_ili       day   county 20200406
#> 9       fb-survey                   raw_ili       day      hrr 20200406
#> 10      fb-survey                   raw_ili       day      msa 20200406
#> 11      fb-survey                   raw_ili       day    state 20200406
#> 12      fb-survey                  raw_wcli       day   county 20200406
#> 13      fb-survey                  raw_wcli       day      hrr 20200406
#> 14      fb-survey                  raw_wcli       day      msa 20200406
#> 15      fb-survey                  raw_wcli       day    state 20200406
#> 16      fb-survey                  raw_wili       day   county 20200406
#> 17      fb-survey                  raw_wili       day      hrr 20200406
#> 18      fb-survey                  raw_wili       day      msa 20200406
#> 19      fb-survey                  raw_wili       day    state 20200406
#> 20      fb-survey              smoothed_cli       day   county 20200406
#> 21      fb-survey              smoothed_cli       day      hrr 20200406
#> 22      fb-survey              smoothed_cli       day      msa 20200406
#> 23      fb-survey              smoothed_cli       day    state 20200406
#> 24      fb-survey              smoothed_ili       day   county 20200406
#> 25      fb-survey              smoothed_ili       day      hrr 20200406
#> 26      fb-survey              smoothed_ili       day      msa 20200406
#> 27      fb-survey              smoothed_ili       day    state 20200406
#> 28      fb-survey             smoothed_wcli       day   county 20200406
#> 29      fb-survey             smoothed_wcli       day      hrr 20200406
#> 30      fb-survey             smoothed_wcli       day      msa 20200406
#> 31      fb-survey             smoothed_wcli       day    state 20200406
#> 32      fb-survey             smoothed_wili       day   county 20200406
#> 33      fb-survey             smoothed_wili       day      hrr 20200406
#> 34      fb-survey             smoothed_wili       day      msa 20200406
#> 35      fb-survey             smoothed_wili       day    state 20200406
#> 36            ght                raw_search       day      dma 20200201
#> 37            ght                raw_search       day      hrr 20200201
#> 38            ght                raw_search       day      msa 20200201
#> 39            ght                raw_search       day    state 20200201
#> 40            ght           smoothed_search       day      dma 20200201
#> 41            ght           smoothed_search       day      hrr 20200201
#> 42            ght           smoothed_search       day      msa 20200201
#> 43            ght           smoothed_search       day    state 20200201
#> 44  google-survey                   raw_cli       day   county 20200411
#> 45  google-survey                   raw_cli       day      hrr 20200411
#> 46  google-survey                   raw_cli       day      msa 20200411
#> 47  google-survey                   raw_cli       day    state 20200411
#> 48  google-survey              smoothed_cli       day   county 20200411
#> 49  google-survey              smoothed_cli       day      hrr 20200411
#> 50  google-survey              smoothed_cli       day      msa 20200411
#> 51  google-survey              smoothed_cli       day    state 20200411
#> 52         quidel          raw_pct_negative       day      msa 20200131
#> 53         quidel          raw_pct_negative       day    state 20200131
#> 54         quidel      raw_tests_per_device       day      msa 20200131
#> 55         quidel      raw_tests_per_device       day    state 20200131
#> 56         quidel     smoothed_pct_negative       day      msa 20200131
#> 57         quidel     smoothed_pct_negative       day    state 20200131
#> 58         quidel smoothed_tests_per_device       day      msa 20200131
#> 59         quidel smoothed_tests_per_device       day    state 20200131
#> 60 youtube-survey                   raw_cli       day    state 20200421
#> 61 youtube-survey                   raw_ili       day    state 20200421
#> 62 youtube-survey              smoothed_cli       day    state 20200421
#> 63 youtube-survey              smoothed_ili       day    state 20200421
#>    max_time num_locations         last_update  min_value   max_value mean_value
#> 1  20200427          1480 2020-04-28 03:36:03  0.0000000   73.235214  0.5706771
#> 2  20200427           369 2020-04-28 03:36:02  0.0000000   13.819223  0.5971816
#> 3  20200427            51 2020-04-28 03:36:02  0.0000000   12.267728  0.8233931
#> 4  20200427           640 2020-04-28 11:51:22  0.0000000   19.047619  0.7144052
#> 5  20200427           306 2020-04-28 11:51:22  0.0000000    4.550654  0.6923706
#> 6  20200427           341 2020-04-28 11:51:21  0.0000000    4.014265  0.6787136
#> 7  20200427            51 2020-04-28 11:51:23  0.0000000    3.168093  0.6983119
#> 8  20200427           640 2020-04-28 11:51:22  0.0000000   19.047619  0.7386560
#> 9  20200427           306 2020-04-28 11:51:22  0.0000000    4.550654  0.7139529
#> 10 20200427           341 2020-04-28 11:51:21  0.0000000    4.702592  0.7006705
#> 11 20200427            51 2020-04-28 11:51:23  0.0000000    3.168093  0.7198422
#> 12 20200425           637 2020-04-27 12:51:24  0.0000000   19.047619  0.7391345
#> 13 20200425           306 2020-04-27 12:51:25  0.0000000    4.549792  0.7202286
#> 14 20200425           339 2020-04-27 12:51:25  0.0000000    3.936737  0.7055678
#> 15 20200425            51 2020-04-27 12:51:26  0.0000000    3.040061  0.7275602
#> 16 20200425           637 2020-04-27 12:51:25  0.0000000   19.047619  0.7609506
#> 17 20200425           306 2020-04-27 12:51:25  0.0000000    4.549792  0.7400730
#> 18 20200425           339 2020-04-27 12:51:25  0.0000000    3.936737  0.7261224
#> 19 20200425            51 2020-04-27 12:51:26  0.0000000    3.040061  0.7457900
#> 20 20200427          1500 2020-04-28 11:51:22  0.0000000    5.195195  0.7525928
#> 21 20200427           306 2020-04-28 11:51:22  0.0000000    4.550654  0.7500709
#> 22 20200427           381 2020-04-28 11:51:23  0.0000000    4.052366  0.7387999
#> 23 20200427            52 2020-04-28 11:51:21  0.2149121    1.743573  0.7389647
#> 24 20200427          1500 2020-04-28 11:51:22  0.0000000    5.285285  0.7782750
#> 25 20200427           306 2020-04-28 11:51:22  0.0000000    4.550654  0.7735545
#> 26 20200427           381 2020-04-28 11:51:23  0.0000000    4.052366  0.7635918
#> 27 20200427            52 2020-04-28 11:51:22  0.1782531    2.158709  0.7621486
#> 28 20200425          1486 2020-04-27 12:51:25  0.0000000    5.251973  0.7666973
#> 29 20200425           306 2020-04-27 12:51:25  0.0000000    4.549792  0.7670249
#> 30 20200425           380 2020-04-27 12:51:26  0.0000000    3.994253  0.7572458
#> 31 20200425            51 2020-04-27 12:51:26  0.2177483    1.664537  0.7555253
#> 32 20200425          1486 2020-04-27 12:51:25  0.0000000    5.343048  0.7919117
#> 33 20200425           306 2020-04-27 12:51:25  0.0000000    4.549792  0.7892303
#> 34 20200425           380 2020-04-27 12:51:26  0.0000000    3.994253  0.7807388
#> 35 20200425            51 2020-04-27 12:51:26  0.1897764    2.014686  0.7751425
#> 36 20200426           210 2020-04-28 14:51:17  0.0000000 1398.653702 16.9971548
#> 37 20200426           306 2020-04-28 14:51:17  0.0000000  636.939665 20.0956881
#> 38 20200426           381 2020-04-28 14:51:18  0.0000000 1398.653702 19.4433401
#> 39 20200426            51 2020-04-28 14:51:19  0.0000000  414.708322 20.8343282
#> 40 20200426           210 2020-04-28 14:51:17  0.0000000  509.889675 17.6632212
#> 41 20200426           306 2020-04-28 14:51:17  0.0000000  250.830641 20.5333647
#> 42 20200426           381 2020-04-28 14:51:19  0.0000000  509.889675 19.9775759
#> 43 20200426            51 2020-04-28 14:51:19  0.0000000  230.063609 21.2288801
#> 44 20200427           647 2020-04-28 23:51:11  1.2484745   56.640095  8.0024735
#> 45 20200427           282 2020-04-28 23:51:11  3.5139092   23.873527  8.0319405
#> 46 20200427           324 2020-04-28 23:51:11  3.1478359   20.289826  7.8525832
#> 47 20200427            51 2020-04-28 23:51:12  3.9650725   18.793377  7.8381840
#> 48 20200427           647 2020-04-28 23:51:11  1.7713140   48.287588  8.1021197
#> 49 20200427           282 2020-04-28 23:51:11  4.5130650   22.726557  8.1703642
#> 50 20200427           324 2020-04-28 23:51:12  3.0182232   19.136784  7.9680049
#> 51 20200427            51 2020-04-28 23:51:12  5.3045030   18.473526  7.9292328
#> 52 20200425           131 2020-04-28 00:51:23 39.2156860  100.000000 73.4742799
#> 53 20200426            43 2020-04-28 00:51:23 43.6363640  100.000000 76.4161069
#> 54 20200425           131 2020-04-28 00:51:23  1.5142860   27.000000  4.2021544
#> 55 20200426            43 2020-04-28 00:51:23  1.4698800   13.777778  3.5013908
#> 56 20200426           306 2020-04-28 00:51:23 23.0769230  100.000000 78.0427281
#> 57 20200426            51 2020-04-28 00:51:23 48.7179490  100.000000 78.1237337
#> 58 20200426           306 2020-04-28 00:51:23  1.1320750   14.222222  3.1917105
#> 59 20200426            51 2020-04-28 00:51:23  1.1818180    9.600000  3.1124254
#> 60 20200427            17 2020-04-28 20:51:18  0.0000000    3.083082  0.9706632
#> 61 20200427            17 2020-04-28 20:51:18  0.0000000    3.195694  0.9632811
#> 62 20200427            42 2020-04-28 20:51:18  0.0000000    2.710027  0.9889971
#> 63 20200427            42 2020-04-28 20:51:18  0.0000000    2.710027  0.9985249
#>    stdev_value
#> 1    1.2385232
#> 2    1.0848676
#> 3    1.3164337
#> 4    0.6236649
#> 5    0.5292236
#> 6    0.5332757
#> 7    0.3449335
#> 8    0.6315601
#> 9    0.5382150
#> 10   0.5415173
#> 11   0.3550588
#> 12   0.6301960
#> 13   0.5599698
#> 14   0.5377966
#> 15   0.3693548
#> 16   0.6332944
#> 17   0.5683487
#> 18   0.5428753
#> 19   0.3794692
#> 20   0.4888514
#> 21   0.3477013
#> 22   0.4012374
#> 23   0.2094492
#> 24   0.4979047
#> 25   0.3556131
#> 26   0.4134448
#> 27   0.2195189
#> 28   0.4891362
#> 29   0.3595650
#> 30   0.4024527
#> 31   0.2085926
#> 32   0.4983520
#> 33   0.3679803
#> 34   0.4136509
#> 35   0.2171235
#> 36  44.3331640
#> 37  35.4894254
#> 38  39.1363384
#> 39  31.4691189
#> 40  27.2776906
#> 41  25.1370974
#> 42  25.7023994
#> 43  24.4016816
#> 44   2.5336145
#> 45   2.2157817
#> 46   1.9255825
#> 47   1.7897385
#> 48   2.3587150
#> 49   2.1180629
#> 50   1.7235697
#> 51   1.7566302
#> 52  11.6258058
#> 53  12.6475467
#> 54   2.0054390
#> 55   1.3445990
#> 56  13.2978741
#> 57  13.0131340
#> 58   1.4207047
#> 59   1.0799799
#> 60   0.5808291
#> 61   0.5966682
#> 62   0.4740300
#> 63   0.4661600
```

Make a request with the default query:

``` r
covidcast()
#> $epidata
#>   geo_value time_value direction    value   stderr sample_size
#> 1        ny   20200415         0 8.097337 0.290328          NA
#> 
#> $url
#> [1] "https://delphi.cmu.edu/epidata/api.php?source=covidcast&data_source=doctor-visits&signal=smoothed_cli&time_type=day&time_values=20200415&geo_type=state&geo_value=NY"
#> 
#> $response
#> Response [https://delphi.cmu.edu/epidata/api.php?source=covidcast&data_source=doctor-visits&signal=smoothed_cli&time_type=day&time_values=20200415&geo_type=state&geo_value=NY]
#>   Date: 2020-04-29 00:05
#>   Status: 200
#>   Content-Type: application/json
#>   Size: 153 B
#> 
#> 
#> attr(,"class")
#> [1] "epidata_api"
```

Choose a different set of dates and view the data frame:

``` r

covidcast(time_values = "20200412-20200415,20200418")$epidata
#>   geo_value time_value direction     value   stderr sample_size
#> 1        ny   20200412        -1  8.798623 0.286196          NA
#> 2        ny   20200413        -1 10.288235 0.365505          NA
#> 3        ny   20200414         0  9.133034 0.327076          NA
#> 4        ny   20200415         0  8.097337 0.290328          NA
#> 5        ny   20200418        -1  5.731982 0.211711          NA
```

Provide a query
string:

``` r
query <- "source=covidcast&data_source=fb-survey&signal=smoothed_cli&time_type=day&geo_type=county&time_values=20200406&geo_value=01000"
covidcast(query=query)$epidata
#>   geo_value time_value direction    value    stderr sample_size
#> 1     01000   20200406        NA 1.169338 0.1898255    1451.033
```

Access archived ILInet data:

``` r
fluview(epiweeks = "202001", regions = "flusight", lag = 0)$epidata
#>    release_date region  issue epiweek lag num_ili num_patients num_providers
#> 1    2020-01-10   hhs1 202001  202001   0    5227       120969           240
#> 2    2020-01-10  hhs10 202001  202001   0    3892        68825           147
#> 3    2020-01-10   hhs2 202001  202001   0   12573       189157           227
#> 4    2020-01-10   hhs3 202001  202001   0   14972       237216           359
#> 5    2020-01-10   hhs4 202001  202001   0   23870       316671           500
#> 6    2020-01-10   hhs5 202001  202001   0    5900       133137           314
#> 7    2020-01-10   hhs6 202001  202001   0    8761        98093           238
#> 8    2020-01-10   hhs7 202001  202001   0    2111        29290           112
#> 9    2020-01-10   hhs8 202001  202001   0    4095        72634           209
#> 10   2020-01-10   hhs9 202001  202001   0    2653        55054           128
#> 11   2020-01-10    nat 202001  202001   0   84054      1321046          2474
#>    num_age_0 num_age_1 num_age_2 num_age_3 num_age_4 num_age_5    wili     ili
#> 1        948      1276        NA      1814       668       521 3.88941 4.32094
#> 2        892      1131        NA      1192       357       320 5.54917 5.65492
#> 3       3490      3270        NA      3560      1279       974 7.01869 6.64686
#> 4       3197      4121        NA      4941      1540      1173 5.65482 6.31155
#> 5       5770      5886        NA      7923      2562      1729 6.18271 7.53779
#> 6       2032      1552        NA      1466       473       377 3.55005 4.43153
#> 7       2234      2365        NA      2659       864       639 8.58010 8.93132
#> 8        605       601        NA       584       179       142 5.59845 7.20724
#> 9       1023      1163        NA      1132       417       360 5.87016 5.63786
#> 10       663       636        NA       732       299       323 5.18549 4.81891
#> 11     20854     22001        NA     26003      8638      6558 5.78202 6.36269
```
