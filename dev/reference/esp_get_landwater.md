# Rivers and wetlands of Spain - SIANE

Object representing rivers, lagoons, reservoirs and wetlands of Spain.

## Usage

``` r
esp_get_rivers(
  epsg = 4258,
  cache = TRUE,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE,
  resolution = deprecated(),
  spatialtype = c("line", "area"),
  moveCAN = TRUE,
  name = NULL
)

esp_get_wetlands(
  epsg = 4258,
  cache = TRUE,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE,
  moveCAN = TRUE,
  name = NULL
)
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

- epsg:

  character string or number. Projection of the map: 4-digit [EPSG
  code](https://epsg.io/). One of:

  - `"4258"`: [ETRS89](https://epsg.io/4258)

  - `"4326"`: [WGS84](https://epsg.io/4326).

  - `"3035"`: [ETRS89 / ETRS-LAEA](https://epsg.io/3035).

  - `"3857"`: [Pseudo-Mercator](https://epsg.io/3857).

- cache:

  logical. Whether to do caching. Default is `TRUE`. See **Caching
  strategies** section in
  [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).

- update_cache:

  logical. Should the cached file be refreshed? Default is `FALSE`. When
  set to `TRUE` it would force a new download.

- cache_dir:

  character string. A path to a cache directory. See **Caching
  strategies** section in
  [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).

- verbose:

  logical. If `TRUE` displays informational messages.

- resolution:

  **\[deprecated\]** character string. Ignored, resolution `3` (the most
  detailed) would be always provided.

- spatialtype:

  **\[deprecated\]** character string. Use `esp_get_wetlands()` instead
  of `"spatialtype"` for wetlands.

- moveCAN:

  A logical `TRUE/FALSE` or a vector of coordinates `c(lat, lon)`. It
  places the Canary Islands close to Spain's mainland. Initial position
  can be adjusted using the vector of coordinates. See **Displacing the
  Canary Islands** in
  [`esp_move_can()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_move_can.md).

- name:

  character string or [`regex`](https://rdrr.io/r/base/grep.html)
  expression. Name of the element(s) to be extracted.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object.

## Details

Metadata available on
<https://github.com/rOpenSpain/mapSpain/tree/sianedata/>.

## See also

Other natural features:
[`esp_get_hydrobasin()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_hydrobasin.md),
[`esp_get_hypsobath()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_hypsobath.md)

## Examples

``` r
# \donttest{
# Use of regex

regex1 <- esp_get_rivers(name = "Tajo|Segura")
unique(regex1$rotulo)
#> [1] "Río Tajo"                        "Río Segura"                     
#> [3] "Canal del Transvase Tajo-Segura"


regex2 <- esp_get_rivers(name = "Tajo$| Segura")
unique(regex2$rotulo)
#> [1] "Río Tajo"   "Río Segura"

# See the diference

# Rivers in Spain
iberian <- giscoR::gisco_get_countries(
  country = c("ES", "PT", "FR"), resolution = 3
)

main_rivers <- esp_get_rivers() |>
  dplyr::filter(t_rio == 1)

library(ggplot2)

ggplot(iberian) +
  geom_sf() +
  geom_sf(data = main_rivers, color = "skyblue", linewidth = 2) +
  coord_sf(
    xlim = c(-10, 5),
    ylim = c(35, 44)
  )



# Wetlands in South-West Andalucia
and <- esp_get_prov(c("Huelva", "Sevilla", "Cadiz"))
wetlands <- esp_get_wetlands()
wetlands_south <- sf::st_filter(wetlands, and)

ggplot(and) +
  geom_sf() +
  geom_sf(
    data = wetlands_south, fill = "skyblue",
    color = "skyblue", alpha = 0.5
  )

# }
```
