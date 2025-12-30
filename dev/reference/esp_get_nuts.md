# Territorial Spanish units for statistics (NUTS) dataset

The GISCO statistical unit dataset represents the NUTS (nomenclature of
territorial units for statistics) and statistical regions by means of
multipart polygon, polyline and point topology. The NUTS geographical
information is completed by attribute tables and a set of cartographic
help lines to better visualise multipart polygonal regions.

The NUTS are a hierarchical system divided into 3 levels:

- NUTS 1: major socio-economic regions

- NUTS 2: basic regions for the application of regional policies

- NUTS 3: small regions for specific diagnoses.

Also, there is a NUTS 0 level, which usually corresponds to the national
boundaries.

## Usage

``` r
esp_get_nuts(
  year = 2024,
  epsg = 4258,
  cache = TRUE,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE,
  resolution = 1,
  spatialtype = c("RG", "LB"),
  region = NULL,
  nuts_level = c("all", "0", "1", "2", "3"),
  moveCAN = TRUE,
  ext = "gpkg"
)
```

## Source

<https://gisco-services.ec.europa.eu/distribution/v2/>.

Copyright:
<https://ec.europa.eu/eurostat/web/gisco/geodata/administrative-units>.

## Arguments

- year:

  year character string or number. Release year of the file. See
  [`giscoR::gisco_get_nuts()`](https://ropengov.github.io/giscoR/reference/gisco_get_nuts.html)
  for valid values.

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

  character string or number. Resolution of the geospatial data. One of:

  - `"60"`: 1:60 million.

  - `"20"`: 1:20 million.

  - `"10"`: 1:10 million.

  - `"03"`: 1:3 million.

  - `"01"`: 1:1 million.

- spatialtype:

  character string. Type of geometry to be returned. Options available
  are:

  - "RG": Regions - `MULTIPOLYGON/POLYGON` object.

  - "LB": Labels - `POINT` object.

- region:

  Optional. A vector of region names, NUTS or ISO codes (see
  [`esp_dict_region_code()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_dict.md)).

- nuts_level:

  character string. NUTS level. One of `0`, `1`, `2`, `3` or `all` for
  all levels.

- moveCAN:

  A logical `TRUE/FALSE` or a vector of coordinates `c(lat, lon)`. It
  places the Canary Islands close to Spain's mainland. Initial position
  can be adjusted using the vector of coordinates. See **Displacing the
  Canary Islands** in
  [`esp_move_can()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_move_can.md).

- ext:

  character. Extension of the file (default `"gpkg"`). See
  [`giscoR::gisco_get_nuts()`](https://ropengov.github.io/giscoR/reference/gisco_get_nuts.html).

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object.

## Details

The NUTS nomenclature is a hierarchical classification of statistical
regions and subdivides the EU economic territory into regions of three
different levels (NUTS 1, 2 and 3, moving respectively from larger to
smaller territorial units). NUTS 1 is the most aggregated level. An
additional Country level (NUTS 0) is also available for countries where
the nation at statistical level does not coincide with the
administrative boundaries.

The NUTS classification has been officially established through
Commission Delegated Regulation 2019/1755. A non-official NUTS-like
classification has been defined for the EFTA countries, candidate
countries and potential candidates based on a bilateral agreement
between Eurostat and the respective statistical agencies.

An introduction to the NUTS classification is available here:
<https://ec.europa.eu/eurostat/web/nuts/overview>.

## Note

Please check the download and usage provisions on
[`gisco_attributions()`](https://ropengov.github.io/giscoR/reference/gisco_attributions.html).

## See also

[`giscoR::gisco_get_nuts()`](https://ropengov.github.io/giscoR/reference/gisco_get_nuts.html),
[`esp_dict_region_code()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_dict.md).

Other datasets representing political borders:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md),
[`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md),
[`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_comarca.md),
[`esp_get_countries_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_countries_siane.md),
[`esp_get_gridmap`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic.md),
[`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov.md),
[`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md),
[`esp_get_simpl`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md),
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md),
[`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md),
[`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)

Other nuts:
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md)

Datasets provided by GISCO:
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov.md),
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md)

## Examples

``` r
nuts1 <- esp_get_nuts(nuts_level = 1, moveCAN = TRUE)

library(ggplot2)

ggplot(nuts1) +
  geom_sf() +
  labs(
    title = "NUTS1: Displacing Canary Islands",
    caption = giscoR::gisco_attributions()
  )



nuts1_alt <- esp_get_nuts(nuts_level = 1, moveCAN = c(15, 0))


ggplot(nuts1_alt) +
  geom_sf() +
  labs(
    title = "NUTS1: Displacing Canary Islands",
    subtitle = "to the right",
    caption = giscoR::gisco_attributions()
  )



nuts1_orig <- esp_get_nuts(nuts_level = 1, moveCAN = FALSE)

ggplot(nuts1_orig) +
  geom_sf() +
  labs(
    title = "NUTS1",
    subtitle = "Canary Islands on the true location",
    caption = giscoR::gisco_attributions()
  )



and_orient <- esp_get_nuts(region = c(
  "Almeria", "Granada",
  "Jaen", "Malaga"
))


ggplot(and_orient) +
  geom_sf()



random_regions <- esp_get_nuts(region = c("ES1", "ES300", "ES51"))

ggplot(random_regions) +
  geom_sf() +
  labs(title = "Random Regions")



mixing_codes <- esp_get_nuts(region = c("ES4", "ES-PV", "Valencia"))


ggplot(mixing_codes) +
  geom_sf() +
  labs(title = "Mixing Codes")
```
