# Autonomous Communities of Spain - GISCO

Returns [Autonomous Communities of
Spain](https://en.wikipedia.org/wiki/Autonomous_communities_of_Spain) at
a specified scale.

## Usage

``` r
esp_get_ccaa(ccaa = NULL, moveCAN = TRUE, ...)
```

## Source

<https://gisco-services.ec.europa.eu/distribution/v2/>.

Copyright:
<https://ec.europa.eu/eurostat/web/gisco/geodata/administrative-units>.

## Arguments

- ccaa:

  character string. A vector of names and/or codes for Autonomous
  Communities or `NULL` to get all the autonomous communities. See
  **Details**.

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

  `spatialtype`

  :   character string. Type of geometry to be returned. Options
      available are:

      - "RG": Regions - `MULTIPOLYGON/POLYGON` object.

      - "LB": Labels - `POINT` object.

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

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object.

## Details

When using `ccaa` you can use and mix names and NUTS codes (levels 1 or
2), ISO codes (corresponding to level 2) or `codauto` (see
[esp_codelist](https://ropenspain.github.io/mapSpain/dev/reference/esp_codelist.md)).
Ceuta and Melilla are considered as Autonomous Communities on this
function.

When calling a NUTS1 level, all the Autonomous Communities of that level
would be added.

## Note

Please check the download and usage provisions on
[`gisco_attributions()`](https://ropengov.github.io/giscoR/reference/gisco_attributions.html).

## See also

Other datasets representing political borders:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
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
[`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md),
[`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)

Datasets provided by GISCO:
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov.md),
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md)

## Examples

``` r
ccaa <- esp_get_ccaa()

library(ggplot2)

ggplot(ccaa) +
  geom_sf()


# Random CCAA
random_ccaa <- esp_get_ccaa(ccaa = c(
  "Euskadi",
  "Catalunya",
  "ES-EX",
  "Canarias",
  "ES52",
  "01"
))


ggplot(random_ccaa) +
  geom_sf(aes(fill = codauto), show.legend = FALSE) +
  geom_sf_label(aes(label = codauto), alpha = 0.3) +
  coord_sf(crs = 3857)


# All CCAA of a Zone plus an addition

mixed <- esp_get_ccaa(ccaa = c("La Rioja", "Noroeste"))

ggplot(mixed) +
  geom_sf()


# Combine with giscoR to get countries
# \donttest{

library(giscoR)
library(sf)
#> Linking to GEOS 3.13.1, GDAL 3.11.0, PROJ 9.6.0; sf_use_s2() is TRUE

res <- 20 # Set same resoluion

europe <- gisco_get_countries(resolution = res)
ccaa <- esp_get_ccaa(moveCAN = FALSE, resolution = res)


ggplot(europe) +
  geom_sf(fill = "#DFDFDF", color = "#656565") +
  geom_sf(data = ccaa, fill = "#FDFBEA", color = "#656565") +
  coord_sf(
    xlim = c(23, 74) * 10e4,
    ylim = c(14, 55) * 10e4,
    crs = 3035
  ) +
  theme(panel.background = element_rect(fill = "#C7E7FB"))

# }
```
