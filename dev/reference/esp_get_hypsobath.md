# Hypsometry and bathymetry of Spain - SIANE

Dataset representing the hypsometry and bathymetry of Spain.

- **Hypsometry** represents the the elevation and depth of features of
  the Earth's surface relative to mean sea level.

- **Bathymetry** is the measurement of the depth of water in oceans,
  rivers, or lakes.

## Usage

``` r
esp_get_hypsobath(
  epsg = 4258,
  cache = TRUE,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE,
  resolution = c(3, 6.5),
  spatialtype = c("area", "line")
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

  character string or number. Resolution of the geospatial data. One of:

  - "6.5": 1:6.5 million.

  - "3": 1:3 million.

- spatialtype:

  character string. Spatial type of the output. Use `"area"` for
  `POLYGON` or `"line"` for `LINESTRING`.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object.

## Details

Metadata available on
<https://github.com/rOpenSpain/mapSpain/tree/sianedata/>.

## See also

Other natural features:
[`esp_get_hydrobasin()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_hydrobasin.md),
[`esp_get_landwater`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_landwater.md)

## Examples

``` r
# \donttest{
# This code would produce a nice plot - It will take a few seconds to run
library(ggplot2)

hypsobath <- esp_get_hypsobath()

# Tints from Wikipedia
# https://en.wikipedia.org/wiki/Wikipedia:WikiProject_Maps/Conventions/
# Topographic_maps


levels <- sort(unique(hypsobath$val_inf))

# Create Manual pal
br_bath <- length(levels[levels < 0])
br_terrain <- length(levels) - br_bath
pal <- c(
  tidyterra::hypso.colors(br_bath, "wiki-2.0_bathy"),
  tidyterra::hypso.colors(br_terrain, "wiki-2.0_hypso")
)


# Plot Canary Islands
ggplot(hypsobath) +
  geom_sf(aes(fill = as.factor(val_inf)),
    color = NA
  ) +
  coord_sf(
    xlim = c(-18.6, -13),
    ylim = c(27, 29.5)
  ) +
  scale_fill_manual(values = pal) +
  guides(fill = guide_legend(
    title = "Elevation",
    direction = "horizontal",
    label.position = "bottom",
    title.position = "top",
    nrow = 1
  )) +
  theme(legend.position = "bottom")



# Plot Mainland
ggplot(hypsobath) +
  geom_sf(aes(fill = as.factor(val_inf)),
    color = NA
  ) +
  coord_sf(
    xlim = c(-9.5, 4.4),
    ylim = c(35.8, 44)
  ) +
  scale_fill_manual(values = pal) +
  guides(fill = guide_legend(
    title = "Elevation",
    reverse = TRUE,
    keyheight = .8
  ))

# }
```
