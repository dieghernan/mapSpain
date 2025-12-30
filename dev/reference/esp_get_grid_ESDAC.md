# National geographic grids from the European Soil Data Centre (ESDAC)

Loads a [`sf`](https://r-spatial.github.io/sf/reference/sf.html)
`POLYGON` with the geographic grids of Spain as provided by the European
Soil Data Centre (ESDAC).

## Usage

``` r
esp_get_grid_ESDAC(
  resolution = c(10, 1),
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

  numeric. Resolution of the grid in kilometres. It could be `1` or
  `10`.

- update_cache:

  logical. Should the cached file be refreshed? Default is `FALSE`. When
  set to `TRUE` it would force a new download.

- cache_dir:

  character string. A path to a cache directory. See **Caching
  strategies** section in
  [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).

- verbose:

  logical. If `TRUE` displays informational messages.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`.

## References

- Panagos P., Van Liedekerke M., Jones A., Montanarella L., "European
  Soil Data Centre: Response to European policy support and public data
  requirements"; (2012) *Land Use Policy*, 29 (2), pp. 329-338.
  [doi:10.1016/j.landusepol.2011.07.003](https://doi.org/10.1016/j.landusepol.2011.07.003)

- European Soil Data Centre (ESDAC), esdac.jrc.ec.europa.eu, European
  Commission, Joint Research Centre.

## See also

Other geographical grids:
[`esp_get_grid_BDN()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_BDN.md),
[`esp_get_grid_MTN()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_MTN.md)

## Examples

``` r
# \dontrun{
grid <- esp_get_grid_ESDAC()
esp <- esp_get_spain(moveCAN = FALSE)

library(ggplot2)

ggplot(grid) +
  geom_sf() +
  geom_sf(data = esp, color = "grey50", fill = NA) +
  theme_light() +
  labs(title = "ESDAC Grid for Spain")

# }
```
