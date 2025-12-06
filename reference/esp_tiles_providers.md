# Database of public WMS and WMTS of Spain

A named [`list`](https://rdrr.io/r/base/list.html) of length 102
containing the parameters of the url information of different public WMS
and WMTSproviders of Spain.

Implementation of javascript plugin
[leaflet-providersESP](https://dieghernan.github.io/leaflet-providersESP/)
**v1.3.3**.

## Format

A named `list` of the providers available with the following structure:

- Each item of the list is named with the provider alias.

- Each element of the list contains two nested named lists:

  - `static` with the parameters to get static tiles plus an additional
    item named `attribution`.

  - `leaflet` with additional parameters to be passed onto
    [`addProviderEspTiles()`](https://ropenspain.github.io/mapSpain/reference/addProviderEspTiles.md).

## Source

<https://dieghernan.github.io/leaflet-providersESP/> leaflet plugin,
**v1.3.3**.

## Details

Providers available to be passed to `type` on
[`esp_getTiles()`](https://ropenspain.github.io/mapSpain/reference/esp_getTiles.md)
are:

- `"IDErioja"`

- `"IDErioja.Base"`

- `"IDErioja.Relieve"`

- `"IDErioja.Claro"`

- `"IDErioja.Oscuro"`

- `"IGNBase"`

- `"IGNBase.Todo"`

- `"IGNBase.Gris"`

- `"IGNBase.TodoNoFondo"`

- `"IGNBase.Orto"`

- `"MDT"`

- `"MDT.Elevaciones"`

- `"MDT.Relieve"`

- `"MDT.CurvasNivel"`

- `"MDT.SpotElevation"`

- `"PNOA"`

- `"PNOA.MaximaActualidad"`

- `"PNOA.Mosaico"`

- `"OcupacionSuelo"`

- `"OcupacionSuelo.Ocupacion"`

- `"OcupacionSuelo.Usos"`

- `"LiDAR"`

- `"MTN"`

- `"Geofisica"`

- `"Geofisica.Terremotos10dias"`

- `"Geofisica.Terremotos30dias"`

- `"Geofisica.Terremotos365dias"`

- `"Geofisica.ObservedEvents"`

- `"Geofisica.HazardArea"`

- `"VigilanciaVolcanica"`

- `"VigilanciaVolcanica.ErupcionesHistoricas"`

- `"CaminoDeSantiago"`

- `"CaminoDeSantiago.CaminoFrances"`

- `"CaminoDeSantiago.CaminosFrancia"`

- `"CaminoDeSantiago.CaminosGalicia"`

- `"CaminoDeSantiago.CaminosDelNorte"`

- `"CaminoDeSantiago.CaminosAndaluces"`

- `"CaminoDeSantiago.CaminosCentro"`

- `"CaminoDeSantiago.CaminosEste"`

- `"CaminoDeSantiago.CaminosCatalanes"`

- `"CaminoDeSantiago.CaminosSureste"`

- `"CaminoDeSantiago.CaminosInsulares"`

- `"CaminoDeSantiago.CaminosPortugueses"`

- `"Catastro"`

- `"Catastro.Catastro"`

- `"Catastro.Parcela"`

- `"Catastro.CadastralParcel"`

- `"Catastro.CadastralZoning"`

- `"Catastro.Address"`

- `"Catastro.Building"`

- `"Catastro.BuildingPart"`

- `"Catastro.AdministrativeBoundary"`

- `"Catastro.AdministrativeUnit"`

- `"RedTransporte"`

- `"RedTransporte.Carreteras"`

- `"RedTransporte.Ferroviario"`

- `"RedTransporte.Aerodromo"`

- `"RedTransporte.AreaServicio"`

- `"RedTransporte.EstacionesFerroviario"`

- `"RedTransporte.Puertos"`

- `"Cartociudad"`

- `"Cartociudad.CodigosPostales"`

- `"Cartociudad.Direcciones"`

- `"NombresGeograficos"`

- `"UnidadesAdm"`

- `"UnidadesAdm.Limites"`

- `"UnidadesAdm.Unidades"`

- `"Hidrografia"`

- `"Hidrografia.MasaAgua"`

- `"Hidrografia.Cuencas"`

- `"Hidrografia.Subcuencas"`

- `"Hidrografia.POI"`

- `"Hidrografia.ManMade"`

- `"Hidrografia.LineaCosta"`

- `"Hidrografia.Rios"`

- `"Hidrografia.Humedales"`

- `"Militar"`

- `"Militar.CEGET1M"`

- `"Militar.CEGETM7814"`

- `"Militar.CEGETM7815"`

- `"Militar.CEGETM682"`

- `"Militar.CECAF1M"`

- `"ADIF"`

- `"ADIF.Vias"`

- `"ADIF.Nodos"`

- `"ADIF.Estaciones"`

- `"LimitesMaritimos"`

- `"LimitesMaritimos.LimitesMaritimos"`

- `"LimitesMaritimos.LineasBase"`

- `"Copernicus"`

- `"Copernicus.Forest"`

- `"Copernicus.ForestLeaf"`

- `"Copernicus.WaterWet"`

- `"Copernicus.SoilSeal"`

- `"Copernicus.GrassLand"`

- `"Copernicus.RiparianGreen"`

- `"Copernicus.RiparianLandCover"`

- `"Copernicus.Natura2k"`

- `"Copernicus.UrbanAtlas"`

- `"ParquesNaturales"`

- `"ParquesNaturales.Limites"`

- `"ParquesNaturales.ZonasPerifericas"`

## See also

Other datasets:
[`esp_codelist`](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md),
[`esp_munic.sf`](https://ropenspain.github.io/mapSpain/reference/esp_munic.sf.md),
[`esp_nuts.sf`](https://ropenspain.github.io/mapSpain/reference/esp_nuts.sf.md),
[`pobmun19`](https://ropenspain.github.io/mapSpain/reference/pobmun19.md)

Other imagery utilities:
[`addProviderEspTiles()`](https://ropenspain.github.io/mapSpain/reference/addProviderEspTiles.md),
[`esp_getTiles()`](https://ropenspain.github.io/mapSpain/reference/esp_getTiles.md),
[`esp_make_provider()`](https://ropenspain.github.io/mapSpain/reference/esp_make_provider.md)

## Examples

``` r
data("esp_tiles_providers")
# Get a single provider

single <- esp_tiles_providers[["IGNBase.Todo"]]
single$static
#> $attribution
#> [1] "CC BY 4.0 scne.es. Sistema Geográfico Nacional IGN"
#> 
#> $q
#> [1] "https://www.ign.es/wmts/ign-base?"
#> 
#> $service
#> [1] "WMTS"
#> 
#> $request
#> [1] "GetTile"
#> 
#> $version
#> [1] "1.0.0"
#> 
#> $format
#> [1] "image/png"
#> 
#> $layer
#> [1] "IGNBaseTodo"
#> 
#> $style
#> [1] "default"
#> 
#> $tilematrixset
#> [1] "GoogleMapsCompatible"
#> 
#> $tilematrix
#> [1] "{z}"
#> 
#> $tilerow
#> [1] "{y}"
#> 
#> $tilecol
#> [1] "{x}"
#> 

single$leaflet
#> $attribution
#> [1] "CC BY 4.0 scne.es. Sistema Geogr&aacute;fico Nacional <a href='http://www.ign.es'>IGN</a>"
#> 
```
