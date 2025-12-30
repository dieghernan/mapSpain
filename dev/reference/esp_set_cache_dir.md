# Set your [mapSpain](https://CRAN.R-project.org/package=mapSpain) cache dir

This function stores your `cache_dir` path on your local machine and
loads it for future sessions. Type `Sys.getenv("MAPSPAIN_CACHE_DIR")` to
find your cached path, or use `esp_detect_cache_dir()`.

## Usage

``` r
esp_set_cache_dir(
  cache_dir = NULL,
  overwrite = FALSE,
  install = FALSE,
  verbose = TRUE
)

esp_detect_cache_dir()
```

## Arguments

- cache_dir:

  A path to a cache directory. When `NULL`, the function stores cached
  files in a temporary directory (see
  [`base::tempdir()`](https://rdrr.io/r/base/tempfile.html)).

- overwrite:

  logical. If `TRUE`, overwrites an existing `MAPSPAIN_CACHE_DIR` on
  your local machine.

- install:

  logical- If `TRUE`, installs the key on your local machine for use in
  future sessions. Defaults to `FALSE`. If `cache_dir` is `FALSE`, this
  argument is automatically set to `FALSE`.

- verbose:

  logical. If `TRUE` displays informational messages.

## Value

`esp_set_cache_dir()` returns an (invisible) character string with the
path to your `cache_dir`. It is primarily called for its side effect.

`esp_detect_cache_dir()` returns the path to the `cache_dir` used in the
current session.

## Details

By default, when no `cache_dir` is set, the package uses a folder inside
[`base::tempdir()`](https://rdrr.io/r/base/tempfile.html) (files are
temporary and removed when the **R** session ends). To persist a cache
across **R** sessions, use
`esp_set_cache_dir(cache_dir, install = TRUE)`, which writes the chosen
path to a configuration file under
`tools::R_user_dir("mapSpain", "config")`.

## Note

In [mapSpain](https://CRAN.R-project.org/package=mapSpain) \>= 1.0.0,
the configuration file location has moved from
`rappdirs::user_config_dir("mapSpain", "R")` to
`tools::R_user_dir("mapSpain", "config")`. A migration function
automatically transfers previous configuration files from the old to the
new location. A message appears once during this migration.

## Caching strategies

Some files can be read from its online source without caching using the
option `cache = FALSE`. Otherwise the source file would be downloaded to
your computer. [mapSpain](https://CRAN.R-project.org/package=mapSpain)
implements the following caching options:

- For occasional use, rely on the default
  [`tempdir()`](https://rdrr.io/r/base/tempfile.html)-based cache (no
  install).

- Modify the cache for a single session by setting
  `esp_set_cache_dir(cache_dir = "a/path/here")`.

- For reproducible workflows, install a persistent cache with
  `esp_set_cache_dir(cache_dir = "a/path/here", install = TRUE)` that
  persists across **R** sessions.

- For caching specific files, use the `cache_dir` argument in the
  corresponding function.

Sometimes cached files may be corrupted. In that case, try
re-downloading the data by setting `update_cache = TRUE` in the
corresponding function.

If you experience download problems, try downloading the file by another
method and save it to your `cache_dir`. Use `verbose = TRUE` to debug
the API query and `esp_detect_cache_dir()` to identify your cache path.

## See also

[`tools::R_user_dir()`](https://rdrr.io/r/tools/userdir.html)

Other cache utilities:
[`esp_clear_cache()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_clear_cache.md)

## Examples

``` r
# Don't run this! It would modify your current state
# \dontrun{
my_cache <- esp_detect_cache_dir()
#> ℹ C:\Users\RUNNER~1\AppData\Local\Temp\RtmpKaXjaS/mapSpain

# Set an example cache
ex <- file.path(tempdir(), "example", "cachenew")
esp_set_cache_dir(ex)
#> ℹ mapSpain cache dir is C:\Users\RUNNER~1\AppData\Local\Temp\RtmpKaXjaS/example/cachenew.
#> ℹ To install your `cache_dir` path for use in future sessions run this function with `install = TRUE`.

esp_detect_cache_dir()
#> ℹ C:\Users\RUNNER~1\AppData\Local\Temp\RtmpKaXjaS/example/cachenew
#> [1] "C:\\Users\\RUNNER~1\\AppData\\Local\\Temp\\RtmpKaXjaS/example/cachenew"

# Restore initial cache
esp_set_cache_dir(my_cache)
#> ℹ mapSpain cache dir is C:\Users\RUNNER~1\AppData\Local\Temp\RtmpKaXjaS/mapSpain.
#> ℹ To install your `cache_dir` path for use in future sessions run this function with `install = TRUE`.
identical(my_cache, esp_detect_cache_dir())
#> ℹ C:\Users\RUNNER~1\AppData\Local\Temp\RtmpKaXjaS/mapSpain
#> [1] TRUE
# }


esp_detect_cache_dir()
#> ℹ C:\Users\RUNNER~1\AppData\Local\Temp\RtmpKaXjaS/mapSpain
#> [1] "C:\\Users\\RUNNER~1\\AppData\\Local\\Temp\\RtmpKaXjaS/mapSpain"
```
