# Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON` representing Spain

Returns the boundaries of Spain as a single
[`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON` at a
specified scale.

## Usage

``` r
esp_get_country(moveCAN = TRUE, ...)
```

## Arguments

- moveCAN:

  A logical `TRUE/FALSE` or a vector of coordinates `c(lat, lon)`. It
  places the Canary Islands close to Spain's mainland. Initial position
  can be adjusted using the vector of coordinates. See **Displacing the
  Canary Islands**.

- ...:

  Arguments passed on to
  [`esp_get_nuts`](https://ropenspain.github.io/mapSpain/reference/esp_get_nuts.md)

  `year`

  :   Release year of the file. One of `"2003"`, `"2006"`, `"2010"`,
      `"2013"`, `"2016"` or `"2021"`.

  `epsg`

  :   projection of the map: 4-digit [EPSG code](https://epsg.io/). One
      of:

      - `"4258"`: ETRS89.

      - `"4326"`: WGS84.

      - `"3035"`: ETRS89 / ETRS-LAEA.

      - `"3857"`: Pseudo-Mercator.

  `cache`

  :   A logical whether to do caching. Default is `TRUE`. See **About
      caching**.

  `update_cache`

  :   A logical whether to update cache. Default is `FALSE`. When set to
      `TRUE` it would force a fresh download of the source file.

  `cache_dir`

  :   A path to a cache directory. See **About caching**.

  `verbose`

  :   Logical, displays information. Useful for debugging, default is
      `FALSE`.

  `resolution`

  :   Resolution of the geospatial data. One of

      - `"60"`: 1:60million

      - `"20"`: 1:20million

      - `"10"`: 1:10million

      - `"03"`: 1:3million

      - `"01"`: 1:1million

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
object.

## About caching

You can set your `cache_dir` with
[`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/reference/esp_set_cache_dir.md).

Sometimes cached files may be corrupt. On that case, try re-downloading
the data setting `update_cache = TRUE`.

If you experience any problem on download, try to download the
corresponding .geojson file by any other method and save it on your
`cache_dir`. Use the option `verbose = TRUE` for debugging the API
query.

## Displacing the Canary Islands

While `moveCAN` is useful for visualization, it would alter the actual
geographic position of the Canary Islands. When using the output for
spatial analysis or using tiles (e.g. with
[`esp_getTiles()`](https://ropenspain.github.io/mapSpain/reference/esp_getTiles.md)
or
[`addProviderEspTiles()`](https://ropenspain.github.io/mapSpain/reference/addProviderEspTiles.md))
this option should be set to `FALSE` in order to get the actual
coordinates, instead of the modified ones. See also
[`esp_move_can()`](https://ropenspain.github.io/mapSpain/reference/esp_move_can.md)
for displacing stand-alone
[`sf`](https://r-spatial.github.io/sf/reference/sf.html) objects.

## See also

Other political:
[`esp_codelist`](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md),
[`esp_get_can_box()`](https://ropenspain.github.io/mapSpain/reference/esp_get_can_box.md),
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/reference/esp_get_capimun.md),
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/reference/esp_get_ccaa.md),
[`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/reference/esp_get_comarca.md),
[`esp_get_gridmap`](https://ropenspain.github.io/mapSpain/reference/esp_get_gridmap.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/reference/esp_get_munic.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_prov.md),
[`esp_get_simpl_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_simplified.md)

## Examples

``` r
OriginalCan <- esp_get_country(moveCAN = FALSE)

# One row only

nrow(OriginalCan)
#> [1] 1

library(ggplot2)

ggplot(OriginalCan) +
  geom_sf(fill = "grey70")



# Less resolution

MovedCan <- esp_get_country(moveCAN = TRUE, resolution = "20")

library(ggplot2)

ggplot(MovedCan) +
  geom_sf(fill = "grey70")
```
