# Set your [mapSpain](https://CRAN.R-project.org/package=mapSpain) cache dir

This function will store your `cache_dir` path on your local machine and
would load it for future sessions. Type
`Sys.getenv("MAPSPAIN_CACHE_DIR")` to find your cached path.

Alternatively, you can store the `cache_dir` manually with the following
options:

- Run `Sys.setenv(MAPSPAIN_CACHE_DIR = "cache_dir")`. You would need to
  run this command on each session (Similar to `install = FALSE`).

- Set `options(mapSpain_cache_dir = "cache_dir")`. Similar to the
  previous option. This is **not recommended any more**, and it is
  provided for backwards compatibility purposes.

- Write this line on your .Renviron file:
  `MAPSPAIN_CACHE_DIR = "value_for_cache_dir"` (same behavior than
  `install = TRUE`). This would store your `cache_dir` permanently.

## Usage

``` r
esp_set_cache_dir(
  cache_dir,
  overwrite = FALSE,
  install = FALSE,
  verbose = TRUE
)
```

## Arguments

- cache_dir:

  A path to a cache directory. On missing value the function would store
  the cached files on a temporary dir (See
  [`base::tempdir()`](https://rdrr.io/r/base/tempfile.html)).

- overwrite:

  Logical. If this is set to `TRUE`, it will overwrite an existing
  `MAPSPAIN_CACHE_DIR` that you already have in local machine.

- install:

  Logical. If `TRUE`, will install the key in your local machine for use
  in future sessions. Defaults to `FALSE.` If `cache_dir` is `FALSE`
  this parameter is set to `FALSE` automatically.

- verbose:

  Logical, displays information. Useful for debugging, default is
  `FALSE`.

## Value

An (invisible) character with the path to your `cache_dir`.

## See also

[`rappdirs::user_config_dir()`](https://rappdirs.r-lib.org/reference/user_data_dir.html)

Other cache utilities:
[`esp_clear_cache()`](https://ropenspain.github.io/mapSpain/reference/esp_clear_cache.md),
[`esp_detect_cache_dir()`](https://ropenspain.github.io/mapSpain/reference/esp_detect_cache_dir.md)

## Examples

``` r
# Don't run this! It would modify your current state
# \dontrun{
esp_set_cache_dir(verbose = TRUE)
#> Using a temporary cache dir. Set 'cache_dir' to a value for store permanently
#> mapSpain cache dir is: C:\Users\RUNNER~1\AppData\Local\Temp\RtmpMvbmr0/mapSpain
# }

Sys.getenv("MAPSPAIN_CACHE_DIR")
#> [1] "C:\\Users\\RUNNER~1\\AppData\\Local\\Temp\\RtmpMvbmr0/mapSpain"
```
