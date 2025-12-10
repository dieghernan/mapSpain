# Include base tiles of Spanish public administrations on a [leaflet](https://CRAN.R-project.org/package=leaflet) map

Include tiles of public Spanish organisms to a
[`leaflet::leaflet()`](https://rstudio.github.io/leaflet/reference/leaflet.html)
map.

## Usage

``` r
addProviderEspTiles(
  map,
  provider,
  layerId = NULL,
  group = NULL,
  options = providerEspTileOptions()
)

providerEspTileOptions(...)
```

## Source

<https://dieghernan.github.io/leaflet-providersESP/> leaflet plugin,
**v1.3.3**.

## Arguments

- map:

  the map to add the tile layer to

- provider:

  Name of the provider, see
  [esp_tiles_providers](https://ropenspain.github.io/mapSpain/reference/esp_tiles_providers.md)
  for values available.

- layerId:

  the layer id to assign

- group:

  the name of the group the newly created layers should belong to (for
  [`clearGroup()`](https://rstudio.github.io/leaflet/reference/remove.html)
  and
  [`addLayersControl()`](https://rstudio.github.io/leaflet/reference/addLayersControl.html)
  purposes). Human-friendly group names are permitted–they need not be
  short, identifier-style names.

- options:

  tile options

- ...:

  Arguments passed on to
  [`leaflet::providerTileOptions()`](https://rstudio.github.io/leaflet/reference/addProviderTiles.html).

## Value

A modified
[`leaflet::leaflet()`](https://rstudio.github.io/leaflet/reference/leaflet.html)
`map` object.

## Details

`providerEspTileOptions()` is a wrapper of
[`leaflet::providerTileOptions()`](https://rstudio.github.io/leaflet/reference/addProviderTiles.html).

## See also

[`leaflet::leaflet()`](https://rstudio.github.io/leaflet/reference/leaflet.html),
[`leaflet::addTiles()`](https://rstudio.github.io/leaflet/reference/map-layers.html)

[`leaflet::providerTileOptions()`](https://rstudio.github.io/leaflet/reference/addProviderTiles.html),
[`leaflet::tileOptions()`](https://rstudio.github.io/leaflet/reference/map-options.html)

Other imagery utilities:
[`esp_getTiles()`](https://ropenspain.github.io/mapSpain/reference/esp_getTiles.md),
[`esp_make_provider()`](https://ropenspain.github.io/mapSpain/reference/esp_make_provider.md),
[`esp_tiles_providers`](https://ropenspain.github.io/mapSpain/reference/esp_tiles_providers.md)

## Examples

``` r
library(leaflet)
leafmap <- leaflet(width = "100%", height = "60vh") |>
  setView(lat = 40.4166, lng = -3.7038400, zoom = 10) |>
  addTiles(group = "Default (OSM)") |>
  addProviderEspTiles(
    provider = "IDErioja.Claro",
    group = "IDErioja Claro"
  ) |>
  addProviderEspTiles(
    provider = "RedTransporte.Carreteras",
    group = "Carreteras"
  ) |>
  addLayersControl(
    baseGroups = c("IDErioja Claro", "Default (OSM)"),
    overlayGroups = "Carreteras",
    options = layersControlOptions(collapsed = FALSE)
  )

leafmap

{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"setView":[[40.4166,-3.70384],10,[]],"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,"Default (OSM)",{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org/copyright/\">OpenStreetMap<\/a>,  <a href=\"https://opendatacommons.org/licenses/odbl/\">ODbL<\/a>"}]},{"method":"addTiles","args":["https://rts.larioja.org/mapa-base/rioja_claro/{z}/{x}/{y}.png",null,"IDErioja Claro",{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"minzoom":0,"maxzoom":18,"tilesize":256,"errortileurl":"","nowrap":false,"zoomoffset":0,"zoomreverse":false,"zindex":1,"detectretina":false,"attribution":"CC BY 4.0 <a href='https://www.iderioja.org'>www.iderioja.org<\/a>"}]},{"method":"addWMSTiles","args":["https://servicios.idee.es/wms-inspire/transportes",null,"Carreteras",{"styles":"","format":"image/png","transparent":"true","version":"1.1.1","errortileurl":"","nowrap":false,"detectretina":false,"attribution":"Sistema Geogr&aacute;fico Nacional <a href='http://www.scne.es'>SCNE<\/a>","layers":"TN.RoadTransportNetwork.RoadLink"}]},{"method":"addLayersControl","args":[["IDErioja Claro","Default (OSM)"],"Carreteras",{"collapsed":false,"autoZIndex":true,"position":"topright"}]}]},"evals":[],"jsHooks":[]}
```
