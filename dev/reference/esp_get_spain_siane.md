# Boundaries of Spain - SIANE

Returns the boundaries of Spain as a single
[`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`.

## Usage

``` r
esp_get_spain_siane(moveCAN = TRUE, ...)
```

## Source

CartoBase ANE provided by Instituto Geografico Nacional (IGN),
<http://www.ign.es/web/ign/portal>. Years available are 2005 up to
today.

Copyright:
<https://centrodedescargas.cnig.es/CentroDescargas/cartobase-ane>

It's necessary to always acknowledge authorship using the following
formulas:

1.  When the original digital product is not modified or altered, it can
    be expressed in one of the following ways:

    - CartoBase ANE 2006-2024 CC-BY 4.0 ign.es

    - CartoBase ANE 2006-2024 CC-BY 4.0 Instituto Geográfico Nacional

2.  When a new product is generated:

- Obra derivada de CartoBase ANE 2006-2024 CC-BY 4.0 ign.es

Data distributed via a custom CDN, see
<https://github.com/rOpenSpain/mapSpain/tree/sianedata>.

## Arguments

- moveCAN:

  A logical `TRUE/FALSE` or a vector of coordinates `c(lat, lon)`. It
  places the Canary Islands close to Spain's mainland. Initial position
  can be adjusted using the vector of coordinates. See **Displacing the
  Canary Islands** in
  [`esp_move_can()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_move_can.md).

- ...:

  Arguments passed on to
  [`esp_get_ccaa_siane`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md)

  `year`

  :   character string or number. Release year, it must presents formats
      `YYYY` (assuming end of year) or `YYYY-MM-DD`. Historical
      information starts as of 2005.

  `resolution`

  :   character string or number. Resolution of the geospatial data. One
      of:

      - "10": 1:10 million.

      - "6.5": 1:6.5 million.

      - "3": 1:3 million.

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

  `verbose`

  :   logical. If `TRUE` displays informational messages.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object.

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
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md),
[`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)

Political borders from CartoBase ANE:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
[`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md),
[`esp_get_countries_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_countries_siane.md),
[`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md),
[`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md),
[`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)

## Examples

``` r
# \donttest{
original_can <- esp_get_spain_siane(moveCAN = FALSE)

# One row only
original_can
#> Simple feature collection with 1 feature and 9 fields
#> Geometry type: MULTIPOLYGON
#> Dimension:     XY
#> Bounding box:  xmin: -18.16066 ymin: 27.638 xmax: 4.327771 ymax: 43.78994
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
moved_can <- esp_get_spain_siane(moveCAN = TRUE, resolution = 10)

ggplot(moved_can) +
  geom_sf(fill = "grey70")

# }
```
