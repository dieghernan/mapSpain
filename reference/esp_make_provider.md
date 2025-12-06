# Create a custom tile provider

Helper function for
[`esp_getTiles()`](https://ropenspain.github.io/mapSpain/reference/esp_getTiles.md)
that helps to create a custom provider.

## Usage

``` r
esp_make_provider(id, q, service, layers, ...)
```

## Arguments

- id:

  An identifier for the user. Would be used also for identifying cached
  tiles.

- q:

  The base url of the service.

- service:

  The type of tile service, either `"WMS"` or `"WMTS"`.

- layers:

  The name of the layer to retrieve.

- ...:

  Additional parameters to the query, like `version`, `format`,
  `crs/srs`, `style`, ... depending on the capabilities of the service.

## Value

A named list with two elements `id` and `q`.

## Details

This function is meant to work with services provided as of the [OGC
Standard](http://opengeospatial.github.io/e-learning/wms/text/operations.html#getmap).

Note that:

- [mapSpain](https://CRAN.R-project.org/package=mapSpain) would not
  provide advice on the parameter `q` to be provided.

- Currently, on **WMTS** requests only services with
  `tilematrixset=GoogleMapsCompatible` are supported.

## See also

[`esp_getTiles()`](https://ropenspain.github.io/mapSpain/reference/esp_getTiles.md).

For a list of potential providers from Spain check [IDEE
Directory](https://www.idee.es/segun-tipo-de-servicio).

Other imagery utilities:
[`addProviderEspTiles()`](https://ropenspain.github.io/mapSpain/reference/addProviderEspTiles.md),
[`esp_getTiles()`](https://ropenspain.github.io/mapSpain/reference/esp_getTiles.md),
[`esp_tiles_providers`](https://ropenspain.github.io/mapSpain/reference/esp_tiles_providers.md)

## Examples

``` r
# \dontrun{
# This script downloads tiles to your local machine
# Run only if you are online

custom_wms <- esp_make_provider(
  id = "an_id_for_caching",
  q = "https://idecyl.jcyl.es/geoserver/ge/wms?",
  service = "WMS",
  version = "1.3.0",
  layers = "geolog_cyl_litologia"
)

x <- esp_get_ccaa("Castilla y León", epsg = 3857)

mytile <- esp_getTiles(x, type = custom_wms)

tidyterra::autoplot(mytile) +
  ggplot2::geom_sf(data = x, fill = NA)

# }
```
