# Get static tiles from public administrations of Spain

Get static map tiles based on a spatial object. Maps can be fetched from
various open map servers.

This function is a implementation of the javascript plugin
[leaflet-providersESP](https://dieghernan.github.io/leaflet-providersESP/)
**v1.3.3**.

## Usage

``` r
esp_get_tiles(
  x,
  type = "IDErioja",
  zoom = NULL,
  zoommin = 0,
  crop = TRUE,
  res = 512,
  bbox_expand = 0.05,
  transparent = TRUE,
  mask = FALSE,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE,
  options = NULL
)
```

## Source

<https://dieghernan.github.io/leaflet-providersESP/> leaflet plugin,
**v1.3.3**.

## Arguments

- x:

  An [`sf`](https://r-spatial.github.io/sf/reference/sf.html) or
  [`sfc`](https://r-spatial.github.io/sf/reference/sfc.html) object.

- type:

  This argument could be either:

  - The name of one of the pre-defined providers (see
    [esp_tiles_providers](https://ropenspain.github.io/mapSpain/dev/reference/esp_tiles_providers.md)).

  - A list with two named elements `id` and `q` with your own arguments.
    See
    [`esp_make_provider()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_make_provider.md)
    and examples.

- zoom:

  character string or number. Only valid for WMTS providers, zoom level
  to be downloaded. If `NULL`, it is determined automatically. If set,
  it overrides `zoommin`. On a single `sf` `POINT` and `zoom = NULL` the
  function set a zoom level of 18. See **Details**.

- zoommin:

  character string or number. Delta on default `zoom`. The default value
  is designed to download fewer tiles than you probably want. Use `1` or
  `2` to increase the resolution.

- crop:

  logical. On `TRUE` the results would be cropped to the specified `x`
  extent. If `x` is an
  [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object with
  one `POINT`, `crop` is set to `FALSE`. See
  [`terra::crop()`](https://rspatial.github.io/terra/reference/crop.html).

- res:

  character string or number. Only valid for WMS providers. Resolution
  (in pixels) of the final tile.

- bbox_expand:

  number. Expansion percentage of the bounding box of `x`.

- transparent:

  logical. Provides transparent background, if supported.

- mask:

  logical. `TRUE` if the result should be masked to `x`, See
  [`terra::mask()`](https://rspatial.github.io/terra/reference/mask.html).

- update_cache:

  logical. Should the cached file be refreshed? Default is `FALSE`. When
  set to `TRUE` it would force a new download.

- cache_dir:

  character string. A path to a cache directory. See **Caching
  strategies** section in
  [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).

- verbose:

  logical. If `TRUE` displays informational messages.

- options:

  A named list containing additional options to pass to the query.

## Value

A `SpatRaster` with 3 (RGB) or 4 (RGBA) layers, depending on the
provider. See
[`terra::rast()`](https://rspatial.github.io/terra/reference/rast.html).

## Details

Zoom levels are described on the [OpenStreetMap
wiki](https://wiki.openstreetmap.org/wiki/Zoom_levels):

|      |                       |
|------|-----------------------|
| zoom | area to represent     |
| 0    | whole world           |
| 3    | large country         |
| 5    | state                 |
| 8    | county                |
| 10   | metropolitan area     |
| 11   | city                  |
| 13   | village or suburb     |
| 16   | streets               |
| 18   | some buildings, trees |

For a complete list of providers see
[esp_tiles_providers](https://ropenspain.github.io/mapSpain/dev/reference/esp_tiles_providers.md).

Most WMS/WMTS providers provide tiles on
[`"EPSG:3857"`](https://epsg.io/3857). In case that the tile looks
deformed, try projecting first `x`:

`x <- sf::st_transform(x, 3857)`

## See also

[`terra::rast()`](https://rspatial.github.io/terra/reference/rast.html),
[esp_tiles_providers](https://ropenspain.github.io/mapSpain/dev/reference/esp_tiles_providers.md).

Other functions for creating maps with images:
[`addProviderEspTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/addProviderEspTiles.md),
[`esp_make_provider()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_make_provider.md)

## Examples

``` r
# \dontrun{

# This example downloads data to your local computer!

segovia <- esp_get_prov_siane("segovia", epsg = 3857)
tile <- esp_get_tiles(segovia, "IGNBase.Todo")

library(ggplot2)
library(tidyterra)
#> 
#> Attaching package: 'tidyterra'
#> The following object is masked from 'package:stats':
#> 
#>     filter

ggplot(segovia) +
  geom_spatraster_rgb(data = tile, maxcell = Inf) +
  geom_sf(fill = NA, linewidth = 1)


# Another provider

tile2 <- esp_get_tiles(segovia, type = "MDT")

ggplot(segovia) +
  geom_spatraster_rgb(data = tile2, maxcell = Inf) +
  geom_sf(fill = NA, linewidth = 1, color = "red")


# A custom WMS provided

custom_wms <- esp_make_provider(
  id = "an_id_for_caching",
  q = "https://idecyl.jcyl.es/geoserver/ge/wms?",
  service = "WMS",
  version = "1.3.0",
  format = "image/png",
  layers = "geolog_cyl_litologia"
)

custom_wms_tile <- esp_get_tiles(segovia, custom_wms)

autoplot(custom_wms_tile, maxcell = Inf) +
  geom_sf(data = segovia, fill = NA, color = "red", linewidth = 1)


# A custom WMTS provider

custom_wmts <- esp_make_provider(
  id = "cyl_wmts",
  q = "https://www.ign.es/wmts/pnoa-ma?",
  service = "WMTS",
  layer = "OI.OrthoimageCoverage"
)

custom_wmts_tile <- esp_get_tiles(segovia, custom_wmts)

autoplot(custom_wmts_tile, maxcell = Inf) +
  geom_sf(data = segovia, fill = NA, color = "white", linewidth = 1)


# Example from https://leaflet-extras.github.io/leaflet-providers/preview/
cartodb_dark <- list(
  id = "CartoDB_DarkMatter",
  q = "https://a.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png"
)
cartodb_dark_tile <- esp_get_tiles(segovia, cartodb_dark,
  zoommin = 1,
  update_cache = TRUE
)

autoplot(cartodb_dark_tile, maxcell = Inf) +
  geom_sf(data = segovia, fill = NA, color = "white", linewidth = 1)

# }
```
