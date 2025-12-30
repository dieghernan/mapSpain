# Provinces of Spain - GISCO

Returns [provinces of
Spain](https://en.wikipedia.org/wiki/Provinces_of_Spain) at a specified
scale.

## Usage

``` r
esp_get_prov(prov = NULL, moveCAN = TRUE, ...)
```

## Source

<https://gisco-services.ec.europa.eu/distribution/v2/>.

Copyright:
<https://ec.europa.eu/eurostat/web/gisco/geodata/administrative-units>.

## Arguments

- prov:

  A vector of names and/or codes for provinces or `NULL` to get all the
  provinces. See **Details**.

- moveCAN:

  A logical `TRUE/FALSE` or a vector of coordinates `c(lat, lon)`. It
  places the Canary Islands close to Spain's mainland. Initial position
  can be adjusted using the vector of coordinates. See **Displacing the
  Canary Islands** in
  [`esp_move_can()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_move_can.md).

- ...:

  Arguments passed on to
  [`esp_get_nuts`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md),
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

When using `prov` you can use and mix names and NUTS codes (levels 1, 2
or 3), ISO codes (corresponding to level 2 or 3) or "cpro" (see
[esp_codelist](https://ropenspain.github.io/mapSpain/dev/reference/esp_codelist.md)).

Ceuta and Melilla are considered as provinces on this dataset.

When calling a higher level (Autonomous Community or NUTS1), all the
provinces of that level would be added.

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
[`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md),
[`esp_get_simpl`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md),
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md),
[`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md),
[`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)

Datasets provided by GISCO:
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md),
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md)

## Examples

``` r
prov <- esp_get_prov()

library(ggplot2)

ggplot(prov) +
  geom_sf() +
  theme_minimal()


# \donttest{
# Random Provinces
random <- esp_get_prov(prov = c(
  "Zamora", "Palencia", "ES-GR",
  "ES521", "01"
))


ggplot(random) +
  geom_sf(aes(fill = codauto), show.legend = FALSE, alpha = 0.5) +
  scale_fill_manual(values = hcl.colors(nrow(random), "Spectral")) +
  theme_minimal()



# All Provinces of a Zone plus an addition
mix <- esp_get_prov(prov = c(
  "Noroeste",
  "Castilla y Leon", "La Rioja"
))

mix$ccaa <- esp_dict_region_code(
  mix$codauto,
  origin = "codauto"
)

ggplot(mix) +
  geom_sf(aes(fill = ccaa), alpha = 0.5) +
  scale_fill_discrete(type = hcl.colors(5, "Temps")) +
  theme_classic()


# ISO codes available

allprovs <- esp_get_prov()

ggplot(allprovs) +
  geom_sf(fill = NA) +
  geom_sf_text(aes(label = iso2.prov.code),
    check_overlap = TRUE,
    fontface = "bold"
  ) +
  coord_sf(crs = 3857) +
  theme_void()

# }
```
