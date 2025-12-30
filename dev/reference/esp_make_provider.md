# Create a custom tile provider

Helper function for
[`esp_get_tiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md)
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

  Additional arguments to the query, like `version`, `format`,
  `crs/srs`, `style`, etc. depending on the capabilities of the service.

## Value

A named list with two elements `id` and `q`.

## Details

This function is meant to work with services provided as of the [OGC
Standard](https://www.ogc.org/standards/wms/).

Note that:

- [mapSpain](https://CRAN.R-project.org/package=mapSpain) would not
  provide advice on the argument `q` to be provided.

- Currently, on **WMTS** requests only services with
  `tilematrixset=GoogleMapsCompatible` are supported.

## See also

[`esp_get_tiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md).

For a list of potential providers from Spain check [IDEE
Directory](https://www.idee.es/segun-tipo-de-servicio).

Other functions for creating maps with images:
[`addProviderEspTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/addProviderEspTiles.md),
[`esp_get_tiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md)

## Examples

``` r
# \dontrun{
custom_wms <- esp_make_provider(
  id = "an_id_for_caching",
  q = "https://idecyl.jcyl.es/geoserver/ge/wms?",
  service = "WMS",
  version = "1.3.0",
  layers = "geolog_cyl_litologia"
)

x <- esp_get_ccaa("Castilla y León", epsg = 3857)

mytile <- esp_get_tiles(x, type = custom_wms)

tidyterra::autoplot(mytile) +
  ggplot2::geom_sf(data = x, fill = NA)

# }
```
