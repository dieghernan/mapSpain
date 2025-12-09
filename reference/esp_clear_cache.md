# Clear your [mapSpain](https://CRAN.R-project.org/package=mapSpain) cache dir

**Use this function with caution**. This function would clear your
cached data and configuration, specifically:

- Deletes the [mapSpain](https://CRAN.R-project.org/package=mapSpain)
  config directory (`rappdirs::user_config_dir("mapSpain", "R")`).

- Deletes the `cache_dir` directory.

- Deletes the values on stored on `Sys.getenv("MAPSPAIN_CACHE_DIR")` and
  `options(mapSpain_cache_dir)`.

## Usage

``` r
esp_clear_cache(config = FALSE, cached_data = TRUE, verbose = FALSE)
```

## Arguments

- config:

  Logical. If `TRUE`, will delete the configuration folder of
  [mapSpain](https://CRAN.R-project.org/package=mapSpain).

- cached_data:

  Logical. If `TRUE`, it will delete your `cache_dir` and all its
  content.

- verbose:

  Logical, displays information. Useful for debugging, default is
  `FALSE`.

## Value

Invisible. This function is called for its side effects.

## Details

This is an overkill function that is intended to reset your status as it
you would never have installed and/or used
[mapSpain](https://CRAN.R-project.org/package=mapSpain).

## See also

Other cache utilities:
[`esp_detect_cache_dir()`](https://ropenspain.github.io/mapSpain/reference/esp_detect_cache_dir.md),
[`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/reference/esp_set_cache_dir.md)

## Examples

``` r
# Don't run this! It would modify your current state
# \dontrun{
esp_clear_cache(verbose = TRUE)
#> mapSpain cached data deleted: C:\Users\RUNNER~1\AppData\Local\Temp\RtmpMvbmr0/mapSpain
# }

Sys.getenv("MAPSPAIN_CACHE_DIR")
#> [1] ""
```
