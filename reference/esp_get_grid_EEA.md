# Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON` of the national geographic grids from EEA

Loads a [`sf`](https://r-spatial.github.io/sf/reference/sf.html)
`POLYGON` with the geographic grids of Spain as provided by the European
Environment Agency (EEA).

## Usage

``` r
esp_get_grid_EEA(
  resolution = 100,
  type = "main",
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE
)
```

## Source

[EEA reference
grid](https://www.eea.europa.eu/en/datahub/datahubitem-view/3c362237-daa4-45e2-8c16-aaadfb1a003b).

## Arguments

- resolution:

  Resolution of the grid in kms. Could be `1`, `10` or `100`.

- type:

  The scope of the grid. It could be mainland Spain (`"main"`) or the
  Canary Islands (`"canary"`).

- update_cache:

  A logical whether to update cache. Default is `FALSE`. When set to
  `TRUE` it would force a fresh download of the source file.

- cache_dir:

  A path to a cache directory. See **About caching**.

- verbose:

  Logical, displays information. Useful for debugging, default is
  `FALSE`.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`.

## About caching

You can set your `cache_dir` with
[`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/reference/esp_set_cache_dir.md).

Sometimes cached files may be corrupt. On that case, try re-downloading
the data setting `update_cache = TRUE`.

If you experience any problem on download, try to download the
corresponding .geojson file by any other method and save it on your
`cache_dir`. Use the option `verbose = TRUE` for debugging the API
query.

## See also

Other grids:
[`esp_get_grid_BDN()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_BDN.md),
[`esp_get_grid_ESDAC()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_ESDAC.md),
[`esp_get_grid_MTN()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_MTN.md)

## Examples

``` r
# \dontrun{

grid <- esp_get_grid_EEA(type = "main", resolution = 100)
grid_can <- esp_get_grid_EEA(type = "canary", resolution = 100)
esp <- esp_get_country(moveCAN = FALSE)

library(ggplot2)

ggplot(grid) +
  geom_sf() +
  geom_sf(data = grid_can) +
  geom_sf(data = esp, fill = NA) +
  theme_light() +
  labs(title = "EEA Grid for Spain")

# }
```
