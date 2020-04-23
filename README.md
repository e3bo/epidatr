
<!-- README.md is generated from README.Rmd. Please edit that file -->

# epidatr

<!-- badges: start -->

<!-- badges: end -->

The goal of epidatr is to provide a convenient way for R users to access
data released by the [Delphi group’s](https://delphi.cmu.edu/)
[Epidemiological API](https://cmu-delphi.github.io/delphi-epidata/).
Currently, it provides accesss only to the COVID-19 API endpoints. This
is not an official R client for the API in any sense. Rather it is
simply one contributed option.

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
#>      data_source                    signal time_type geo_type min_time max_time
#> 1  doctor-visits              smoothed_cli       day   county 20200201 20200422
#> 2  doctor-visits              smoothed_cli       day      msa 20200201 20200422
#> 3  doctor-visits              smoothed_cli       day    state 20200201 20200422
#> 4      fb-survey                   raw_cli       day   county 20200406 20200421
#> 5      fb-survey                   raw_cli       day      hrr 20200406 20200421
#> 6      fb-survey                   raw_cli       day      msa 20200406 20200421
#> 7      fb-survey                   raw_cli       day    state 20200406 20200421
#> 8      fb-survey                   raw_ili       day   county 20200406 20200421
#> 9      fb-survey                   raw_ili       day      hrr 20200406 20200421
#> 10     fb-survey                   raw_ili       day      msa 20200406 20200421
#> 11     fb-survey                   raw_ili       day    state 20200406 20200421
#> 12     fb-survey                  raw_wcli       day   county 20200406 20200418
#> 13     fb-survey                  raw_wcli       day      hrr 20200406 20200418
#> 14     fb-survey                  raw_wcli       day      msa 20200406 20200418
#> 15     fb-survey                  raw_wcli       day    state 20200406 20200418
#> 16     fb-survey                  raw_wili       day   county 20200406 20200418
#> 17     fb-survey                  raw_wili       day      hrr 20200406 20200418
#> 18     fb-survey                  raw_wili       day      msa 20200406 20200418
#> 19     fb-survey                  raw_wili       day    state 20200406 20200418
#> 20     fb-survey              smoothed_cli       day   county 20200406 20200421
#> 21     fb-survey              smoothed_cli       day      hrr 20200406 20200421
#> 22     fb-survey              smoothed_cli       day      msa 20200406 20200421
#> 23     fb-survey              smoothed_cli       day    state 20200406 20200421
#> 24     fb-survey              smoothed_ili       day   county 20200406 20200421
#> 25     fb-survey              smoothed_ili       day      hrr 20200406 20200421
#> 26     fb-survey              smoothed_ili       day      msa 20200406 20200421
#> 27     fb-survey              smoothed_ili       day    state 20200406 20200421
#> 28     fb-survey             smoothed_wcli       day   county 20200406 20200418
#> 29     fb-survey             smoothed_wcli       day      hrr 20200406 20200418
#> 30     fb-survey             smoothed_wcli       day      msa 20200406 20200418
#> 31     fb-survey             smoothed_wcli       day    state 20200406 20200418
#> 32     fb-survey             smoothed_wili       day   county 20200406 20200418
#> 33     fb-survey             smoothed_wili       day      hrr 20200406 20200418
#> 34     fb-survey             smoothed_wili       day      msa 20200406 20200418
#> 35     fb-survey             smoothed_wili       day    state 20200406 20200418
#> 36           ght                raw_search       day      dma 20200201 20200422
#> 37           ght                raw_search       day      hrr 20200201 20200422
#> 38           ght                raw_search       day      msa 20200201 20200422
#> 39           ght                raw_search       day    state 20200201 20200422
#> 40           ght           smoothed_search       day      dma 20200201 20200422
#> 41           ght           smoothed_search       day      hrr 20200201 20200422
#> 42           ght           smoothed_search       day      msa 20200201 20200422
#> 43           ght           smoothed_search       day    state 20200201 20200422
#> 44 google-survey                   raw_cli       day   county 20200411 20200422
#> 45 google-survey                   raw_cli       day      hrr 20200411 20200422
#> 46 google-survey                   raw_cli       day      msa 20200411 20200422
#> 47 google-survey                   raw_cli       day    state 20200411 20200422
#> 48 google-survey              smoothed_cli       day   county 20200411 20200422
#> 49 google-survey              smoothed_cli       day      hrr 20200411 20200422
#> 50 google-survey              smoothed_cli       day      msa 20200411 20200422
#> 51 google-survey              smoothed_cli       day    state 20200411 20200422
#> 52        quidel     smoothed_pct_negative       day      msa 20200201 20200421
#> 53        quidel     smoothed_pct_negative       day    state 20200201 20200421
#> 54        quidel smoothed_tests_per_device       day      msa 20200201 20200421
#> 55        quidel smoothed_tests_per_device       day    state 20200201 20200421
#>    num_locations         last_update  min_value   max_value mean_value
#> 1           1469 2020-04-22 23:31:50  0.0000000   32.664883  0.5220271
#> 2            368 2020-04-22 23:31:50  0.0000000   13.793440  0.5468652
#> 3             51 2020-04-22 23:31:50  0.0000000   12.219561  0.7535830
#> 4            639 2020-04-23 03:55:54  0.0000000   19.047619  0.7700793
#> 5            306 2020-04-23 03:55:55  0.0000000    4.550654  0.7481406
#> 6            341 2020-04-23 03:55:55  0.0000000    4.014265  0.7380593
#> 7             51 2020-04-23 03:55:56  0.0000000    3.168093  0.7460677
#> 8            639 2020-04-23 03:55:54  0.0000000   19.047619  0.7969480
#> 9            306 2020-04-23 03:55:55  0.0000000    4.550654  0.7717940
#> 10           341 2020-04-23 03:55:55  0.0000000    4.702592  0.7621329
#> 11            51 2020-04-23 03:55:56  0.0000000    3.168093  0.7693697
#> 12           637 2020-04-23 03:55:47  0.0000000   19.047619  0.7882380
#> 13           306 2020-04-23 03:55:48  0.0000000    4.549792  0.7762288
#> 14           339 2020-04-23 03:55:49  0.0000000    3.936737  0.7631810
#> 15            51 2020-04-23 03:55:49  0.0000000    2.473487  0.7642138
#> 16           637 2020-04-23 03:55:47  0.0000000   19.047619  0.8130744
#> 17           306 2020-04-23 03:55:49  0.0000000    4.549792  0.7969038
#> 18           339 2020-04-23 03:55:49  0.0000000    3.936737  0.7853113
#> 19            51 2020-04-23 03:55:49  0.0000000    2.473487  0.7833690
#> 20          1492 2020-04-23 03:55:54  0.0000000    5.195195  0.7969260
#> 21           306 2020-04-23 03:55:55  0.0000000    4.550654  0.7978638
#> 22           381 2020-04-23 03:55:55  0.0000000    4.052366  0.7881876
#> 23            51 2020-04-23 03:55:56  0.2149121    1.743573  0.7834596
#> 24          1492 2020-04-23 03:55:55  0.0000000    5.285285  0.8252060
#> 25           306 2020-04-23 03:55:55  0.0000000    4.550654  0.8255253
#> 26           381 2020-04-23 03:55:56  0.0000000    4.052366  0.8156031
#> 27            51 2020-04-23 03:55:56  0.1782531    2.158709  0.8085379
#> 28          1470 2020-04-23 03:55:48  0.0000000    5.251973  0.8185306
#> 29           306 2020-04-23 03:55:49  0.0000000    4.549792  0.8265758
#> 30           380 2020-04-23 03:55:49  0.0000000    3.994253  0.8163436
#> 31            51 2020-04-23 03:55:49  0.2612050    1.664537  0.8066339
#> 32          1470 2020-04-23 03:55:48  0.0000000    5.343048  0.8461706
#> 33           306 2020-04-23 03:55:49  0.0000000    4.549792  0.8519084
#> 34           380 2020-04-23 03:55:49  0.0000000    3.994253  0.8430005
#> 35            51 2020-04-23 03:55:49  0.1897764    2.014686  0.8277565
#> 36           210 2020-04-23 15:51:06  0.0000000 1398.653702 17.3709617
#> 37           306 2020-04-23 15:51:06  0.0000000  636.939665 20.4750451
#> 38           381 2020-04-23 15:51:08  0.0000000 1398.653702 19.7943412
#> 39            51 2020-04-23 15:51:08  0.0000000  414.708322 21.1759190
#> 40           210 2020-04-23 15:51:06  0.0000000  509.889675 18.0748674
#> 41           306 2020-04-23 15:51:06  0.0000000  250.830641 20.9677188
#> 42           381 2020-04-23 15:51:08  0.0000000  509.889675 20.3820578
#> 43            51 2020-04-23 15:51:08  0.0000000  230.063609 21.5919913
#> 44           647 2020-04-23 05:04:36  1.2484745   29.238329  8.1640009
#> 45           282 2020-04-23 05:04:36  1.9886364   23.873527  8.2395307
#> 46           324 2020-04-23 05:04:36  1.9886364   20.289826  8.0355285
#> 47            51 2020-04-23 05:04:36  4.5881741   18.793377  7.9849307
#> 48           647 2020-04-23 05:04:36  1.7713140   28.038018  8.2300015
#> 49           282 2020-04-23 05:04:36  4.5130650   22.726557  8.3514458
#> 50           324 2020-04-23 05:04:36  3.0182232   19.136784  8.1259703
#> 51            51 2020-04-23 05:04:36  5.3808201   18.473526  8.0388967
#> 52           306 2020-04-22 20:52:21 23.0769230  100.000000 77.2083001
#> 53            51 2020-04-22 20:52:21 48.7179490  100.000000 77.2681148
#> 54           306 2020-04-22 20:52:21  1.1320750   14.222222  3.2416399
#> 55            51 2020-04-22 20:52:21  1.1956520    9.600000  3.1638611
#>    stdev_value
#> 1    1.1210165
#> 2    1.0287773
#> 3    1.2501793
#> 4    0.6489570
#> 5    0.5377366
#> 6    0.5466770
#> 7    0.3473741
#> 8    0.6584893
#> 9    0.5479658
#> 10   0.5561021
#> 11   0.3594638
#> 12   0.6517398
#> 13   0.5564690
#> 14   0.5424411
#> 15   0.3653688
#> 16   0.6572525
#> 17   0.5658050
#> 18   0.5487895
#> 19   0.3725867
#> 20   0.4992374
#> 21   0.3554479
#> 22   0.4060322
#> 23   0.2101982
#> 24   0.5093193
#> 25   0.3642384
#> 26   0.4179621
#> 27   0.2218202
#> 28   0.5010886
#> 29   0.3761648
#> 30   0.4078161
#> 31   0.2121789
#> 32   0.5116269
#> 33   0.3856963
#> 34   0.4201729
#> 35   0.2222645
#> 36  44.9469380
#> 37  35.9399079
#> 38  39.6246518
#> 39  31.9969789
#> 40  27.7079631
#> 41  25.5309144
#> 42  26.0936124
#> 43  24.8496405
#> 44   2.4637819
#> 45   2.2827765
#> 46   1.9608294
#> 47   1.8060508
#> 48   2.3243806
#> 49   2.1982680
#> 50   1.7529071
#> 51   1.8156411
#> 52  13.0964356
#> 53  12.7782633
#> 54   1.4157148
#> 55   1.0663843
```

Make a request with the default query:

``` r
covidcast()
#> $epidata
#>   geo_value time_value direction    value   stderr sample_size
#> 1        ny   20200415         0 8.163339 0.318426          NA
#> 
#> $url
#> [1] "https://delphi.cmu.edu/epidata/api.php?source=covidcast&data_source=doctor-visits&signal=smoothed_cli&time_type=day&time_values=20200415&geo_type=state&geo_value=NY"
#> 
#> $response
#> Response [https://delphi.cmu.edu/epidata/api.php?source=covidcast&data_source=doctor-visits&signal=smoothed_cli&time_type=day&time_values=20200415&geo_type=state&geo_value=NY]
#>   Date: 2020-04-23 18:09
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
#> 1        ny   20200412        -1  8.966106 0.303673          NA
#> 2        ny   20200413        -1 10.551979 0.392629          NA
#> 3        ny   20200414         0  9.276115 0.355088          NA
#> 4        ny   20200415         0  8.163339 0.318426          NA
#> 5        ny   20200418        -1  5.427195 0.243391          NA
```

Provide a query
string:

``` r
query <- "source=covidcast&data_source=fb-survey&signal=smoothed_cli&time_type=day&geo_type=county&time_values=20200406&geo_value=01000"
covidcast(query=query)$epidata
#>   geo_value time_value direction    value    stderr sample_size
#> 1     01000   20200406        NA 1.169338 0.1898255    1451.033
```
