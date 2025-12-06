# (Superseded) Database of public WMS and WMTS of Spain

**\[superseded\]**

This `data.frame` is not longer in use by
[mapSpain](https://CRAN.R-project.org/package=mapSpain). See
[esp_tiles_providers](https://ropenspain.github.io/mapSpain/reference/esp_tiles_providers.md)
instead.

A `data.frame` containing information of different public WMS and WMTS
providers of Spain

## Format

A `data.frame` object with a list of the required parameters for calling
the service:

- provider:

  Provider name

- field:

  Description of `value`

- value:

  INE code of each province

## Source

<https://dieghernan.github.io/leaflet-providersESP/> leaflet plugin,
**v1.3.3**.

## Examples

``` r
data("leaflet.providersESP.df")
```
