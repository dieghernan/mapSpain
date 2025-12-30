# 'Comarcas' of Spain

Returns [Comarcas of
Spain](https://en.wikipedia.org/wiki/Comarcas_of_Spain). Comarcas are
traditional informal territorial division, comprising several
municipalities sharing geographical, economic or cultural traits,
typically with not well defined limits.

## Usage

``` r
esp_get_comarca(
  region = NULL,
  comarca = NULL,
  moveCAN = TRUE,
  type = c("INE", "IGN", "AGR", "LIV"),
  epsg = 4258,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE
)
```

## Source

INE: PC_Axis files, IGN, Ministry of Agriculture, Fisheries and Food
(MAPA).

## Arguments

- region:

  character string. A vector of names and/or codes for provinces or
  `NULL` to get all the comarcas. See **Details**.

- comarca:

  character string. A name or
  [`regex`](https://rdrr.io/r/base/grep.html) expression with the names
  of the required comarcas. `NULL` would return all the possible
  comarcas.

- moveCAN:

  A logical `TRUE/FALSE` or a vector of coordinates `c(lat, lon)`. It
  places the Canary Islands close to Spain's mainland. Initial position
  can be adjusted using the vector of coordinates. See **Displacing the
  Canary Islands** in
  [`esp_move_can()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_move_can.md).

- type:

  character string. One of `"INE"`, `"IGN"`, `"AGR"`, `"LIV"`. Type of
  comarca to return, see **Details**.

- epsg:

  character string or number. Projection of the map: 4-digit [EPSG
  code](https://epsg.io/). One of:

  - `"4258"`: [ETRS89](https://epsg.io/4258)

  - `"4326"`: [WGS84](https://epsg.io/4326).

  - `"3035"`: [ETRS89 / ETRS-LAEA](https://epsg.io/3035).

  - `"3857"`: [Pseudo-Mercator](https://epsg.io/3857).

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

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object.

## Details

When using `region` you can use and mix names and NUTS codes (levels 1,
2 or 3), ISO codes (corresponding to level 2 or 3) or "cpro" (see
[esp_codelist](https://ropenspain.github.io/mapSpain/dev/reference/esp_codelist.md)).

When calling a higher level (Province, Autonomous Community or NUTS1),
all the comarcas of that level would be added.

## Note

The use of the information contained on the [INE
website](https://www.ine.es/en/index.htm) may be carried out by users or
re-use agents, at their own risk, and they will be the sole liable
parties in the case of having to answer to third parties due to damages
arising from such use.

## About comarcas

'Comarcas' (English equivalent: district, county, area or zone) does not
always have a formal legal status. They correspond mainly to natural
areas (valleys, river basins, etc.) or even to historical regions or
ancient kingdoms.

In the case of Spain, comarcas only have an administrative character
legally recognized in Catalonia, the Basque Country, Navarra (named
merindades instead), in the region of El Bierzo (Castilla y Leon) and
Aragon. Galicia, the Principality of Asturias, and Andalusia have
functional comarcas.

## Types

`esp_get_comarca()` can retrieve several types of comarcas, each one
provided under different classification criteria.

- `"INE"`: Comarcas as defined by the National Statistics Institute
  (INE).

- `"IGN"`: Official comarcas, only available on some Autonomous
  Communities, provided by the National Geographic Institute.

- `"AGR"`: Agrarian comarcas defined by the Ministry of Agriculture,
  Fisheries and Food (MAPA).

- `"LIV"`: Livestock comarcas defined by the Ministry of Agriculture,
  Fisheries and Food (MAPA).

## Note

Please check the download and usage provisions on
[`gisco_attributions()`](https://ropengov.github.io/giscoR/reference/gisco_attributions.html).

## See also

Other datasets representing political borders:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md),
[`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md),
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

## Examples

``` r
# \donttest{
comarcas <- esp_get_comarca(moveCAN = FALSE)

library(ggplot2)

ggplot(comarcas) +
  geom_sf()


# IGN provides recognized comarcas

rec <- esp_get_comarca(type = "IGN")

ggplot(rec) +
  geom_sf(aes(fill = t_comarca))


# Legal Comarcas of Catalunya

comarcas_cat <- esp_get_comarca("Catalunya", type = "IGN")

ggplot(comarcas_cat) +
  geom_sf(aes(fill = ine.prov.name)) +
  labs(fill = "Province")

# }
```
