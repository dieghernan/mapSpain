# Provinces of Spain - SIANE

Returns [provinces of
Spain](https://en.wikipedia.org/wiki/Provinces_of_Spain) at a specified
scale.

## Usage

``` r
esp_get_prov_siane(
  prov = NULL,
  year = Sys.Date(),
  epsg = 4258,
  cache = TRUE,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE,
  resolution = c(3, 6.5, 10),
  moveCAN = TRUE,
  rawcols = FALSE
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

- prov:

  A vector of names and/or codes for provinces or `NULL` to get all the
  provinces. See **Details**.

- year:

  character string or number. Release year, it must presents formats
  `YYYY` (assuming end of year) or `YYYY-MM-DD`. Historical information
  starts as of 2005.

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

  - "10": 1:10 million.

  - "6.5": 1:6.5 million.

  - "3": 1:3 million.

- moveCAN:

  A logical `TRUE/FALSE` or a vector of coordinates `c(lat, lon)`. It
  places the Canary Islands close to Spain's mainland. Initial position
  can be adjusted using the vector of coordinates. See **Displacing the
  Canary Islands** in
  [`esp_move_can()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_move_can.md).

- rawcols:

  logical. Setting this to `TRUE` would add the raw columns of the
  resulting object as provided by IGN.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object.

## Details

When using `prov` you can use and mix names and NUTS codes (levels 1, 2
or 3), ISO codes (corresponding to level 2 or 3) or "cpro" (see
[esp_codelist](https://ropenspain.github.io/mapSpain/dev/reference/esp_codelist.md)).

Ceuta and Melilla are considered as provinces on this dataset.

When calling a higher level (Autonomous Community or NUTS1), all the
provinces of that level would be added.

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
[`esp_get_simpl`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md),
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md),
[`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md),
[`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)

Political borders from CartoBase ANE:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
[`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md),
[`esp_get_countries_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_countries_siane.md),
[`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md),
[`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md),
[`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)

## Examples

``` r
library(ggplot2)

esp_get_ccaa_siane() |>
  dplyr::glimpse() |>
  ggplot() +
  geom_sf()
#> Rows: 19
#> Columns: 22
#> $ codauto           <chr> "01", "02", "03", "04", "05", "06", "07", "08", "09"…
#> $ iso2.ccaa.code    <chr> "ES-AN", "ES-AR", "ES-AS", "ES-IB", "ES-CN", "ES-CB"…
#> $ nuts1.code        <chr> "ES6", "ES2", "ES1", "ES5", "ES7", "ES1", "ES4", "ES…
#> $ nuts2.code        <chr> "ES61", "ES24", "ES12", "ES53", "ES70", "ES13", "ES4…
#> $ ine.ccaa.name     <chr> "Andalucía", "Aragón", "Asturias, Principado de", "B…
#> $ iso2.ccaa.name.es <chr> "Andalucía", "Aragón", "Asturias, Principado de", "I…
#> $ iso2.ccaa.name.ca <chr> NA, NA, NA, "Illes Balears", NA, NA, NA, NA, "Catalu…
#> $ iso2.ccaa.name.gl <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "Galicia…
#> $ iso2.ccaa.name.eu <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ nuts2.name        <chr> "Andalucía", "Aragón", "Principado de Asturias", "Il…
#> $ cldr.ccaa.name.en <chr> "Andalusia", "Aragon", "Asturias", "Balearic Islands…
#> $ cldr.ccaa.name.es <chr> "Andalucía", "Aragón", "Principado de Asturias", "Is…
#> $ cldr.ccaa.name.ca <chr> "Andalusia", "Aragó", "Astúries", "Illes Balears", "…
#> $ cldr.ccaa.name.ga <chr> "Andalucía", "Aragón", "Principado de Asturias", "Il…
#> $ cldr.ccaa.name.eu <chr> "Andaluzia", "Aragoi", "Asturiesko Printzerria", "Ba…
#> $ ccaa.shortname.en <chr> "Andalusia", "Aragon", "Asturias", "Balearic Islands…
#> $ ccaa.shortname.es <chr> "Andalucía", "Aragón", "Asturias", "Baleares", "Cana…
#> $ ccaa.shortname.ca <chr> "Andalusia", "Aragó", "Astúries", "Illes Balears", "…
#> $ ccaa.shortname.ga <chr> "Andalucía", "Aragón", "Asturias", "Illas Baleares",…
#> $ ccaa.shortname.eu <chr> "Andaluzia", "Aragoi", "Asturias", "Balear Uharteak"…
#> $ nuts1.name        <chr> "Sur", "Noreste", "Noroeste", "Este", "Canarias", "N…
#> $ geometry          <MULTIPOLYGON [°]> MULTIPOLYGON (((-5.024684 3..., MULTIPO…
```
