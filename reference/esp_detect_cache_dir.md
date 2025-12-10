# Detect cache dir for [mapSpain](https://CRAN.R-project.org/package=mapSpain)

Helper function to detect the current cache folder. See
[`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/reference/esp_set_cache_dir.md).

## Usage

``` r
esp_detect_cache_dir(x = NULL)
```

## Arguments

- x:

  Ignored.

## Value

A character with the path to your `cache_dir`.

## See also

Other cache utilities:
[`esp_clear_cache()`](https://ropenspain.github.io/mapSpain/reference/esp_clear_cache.md),
[`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/reference/esp_set_cache_dir.md)

## Examples

``` r
esp_detect_cache_dir()
#> [1] "C:\\Users\\RUNNER~1\\AppData\\Local\\Temp\\RtmpeudJYL/mapSpain"
```
