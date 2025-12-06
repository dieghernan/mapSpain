# Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON` of the national geographic grids from ESDAC

Loads a [`sf`](https://r-spatial.github.io/sf/reference/sf.html)
`POLYGON` with the geographic grids of Spain as provided by the European
Soil Data Centre (ESDAC).

## Usage

``` r
esp_get_grid_ESDAC(
  resolution = 10,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE
)
```

## Source

[EEA reference
grid](https://esdac.jrc.ec.europa.eu/content/european-reference-grids).

## Arguments

- resolution:

  Resolution of the grid in kms. Could be `1` or `10`.

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

## References

- Panagos P., Van Liedekerke M., Jones A., Montanarella L., "European
  Soil Data Centre: Response to European policy support and public data
  requirements"; (2012) *Land Use Policy*, 29 (2), pp. 329-338.
  [doi:10.1016/j.landusepol.2011.07.003](https://doi.org/10.1016/j.landusepol.2011.07.003)

- European Soil Data Centre (ESDAC), esdac.jrc.ec.europa.eu, European
  Commission, Joint Research Centre.

## See also

Other grids:
[`esp_get_grid_BDN()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_BDN.md),
[`esp_get_grid_EEA()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_EEA.md),
[`esp_get_grid_MTN()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_MTN.md)

## Examples

``` r
# \dontrun{
grid <- esp_get_grid_ESDAC()
esp <- esp_get_country(moveCAN = FALSE)

library(ggplot2)

ggplot(grid) +
  geom_sf() +
  geom_sf(data = esp, color = "grey50", fill = NA) +
  theme_light() +
  labs(title = "ESDAC Grid for Spain")

# }
```
