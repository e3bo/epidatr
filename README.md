
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
#>               data_source                    signal time_type geo_type min_time
#> 1           doctor-visits          smoothed_adj_cli       day   county 20200201
#> 2           doctor-visits          smoothed_adj_cli       day      hrr 20200201
#> 3           doctor-visits          smoothed_adj_cli       day      msa 20200201
#> 4           doctor-visits          smoothed_adj_cli       day    state 20200201
#> 5           doctor-visits              smoothed_cli       day   county 20200201
#> 6           doctor-visits              smoothed_cli       day      hrr 20200201
#> 7           doctor-visits              smoothed_cli       day      msa 20200201
#> 8           doctor-visits              smoothed_cli       day    state 20200201
#> 9               fb-survey                   raw_cli       day   county 20200406
#> 10              fb-survey                   raw_cli       day      hrr 20200406
#> 11              fb-survey                   raw_cli       day      msa 20200406
#> 12              fb-survey                   raw_cli       day    state 20200406
#> 13              fb-survey          raw_hh_cmnty_cli       day   county 20200415
#> 14              fb-survey          raw_hh_cmnty_cli       day      hrr 20200415
#> 15              fb-survey          raw_hh_cmnty_cli       day      msa 20200415
#> 16              fb-survey          raw_hh_cmnty_cli       day    state 20200415
#> 17              fb-survey                   raw_ili       day   county 20200406
#> 18              fb-survey                   raw_ili       day      hrr 20200406
#> 19              fb-survey                   raw_ili       day      msa 20200406
#> 20              fb-survey                   raw_ili       day    state 20200406
#> 21              fb-survey        raw_nohh_cmnty_cli       day   county 20200415
#> 22              fb-survey        raw_nohh_cmnty_cli       day      hrr 20200415
#> 23              fb-survey        raw_nohh_cmnty_cli       day      msa 20200415
#> 24              fb-survey        raw_nohh_cmnty_cli       day    state 20200415
#> 25              fb-survey                  raw_wcli       day   county 20200406
#> 26              fb-survey                  raw_wcli       day      hrr 20200406
#> 27              fb-survey                  raw_wcli       day      msa 20200406
#> 28              fb-survey                  raw_wcli       day    state 20200406
#> 29              fb-survey                  raw_wili       day   county 20200406
#> 30              fb-survey                  raw_wili       day      hrr 20200406
#> 31              fb-survey                  raw_wili       day      msa 20200406
#> 32              fb-survey                  raw_wili       day    state 20200406
#> 33              fb-survey              smoothed_cli       day   county 20200406
#> 34              fb-survey              smoothed_cli       day      hrr 20200406
#> 35              fb-survey              smoothed_cli       day      msa 20200406
#> 36              fb-survey              smoothed_cli       day    state 20200406
#> 37              fb-survey     smoothed_hh_cmnty_cli       day   county 20200415
#> 38              fb-survey     smoothed_hh_cmnty_cli       day      hrr 20200415
#> 39              fb-survey     smoothed_hh_cmnty_cli       day      msa 20200415
#> 40              fb-survey     smoothed_hh_cmnty_cli       day    state 20200415
#> 41              fb-survey              smoothed_ili       day   county 20200406
#> 42              fb-survey              smoothed_ili       day      hrr 20200406
#> 43              fb-survey              smoothed_ili       day      msa 20200406
#> 44              fb-survey              smoothed_ili       day    state 20200406
#> 45              fb-survey   smoothed_nohh_cmnty_cli       day   county 20200415
#> 46              fb-survey   smoothed_nohh_cmnty_cli       day      hrr 20200415
#> 47              fb-survey   smoothed_nohh_cmnty_cli       day      msa 20200415
#> 48              fb-survey   smoothed_nohh_cmnty_cli       day    state 20200415
#> 49              fb-survey             smoothed_wcli       day   county 20200406
#> 50              fb-survey             smoothed_wcli       day      hrr 20200406
#> 51              fb-survey             smoothed_wcli       day      msa 20200406
#> 52              fb-survey             smoothed_wcli       day    state 20200406
#> 53              fb-survey             smoothed_wili       day   county 20200406
#> 54              fb-survey             smoothed_wili       day      hrr 20200406
#> 55              fb-survey             smoothed_wili       day      msa 20200406
#> 56              fb-survey             smoothed_wili       day    state 20200406
#> 57                    ght                raw_search       day      dma 20200201
#> 58                    ght                raw_search       day      hrr 20200201
#> 59                    ght                raw_search       day      msa 20200201
#> 60                    ght                raw_search       day    state 20200201
#> 61                    ght           smoothed_search       day      dma 20200201
#> 62                    ght           smoothed_search       day      hrr 20200201
#> 63                    ght           smoothed_search       day      msa 20200201
#> 64                    ght           smoothed_search       day    state 20200201
#> 65          google-survey                   raw_cli       day   county 20200411
#> 66          google-survey                   raw_cli       day      hrr 20200411
#> 67          google-survey                   raw_cli       day      msa 20200411
#> 68          google-survey                   raw_cli       day    state 20200411
#> 69          google-survey              smoothed_cli       day   county 20200411
#> 70          google-survey              smoothed_cli       day      hrr 20200411
#> 71          google-survey              smoothed_cli       day      msa 20200411
#> 72          google-survey              smoothed_cli       day    state 20200411
#> 73  indicator-combination       nmf_day_doc_fbs_ght       day   county 20200406
#> 74  indicator-combination       nmf_day_doc_fbs_ght       day      msa 20200406
#> 75  indicator-combination       nmf_day_doc_fbs_ght       day    state 20200406
#> 76               jhu-csse  confirmed_cumulative_num       day   county 20200122
#> 77               jhu-csse  confirmed_cumulative_num       day      hrr 20200122
#> 78               jhu-csse  confirmed_cumulative_num       day      msa 20200122
#> 79               jhu-csse  confirmed_cumulative_num       day    state 20200122
#> 80               jhu-csse   confirmed_incidence_num       day   county 20200122
#> 81               jhu-csse   confirmed_incidence_num       day      hrr 20200122
#> 82               jhu-csse   confirmed_incidence_num       day      msa 20200122
#> 83               jhu-csse   confirmed_incidence_num       day    state 20200122
#> 84               jhu-csse  confirmed_incidence_prop       day   county 20200122
#> 85               jhu-csse  confirmed_incidence_prop       day      hrr 20200122
#> 86               jhu-csse  confirmed_incidence_prop       day      msa 20200122
#> 87               jhu-csse  confirmed_incidence_prop       day    state 20200122
#> 88               jhu-csse     deaths_cumulative_num       day   county 20200122
#> 89               jhu-csse     deaths_cumulative_num       day      hrr 20200122
#> 90               jhu-csse     deaths_cumulative_num       day      msa 20200122
#> 91               jhu-csse     deaths_cumulative_num       day    state 20200122
#> 92               jhu-csse      deaths_incidence_num       day   county 20200122
#> 93               jhu-csse      deaths_incidence_num       day      hrr 20200122
#> 94               jhu-csse      deaths_incidence_num       day      msa 20200122
#> 95               jhu-csse      deaths_incidence_num       day    state 20200122
#> 96               jhu-csse     deaths_incidence_prop       day   county 20200122
#> 97               jhu-csse     deaths_incidence_prop       day      hrr 20200122
#> 98               jhu-csse     deaths_incidence_prop       day      msa 20200122
#> 99               jhu-csse     deaths_incidence_prop       day    state 20200122
#> 100                quidel          raw_pct_negative       day      msa 20200131
#> 101                quidel          raw_pct_negative       day    state 20200131
#> 102                quidel      raw_tests_per_device       day      msa 20200131
#> 103                quidel      raw_tests_per_device       day    state 20200131
#> 104                quidel     smoothed_pct_negative       day      msa 20200131
#> 105                quidel     smoothed_pct_negative       day    state 20200131
#> 106                quidel smoothed_tests_per_device       day      msa 20200131
#> 107                quidel smoothed_tests_per_device       day    state 20200131
#> 108        youtube-survey                   raw_cli       day    state 20200421
#> 109        youtube-survey                   raw_ili       day    state 20200421
#> 110        youtube-survey              smoothed_cli       day    state 20200421
#> 111        youtube-survey              smoothed_ili       day    state 20200421
#>     max_time num_locations         last_update     min_value    max_value
#> 1   20200518          2129 2020-05-22 01:29:39  0.000000e+00 8.822196e+01
#> 2   20200518           306 2020-05-22 01:29:39  0.000000e+00 2.389395e+01
#> 3   20200518           378 2020-05-22 01:29:38  0.000000e+00 2.062523e+01
#> 4   20200518            51 2020-05-22 01:29:38  0.000000e+00 1.585931e+01
#> 5   20200518          2129 2020-05-22 01:29:39  0.000000e+00 7.252759e+01
#> 6   20200518           306 2020-05-22 01:29:39  0.000000e+00 2.063342e+01
#> 7   20200518           378 2020-05-22 01:29:38  0.000000e+00 1.761724e+01
#> 8   20200518            51 2020-05-22 01:29:38  0.000000e+00 1.577707e+01
#> 9   20200520           641 2020-05-21 12:44:03  0.000000e+00 5.080565e+00
#> 10  20200520           306 2020-05-21 12:44:04  0.000000e+00 4.550654e+00
#> 11  20200520           342 2020-05-21 12:44:05  0.000000e+00 4.014265e+00
#> 12  20200520            51 2020-05-21 12:44:05  0.000000e+00 3.168093e+00
#> 13  20200520           341 2020-05-21 12:44:03  4.128440e+00 5.575578e+01
#> 14  20200520           288 2020-05-21 12:44:04  5.319149e+00 4.908257e+01
#> 15  20200520           210 2020-05-21 12:44:05  4.415110e+00 4.367329e+01
#> 16  20200520            51 2020-05-21 12:44:05  5.319149e+00 3.413056e+01
#> 17  20200520           641 2020-05-21 12:44:03  0.000000e+00 5.080565e+00
#> 18  20200520           306 2020-05-21 12:44:04  0.000000e+00 4.550654e+00
#> 19  20200520           342 2020-05-21 12:44:05  0.000000e+00 4.702592e+00
#> 20  20200520            51 2020-05-21 12:44:05  0.000000e+00 3.168093e+00
#> 21  20200520           341 2020-05-21 12:44:03  2.293578e+00 4.594501e+01
#> 22  20200520           288 2020-05-21 12:44:05  2.583587e+00 4.491870e+01
#> 23  20200520           210 2020-05-21 12:44:05  2.941176e+00 3.745365e+01
#> 24  20200520            51 2020-05-21 12:44:05  2.583587e+00 2.895330e+01
#> 25  20200519           639 2020-05-21 12:44:00  0.000000e+00 4.493284e+00
#> 26  20200519           306 2020-05-21 12:44:02  0.000000e+00 4.549792e+00
#> 27  20200519           340 2020-05-21 12:44:02  0.000000e+00 3.942243e+00
#> 28  20200519            51 2020-05-21 12:44:03  0.000000e+00 3.040061e+00
#> 29  20200519           639 2020-05-21 12:44:00  0.000000e+00 4.187478e+00
#> 30  20200519           306 2020-05-21 12:44:02  0.000000e+00 4.549792e+00
#> 31  20200519           340 2020-05-21 12:44:02  0.000000e+00 4.376610e+00
#> 32  20200519            51 2020-05-21 12:44:03  0.000000e+00 3.040061e+00
#> 33  20200520          1529 2020-05-21 12:44:04  0.000000e+00 5.195195e+00
#> 34  20200520           306 2020-05-21 12:44:05  0.000000e+00 4.550654e+00
#> 35  20200520           381 2020-05-21 12:44:05  0.000000e+00 4.052366e+00
#> 36  20200520            52 2020-05-21 12:44:05  8.116883e-02 1.743573e+00
#> 37  20200520          1146 2020-05-21 12:44:04  3.174469e+00 5.403410e+01
#> 38  20200520           306 2020-05-21 12:44:05  8.976834e+00 4.661972e+01
#> 39  20200520           375 2020-05-21 12:44:05  6.172855e+00 5.551019e+01
#> 40  20200520            51 2020-05-21 12:44:05  9.176937e+00 3.325342e+01
#> 41  20200520          1529 2020-05-21 12:44:04  0.000000e+00 5.285285e+00
#> 42  20200520           306 2020-05-21 12:44:05  0.000000e+00 4.550654e+00
#> 43  20200520           381 2020-05-21 12:44:05  0.000000e+00 4.052366e+00
#> 44  20200520            52 2020-05-21 12:44:05  1.533747e-01 2.158709e+00
#> 45  20200520          1148 2020-05-21 12:44:04  0.000000e+00 4.864013e+01
#> 46  20200520           306 2020-05-21 12:44:05  2.941176e-02 4.267606e+01
#> 47  20200520           375 2020-05-21 12:44:05  2.866115e+00 4.988607e+01
#> 48  20200520            52 2020-05-21 12:44:05  0.000000e+00 2.893130e+01
#> 49  20200519          1520 2020-05-21 12:44:01  0.000000e+00 5.251973e+00
#> 50  20200519           306 2020-05-21 12:44:02  0.000000e+00 4.549792e+00
#> 51  20200519           381 2020-05-21 12:44:03  0.000000e+00 3.994253e+00
#> 52  20200519            52 2020-05-21 12:44:03  8.486689e-02 1.664537e+00
#> 53  20200519          1520 2020-05-21 12:44:01  0.000000e+00 5.343048e+00
#> 54  20200519           306 2020-05-21 12:44:02  0.000000e+00 4.549792e+00
#> 55  20200519           381 2020-05-21 12:44:03  0.000000e+00 3.994253e+00
#> 56  20200519            52 2020-05-21 12:44:03  1.345963e-01 2.014686e+00
#> 57  20200518           210 2020-05-21 00:51:19  0.000000e+00 1.398654e+03
#> 58  20200518           306 2020-05-21 00:51:19  0.000000e+00 6.369397e+02
#> 59  20200518           381 2020-05-21 00:51:19  0.000000e+00 1.398654e+03
#> 60  20200518            51 2020-05-21 00:51:19  0.000000e+00 4.147083e+02
#> 61  20200518           210 2020-05-21 00:51:19  0.000000e+00 5.098897e+02
#> 62  20200518           306 2020-05-21 00:51:19  0.000000e+00 2.508306e+02
#> 63  20200518           381 2020-05-21 00:51:19  0.000000e+00 5.098897e+02
#> 64  20200518            51 2020-05-21 00:51:19  0.000000e+00 2.300636e+02
#> 65  20200514           649 2020-05-15 14:51:20  4.098361e-01 3.542389e+01
#> 66  20200514           282 2020-05-15 14:51:20  7.812500e-01 2.387353e+01
#> 67  20200514           324 2020-05-15 14:51:20  0.000000e+00 2.028983e+01
#> 68  20200514            51 2020-05-15 14:51:20  2.173913e+00 1.878754e+01
#> 69  20200514           649 2020-05-15 14:51:20  8.805459e-01 2.875000e+01
#> 70  20200514           282 2020-05-15 14:51:20  3.701933e+00 2.272656e+01
#> 71  20200514           324 2020-05-15 14:51:20  3.018223e+00 1.913678e+01
#> 72  20200514            51 2020-05-15 14:51:20  3.641009e+00 1.810335e+01
#> 73  20200519          2014 2020-05-21 02:51:28  2.085665e-09 1.717806e+01
#> 74  20200519           381 2020-05-21 02:51:28  1.158330e-09 5.407806e+00
#> 75  20200519            52 2020-05-21 02:51:28  7.926791e-02 3.562433e+00
#> 76  20200520          3144 2020-05-21 18:51:25  0.000000e+00 1.945500e+05
#> 77  20200520           306 2020-05-21 18:51:45  0.000000e+00 1.959618e+05
#> 78  20200520           381 2020-05-21 18:51:48  0.000000e+00 4.463500e+05
#> 79  20200520            51 2020-05-21 18:51:52  0.000000e+00 3.543700e+05
#> 80  20200520          3144 2020-05-21 18:51:27 -3.360000e+02 7.837000e+03
#> 81  20200520           306 2020-05-21 18:51:46 -1.670275e+02 7.889536e+03
#> 82  20200520           381 2020-05-21 18:51:49 -2.670000e+02 1.476500e+04
#> 83  20200520            51 2020-05-21 18:51:52 -6.300000e+01 1.143400e+04
#> 84  20200520          3144 2020-05-21 18:51:29 -2.024291e+03 7.949309e+03
#> 85  20200520           306 2020-05-21 18:51:46 -5.599516e+01 2.069061e+02
#> 86  20200520           381 2020-05-21 18:51:49 -9.822155e+01 3.241166e+02
#> 87  20200520            51 2020-05-21 18:51:52 -4.633338e+00 1.673650e+02
#> 88  20200520          3144 2020-05-21 18:51:31  0.000000e+00 2.093400e+04
#> 89  20200520           306 2020-05-21 18:51:46  0.000000e+00 2.100805e+04
#> 90  20200520           381 2020-05-21 18:51:49  0.000000e+00 3.606800e+04
#> 91  20200520            51 2020-05-21 18:51:52  0.000000e+00 2.863600e+04
#> 92  20200520          3144 2020-05-21 18:51:33 -6.500000e+01 9.360000e+02
#> 93  20200520           306 2020-05-21 18:51:46 -6.449795e+01 9.374344e+02
#> 94  20200520           381 2020-05-21 18:51:50 -3.600000e+01 1.453000e+03
#> 95  20200520            51 2020-05-21 18:51:52 -8.700000e+01 1.270000e+03
#> 96  20200520          3144 2020-05-21 18:51:36 -8.988764e+01 1.064207e+02
#> 97  20200520           306 2020-05-21 18:51:47 -8.285656e+00 2.125915e+01
#> 98  20200520           381 2020-05-21 18:51:50 -6.596741e+00 2.317244e+01
#> 99  20200520            51 2020-05-21 18:51:52 -9.794882e-01 1.103849e+01
#> 100 20200510           261 2020-05-12 00:51:28  9.090909e+00 1.000000e+02
#> 101 20200510            51 2020-05-12 00:51:28  2.142857e+01 1.000000e+02
#> 102 20200510           261 2020-05-12 00:51:28  1.000000e+00 2.700000e+01
#> 103 20200510            51 2020-05-12 00:51:28  1.000000e+00 1.400000e+01
#> 104 20200510           307 2020-05-12 00:51:28  9.090909e+00 1.000000e+02
#> 105 20200510            51 2020-05-12 00:51:28  4.871795e+01 1.000000e+02
#> 106 20200510           307 2020-05-12 00:51:28  1.000000e+00 1.422222e+01
#> 107 20200510            51 2020-05-12 00:51:28  1.000000e+00 9.600000e+00
#> 108 20200519            19 2020-05-20 11:51:43  0.000000e+00 3.083082e+00
#> 109 20200519            19 2020-05-20 11:51:43  0.000000e+00 3.195694e+00
#> 110 20200519            42 2020-05-20 11:51:43  0.000000e+00 4.532164e+00
#> 111 20200519            42 2020-05-20 11:51:43  0.000000e+00 4.532164e+00
#>       mean_value  stdev_value
#> 1      0.9977323 1.960890e+00
#> 2      1.2568592 2.097470e+00
#> 3      1.0457375 1.704490e+00
#> 4      1.3246357 1.849205e+00
#> 5      0.8444099 1.679295e+00
#> 6      1.1293638 1.918449e+00
#> 7      0.9143129 1.509683e+00
#> 8      1.3472737 1.918573e+00
#> 9      0.5615667 5.215496e-01
#> 10     0.5535693 4.853506e-01
#> 11     0.5335141 4.877029e-01
#> 12     0.5704093 3.227692e-01
#> 13    18.9043452 5.608315e+00
#> 14    18.9682374 5.320162e+00
#> 15    18.3028178 4.955786e+00
#> 16    19.2223742 3.961225e+00
#> 17     0.5809265 5.284535e-01
#> 18     0.5709305 4.910393e-01
#> 19     0.5519248 4.959904e-01
#> 20     0.5884204 3.307197e-01
#> 21    14.8427017 5.322600e+00
#> 22    14.8037476 5.045556e+00
#> 23    14.1880591 4.695379e+00
#> 24    14.9539595 3.750323e+00
#> 25     0.5714819 5.211865e-01
#> 26     0.5742925 5.145779e-01
#> 27     0.5484323 4.917851e-01
#> 28     0.5994974 3.487093e-01
#> 29     0.5888792 5.252287e-01
#> 30     0.5898422 5.195318e-01
#> 31     0.5646019 4.978239e-01
#> 32     0.6147442 3.558120e-01
#> 33     0.6044410 4.506785e-01
#> 34     0.6048981 3.245312e-01
#> 35     0.5948972 3.774338e-01
#> 36     0.5991856 2.187706e-01
#> 37    19.0102458 5.358968e+00
#> 38    19.8167176 5.125915e+00
#> 39    19.2109460 5.063096e+00
#> 40    19.7403142 3.678095e+00
#> 41     0.6243056 4.573954e-01
#> 42     0.6242347 3.312215e-01
#> 43     0.6140147 3.853399e-01
#> 44     0.6185149 2.260775e-01
#> 45    14.7385915 5.161569e+00
#> 46    15.1473249 5.303504e+00
#> 47    14.8428923 4.833366e+00
#> 48    15.2508235 3.811902e+00
#> 49     0.6092299 4.500001e-01
#> 50     0.6194891 3.296535e-01
#> 51     0.6041432 3.774161e-01
#> 52     0.6250506 2.106981e-01
#> 53     0.6286900 4.564849e-01
#> 54     0.6371653 3.363279e-01
#> 55     0.6218688 3.849450e-01
#> 56     0.6410402 2.166792e-01
#> 57    15.4272189 4.172165e+01
#> 58    18.3722165 3.335127e+01
#> 59    17.7993847 3.701870e+01
#> 60    19.4194488 2.952106e+01
#> 61    15.9153244 2.530213e+01
#> 62    18.6050093 2.322755e+01
#> 63    18.1558447 2.384780e+01
#> 64    19.5664821 2.236584e+01
#> 65     7.5642062 2.303301e+00
#> 66     7.5031418 2.166255e+00
#> 67     7.4181300 2.024572e+00
#> 68     7.2286506 1.740113e+00
#> 69     7.5262832 2.149611e+00
#> 70     7.5733011 2.036163e+00
#> 71     7.4565365 1.771623e+00
#> 72     7.1670572 1.763736e+00
#> 73     0.7181016 5.449279e-01
#> 74     0.7483324 4.544353e-01
#> 75     0.8421050 3.914091e-01
#> 76   123.9514764 1.995248e+03
#> 77  1273.5370556 6.884862e+03
#> 78   959.2672596 1.168943e+04
#> 79  7641.2439542 2.809949e+04
#> 80     4.0741624 5.536228e+01
#> 81    41.8598140 1.914122e+02
#> 82    30.9987986 3.152319e+02
#> 83   251.1601307 7.693055e+02
#> 84     2.0994122 2.066754e+01
#> 85     3.2118510 8.798393e+00
#> 86     2.4883368 7.643507e+00
#> 87     3.5280207 7.444664e+00
#> 88     6.8859892 1.925531e+02
#> 89    70.7499064 6.321365e+02
#> 90    54.5668651 8.746019e+02
#> 91   424.5009804 2.069624e+03
#> 92     0.2444100 5.907113e+00
#> 93     2.5111873 1.979887e+01
#> 94     1.9194874 2.642746e+01
#> 95    15.0671569 6.502084e+01
#> 96     0.0874336 9.053606e-01
#> 97     0.1728498 6.349905e-01
#> 98     0.1197234 5.138509e-01
#> 99     0.1795055 5.403740e-01
#> 100   75.5820107 1.486950e+01
#> 101   79.4218942 1.414421e+01
#> 102    4.0053472 2.352328e+00
#> 103    3.1605961 1.360030e+00
#> 104   80.0203642 1.452194e+01
#> 105   81.0826443 1.336546e+01
#> 106    2.8861816 1.527380e+00
#> 107    2.8577167 1.142245e+00
#> 108    0.8702498 6.241463e-01
#> 109    0.8718860 6.401556e-01
#> 110    0.9400398 5.105533e-01
#> 111    0.9294506 5.013885e-01
```

Make a request with the default query:

``` r
covidcast()
#> $epidata
#>   geo_value time_value direction    value stderr sample_size
#> 1        ny   20200415        -1 8.191905     NA          NA
#> 
#> $url
#> [1] "https://delphi.cmu.edu/epidata/api.php?source=covidcast&data_source=doctor-visits&signal=smoothed_adj_cli&time_type=day&time_values=20200415&geo_type=state&geo_value=NY"
#> 
#> $response
#> Response [https://delphi.cmu.edu/epidata/api.php?source=covidcast&data_source=doctor-visits&signal=smoothed_adj_cli&time_type=day&time_values=20200415&geo_type=state&geo_value=NY]
#>   Date: 2020-05-22 02:55
#>   Status: 200
#>   Content-Type: application/json
#>   Size: 150 B
#> 
#> 
#> attr(,"class")
#> [1] "epidata_api"
```

Choose a different set of dates and view the data frame:

``` r

covidcast(time_values = "20200412-20200415,20200418")$epidata
#>   geo_value time_value direction    value stderr sample_size
#> 1        ny   20200412        -1 8.842076     NA          NA
#> 2        ny   20200413        -1 8.496838     NA          NA
#> 3        ny   20200414        -1 8.280122     NA          NA
#> 4        ny   20200415        -1 8.191905     NA          NA
#> 5        ny   20200418         0 8.329004     NA          NA
```

Provide a query
string:

``` r
query <- "source=covidcast&data_source=fb-survey&signal=smoothed_cli&time_type=day&geo_type=county&time_values=20200406&geo_value=01000"
covidcast(query=query)$epidata
#>   geo_value time_value direction    value    stderr sample_size
#> 1     01000   20200406        NA 1.169338 0.1909232    1451.033
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
