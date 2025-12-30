# Municipalities of Spain - GISCO

This dataset shows boundaries of municipalities in Spain.

## Usage

``` r
esp_get_munic(
  year = 2024,
  epsg = 4258,
  cache = deprecated(),
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE,
  region = NULL,
  munic = NULL,
  moveCAN = TRUE,
  ext = "gpkg"
)
```

## Source

<https://gisco-services.ec.europa.eu/distribution/v2/>.

Copyright:
<https://ec.europa.eu/eurostat/web/gisco/geodata/statistical-units>.

## Arguments

- year:

  year character string or number. Release year of the file. See
  [`giscoR::gisco_get_lau()`](https://ropengov.github.io/giscoR/reference/gisco_get_lau.html)
  and
  [`giscoR::gisco_get_communes()`](https://ropengov.github.io/giscoR/reference/gisco_get_communes.html)
  for valid values.

- epsg:

  character string or number. Projection of the map: 4-digit [EPSG
  code](https://epsg.io/). One of:

  - `"4258"`: [ETRS89](https://epsg.io/4258)

  - `"4326"`: [WGS84](https://epsg.io/4326).

  - `"3035"`: [ETRS89 / ETRS-LAEA](https://epsg.io/3035).

  - `"3857"`: [Pseudo-Mercator](https://epsg.io/3857).

- cache:

  **\[deprecated\]**. This argument is deprecated, the dataset would be
  always downloaded to the `cache_dir`.

- update_cache:

  logical. Should the cached file be refreshed? Default is `FALSE`. When
  set to `TRUE` it would force a new download.

- cache_dir:

  character string. A path to a cache directory. See **Caching
  strategies** section in
  [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).

- verbose:

  logical. If `TRUE` displays informational messages.

- region:

  Optional. A vector of region names, NUTS or ISO codes (see
  [`esp_dict_region_code()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_dict.md)).

- munic:

  character string. A name or
  [`regex`](https://rdrr.io/r/base/grep.html) expression with the names
  of the required municipalities. `NULL` would return all
  municipalities.

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

When using `region` you can use and mix names and NUTS codes (levels 1,
2 or 3), ISO codes (corresponding to level 2 or 3) or `"cpro"` (see
[esp_codelist](https://ropenspain.github.io/mapSpain/dev/reference/esp_codelist.md)).

When calling a higher level (province, CCAA or NUTS1), all the
municipalities of that level would be added.

## Note

Please check the download and usage provisions on
[`gisco_attributions()`](https://ropengov.github.io/giscoR/reference/gisco_attributions.html).

## See also

[`giscoR::gisco_get_lau()`](https://ropengov.github.io/giscoR/reference/gisco_get_lau.html),
[`giscoR::gisco_get_communes()`](https://ropengov.github.io/giscoR/reference/gisco_get_communes.html).

Other datasets representing political borders:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md),
[`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md),
[`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_comarca.md),
[`esp_get_countries_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_countries_siane.md),
[`esp_get_gridmap`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md),
[`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov.md),
[`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md),
[`esp_get_simpl`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md),
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md),
[`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md),
[`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)

Datasets representing municipalities:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
[`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md)

Datasets provided by GISCO:
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov.md),
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md)

## Examples

``` r
# \donttest{
# The Spanish Lapland:
# https://en.wikipedia.org/wiki/Celtiberian_Range

# Get munics
spanish_laplad <- esp_get_munic(
  year = 2023,
  region = c(
    "Cuenca", "Teruel",
    "Zaragoza", "Guadalajara",
    "Soria", "Burgos",
    "La Rioja"
  )
)
#> ! The file to be downloaded has size 61 Mb.

breaks <- sort(c(0, 5, 10, 50, 100, 200, 500, 1000, Inf))
spanish_laplad$dens_breaks <- cut(spanish_laplad$POP_DENS_2023, breaks,
  dig.lab = 20
)

cut_labs <- prettyNum(breaks, big.mark = " ")[-1]
cut_labs[length(breaks)] <- "> 1000"

library(ggplot2)
ggplot(spanish_laplad) +
  geom_sf(aes(fill = dens_breaks), color = "grey30", linewidth = 0.1) +
  scale_fill_manual(
    values = hcl.colors(length(breaks) - 1, "Spectral"), na.value = "black",
    name = "people per sq. kilometer",
    labels = cut_labs,
    guide = guide_legend(
      direction = "horizontal",
      nrow = 1
    )
  ) +
  theme_void() +
  labs(
    title = "The Spanish Lapland",
    caption = giscoR::gisco_attributions()
  ) +
  theme(
    text = element_text(colour = "white"),
    plot.background = element_rect(fill = "grey2"),
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5, face = "bold"),
    plot.caption = element_text(
      color = "grey60", hjust = 0.5, vjust = 0,
      margin = margin(t = 5, b = 10)
    ),
    legend.position = "bottom",
    legend.title.position = "top",
    legend.text.position = "bottom",
    legend.key.height = unit(0.5, "lines"),
    legend.key.width = unit(1, "lines")
  )

# }
```
