# Get 'comarcas' of Spain as [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`

Returns 'comarcas' of Spain as `sf` `POLYGON` objects.

## Usage

``` r
esp_get_comarca(
  region = NULL,
  comarca = NULL,
  moveCAN = TRUE,
  type = c("INE", "IGN", "AGR", "LIV"),
  epsg = "4258",
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

  A vector of names and/or codes for provinces or `NULL` to get all the
  comarcas. See **Details**.

- comarca:

  A name or [`regex`](https://rdrr.io/r/base/grep.html) expression with
  the names of the required comarcas. `NULL` would return all the
  possible comarcas.

- moveCAN:

  A logical `TRUE/FALSE` or a vector of coordinates `c(lat, lon)`. It
  places the Canary Islands close to Spain's mainland. Initial position
  can be adjusted using the vector of coordinates. See **Displacing the
  Canary Islands**.

- type:

  One of `"INE"`, `"IGN"`, `"AGR"`, `"LIV"`. Type of comarca to return,
  see **Details**.

- epsg:

  projection of the map: 4-digit [EPSG code](https://epsg.io/). One of:

  - `"4258"`: ETRS89.

  - `"4326"`: WGS84.

  - `"3035"`: ETRS89 / ETRS-LAEA.

  - `"3857"`: Pseudo-Mercator.

- update_cache:

  A logical whether to update cache. Default is `FALSE`. When set to
  `TRUE` it would force a fresh download of the source file.

- cache_dir:

  A path to a cache directory. See **About caching**.

- verbose:

  Logical, displays information. Useful for debugging, default is
  `FALSE`.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) polygon
object.

## Details

### About comarcas

'Comarcas' (English equivalent: district, county, area or zone) does not
always have a formal legal status. They correspond mainly to natural
areas (valleys, river basins etc.) or even to historical regions or
ancient kingdoms.

In the case of Spain, comarcas only have an administrative character
legally recognized in Catalonia, the Basque Country, Navarra (named
merindades instead), in the region of El Bierzo (Castilla y Leon) and
Aragon. Galicia, the Principality of Asturias, and Andalusia have
functional comarcas.

### Types

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

### Misc

When using `region` you can use and mix names and NUTS codes (levels 1,
2 or 3), ISO codes (corresponding to level 2 or 3) or "cpro" (see
[esp_codelist](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md)).

When calling a higher level (Province, Autonomous Community or NUTS1),
all the comarcas of that level would be added.

### Legal Notice

The use of the information contained on the [INE
website](https://www.ine.es/en/index.htm) may be carried out by users or
re-use agents, at their own risk, and they will be the sole liable
parties in the case of having to answer to third parties due to damages
arising from such use.

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
[`esp_get_country()`](https://ropenspain.github.io/mapSpain/reference/esp_get_country.md),
[`esp_get_gridmap`](https://ropenspain.github.io/mapSpain/reference/esp_get_gridmap.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/reference/esp_get_munic.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_prov.md),
[`esp_get_simpl_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_simplified.md)

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
