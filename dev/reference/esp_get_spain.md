# Boundaries of Spain - GISCO

Returns the boundaries of Spain as a single
[`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON` at a
specified scale.

## Usage

``` r
esp_get_spain(moveCAN = TRUE, ...)
```

## Source

<https://gisco-services.ec.europa.eu/distribution/v2/>.

Copyright:
<https://ec.europa.eu/eurostat/web/gisco/geodata/administrative-units>.

## Arguments

- moveCAN:

  A logical `TRUE/FALSE` or a vector of coordinates `c(lat, lon)`. It
  places the Canary Islands close to Spain's mainland. Initial position
  can be adjusted using the vector of coordinates. See **Displacing the
  Canary Islands** in
  [`esp_move_can()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_move_can.md).

- ...:

  Arguments passed on to
  [`esp_get_nuts`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md)

  `year`

  :   year character string or number. Release year of the file. See
      [`giscoR::gisco_get_nuts()`](https://ropengov.github.io/giscoR/reference/gisco_get_nuts.html)
      for valid values.

  `epsg`

  :   character string or number. Projection of the map: 4-digit [EPSG
      code](https://epsg.io/). One of:

      - `"4258"`: [ETRS89](https://epsg.io/4258)

      - `"4326"`: [WGS84](https://epsg.io/4326).

      - `"3035"`: [ETRS89 / ETRS-LAEA](https://epsg.io/3035).

      - `"3857"`: [Pseudo-Mercator](https://epsg.io/3857).

  `cache`

  :   logical. Whether to do caching. Default is `TRUE`. See **Caching
      strategies** section in
      [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).

  `update_cache`

  :   logical. Should the cached file be refreshed? Default is `FALSE`.
      When set to `TRUE` it would force a new download.

  `cache_dir`

  :   character string. A path to a cache directory. See **Caching
      strategies** section in
      [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).

  `ext`

  :   character. Extension of the file (default `"gpkg"`). See
      [`giscoR::gisco_get_nuts()`](https://ropengov.github.io/giscoR/reference/gisco_get_nuts.html).

  `verbose`

  :   logical. If `TRUE` displays informational messages.

  `resolution`

  :   character string or number. Resolution of the geospatial data. One
      of:

      - `"60"`: 1:60 million.

      - `"20"`: 1:20 million.

      - `"10"`: 1:10 million.

      - `"03"`: 1:3 million.

      - `"01"`: 1:1 million.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
object.

## Details

Dataset derived of NUTS data provided by GISCO. Check
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md)
for details.

## Note

Please check the download and usage provisions on
[`gisco_attributions()`](https://ropengov.github.io/giscoR/reference/gisco_attributions.html).

## See also

Other datasets representing political borders:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md),
[`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md),
[`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_comarca.md),
[`esp_get_countries_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_countries_siane.md),
[`esp_get_gridmap`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic.md),
[`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov.md),
[`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md),
[`esp_get_simpl`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md),
[`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md),
[`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)

Other nuts:
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md)

Datasets provided by GISCO:
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov.md)

## Examples

``` r
# \donttest{
original_can <- esp_get_spain(moveCAN = FALSE)

# One row only
original_can
#> Simple feature collection with 1 feature and 9 fields
#> Geometry type: MULTIPOLYGON
#> Dimension:     XY
#> Bounding box:  xmin: -18.15996 ymin: 27.63846 xmax: 4.320228 ymax: 43.78924
#> Geodetic CRS:  ETRS89
#> # A tibble: 1 × 10
#>   NUTS_ID LEVL_CODE CNTR_CODE NAME_LATN NUTS_NAME MOUNT_TYPE URBN_TYPE
#> * <chr>       <int> <chr>     <chr>     <chr>          <int>     <int>
#> 1 ES              0 ES        España    España            NA        NA
#> # ℹ 3 more variables: COAST_TYPE <int>, geo <chr>, geometry <MULTIPOLYGON [°]>


library(ggplot2)

ggplot(original_can) +
  geom_sf(fill = "grey70")


# Less resolution
moved_can <- esp_get_spain(moveCAN = TRUE, resolution = 20)

ggplot(moved_can) +
  geom_sf(fill = "grey70")

# }
```
