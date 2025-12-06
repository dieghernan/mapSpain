# Database with codes and names of spanish regions

A `data.frame` object used internally for translating codes and names of
the different subdivisions of Spain. The `data.frame` provides the
hierarchy of the subdivisions including NUTS1 level, autonomous
communities (equivalent to NUTS2), provinces and NUTS3 level. See
**Note**.

## Format

A [`data.frame`](https://rdrr.io/r/base/data.frame.html) with 59 rows
codes and columns:

- nuts1.code:

  NUTS 1 code

- nuts1.name:

  NUTS 1 name

- nuts1.name.alt:

  NUTS 1 alternative name

- nuts1.shortname.es:

  NUTS1 1 short (common) name (Spanish)

- codauto:

  INE code of the autonomous community

- iso2.ccaa.code:

  ISO2 code of the autonomous community

- nuts2.code:

  NUTS 2 Code

- ine.ccaa.name:

  INE name of the autonomous community

- iso2.ccaa.name.es:

  ISO2 name of the autonomous community (Spanish)

- iso2.ccaa.name.ca:

  ISO2 name of the autonomous community (Catalan)

- iso2.ccaa.name.gl:

  ISO2 name of the autonomous community (Galician)

- iso2.ccaa.name.eu:

  ISO2 name of the autonomous community (Basque)

- nuts2.name:

  NUTS 2 name

- cldr.ccaa.name.en:

  CLDR name of the autonomous community (English)

- cldr.ccaa.name.es:

  CLDR name of the autonomous community (Spanish)

- cldr.ccaa.name.ca:

  CLDR name of the autonomous community (Catalan)

- cldr.ccaa.name.ga:

  CLDR name of the autonomous community (Galician)

- cldr.ccaa.name.eu:

  CLDR name of the autonomous community (Basque)

- ccaa.shortname.en:

  Short (common) name of the autonomous community (English)

- ccaa.shortname.es:

  Short (common) name of the autonomous community (Spanish)

- ccaa.shortname.ca:

  Short (common) name of the autonomous community (Catalan)

- ccaa.shortname.ga:

  Short (common) name of the autonomous community (Galician)

- ccaa.shortname.eu:

  Short (common) name of the autonomous community (Basque)

- cpro:

  INE code of the province

- iso2.prov.code:

  ISO2 code of the province

- nuts.prov.code:

  NUTS code of the province

- ine.prov.name:

  INE name of the province

- iso2.prov.name.es:

  ISO2 name of the province (Spanish)

- iso2.prov.name.ca:

  ISO2 name of the province (Catalan)

- iso2.prov.name.ga:

  ISO2 name of the province (Galician)

- iso2.prov.name.eu:

  ISO2 name of the province (Basque)

- cldr.prov.name.en:

  CLDR name of the province (English)

- cldr.prov.name.es:

  CLDR name of the province (Spanish)

- cldr.prov.name.ca:

  CLDR name of the province (Catalan)

- cldr.prov.name.ga:

  CLDR name of the province (Galician)

- cldr.prov.name.eu:

  CLDR name of the province (Basque)

- prov.shortname.en:

  Short (common) name of the province (English)

- prov.shortname.es:

  Short (common) name of the province (Spanish)

- prov.shortname.ca:

  Short (common) name of the province (Catalan)

- prov.shortname.ga:

  Short (common) name of the province (Galician)

- prov.shortname.eu:

  Short (common) name of the province (Basque)

- nuts3.code:

  NUTS 3 code

- nuts3.name:

  NUTS 3 name

- nuts3.shortname.es:

  NUTS 3 short (common) name

## Source

- **INE**: Instituto Nacional de Estadistica: <https://www.ine.es/>

- **Eurostat (NUTS)**: <https://ec.europa.eu/eurostat/web/nuts/overview>

- **ISO**: <https://www.iso.org/home.html>

- **CLDR**:
  <https://unicode-org.github.io/cldr-staging/charts/38/index.html>

## Note

Although NUTS2 matches the first subdivision level of Spain (CCAA -
Autonomous Communities), it should be noted that NUTS3 does not match
the second subdivision level of Spain (Provinces). NUTS3 provides a
dedicated code for major islands whereas the provinces doesn't.

Ceuta and Melilla has an specific status (Autonomous Cities) but are
considered as autonomous communities with a single province (as Madrid,
Asturias or Murcia) on this database.

## See also

Other datasets:
[`esp_munic.sf`](https://ropenspain.github.io/mapSpain/reference/esp_munic.sf.md),
[`esp_nuts.sf`](https://ropenspain.github.io/mapSpain/reference/esp_nuts.sf.md),
[`esp_tiles_providers`](https://ropenspain.github.io/mapSpain/reference/esp_tiles_providers.md),
[`pobmun19`](https://ropenspain.github.io/mapSpain/reference/pobmun19.md)

Other political:
[`esp_get_can_box()`](https://ropenspain.github.io/mapSpain/reference/esp_get_can_box.md),
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/reference/esp_get_capimun.md),
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/reference/esp_get_ccaa.md),
[`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/reference/esp_get_comarca.md),
[`esp_get_country()`](https://ropenspain.github.io/mapSpain/reference/esp_get_country.md),
[`esp_get_gridmap`](https://ropenspain.github.io/mapSpain/reference/esp_get_gridmap.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/reference/esp_get_munic.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_prov.md),
[`esp_get_simpl_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_simplified.md)

Other dictionary:
[`esp_dict_region_code()`](https://ropenspain.github.io/mapSpain/reference/esp_dict.md)

## Examples

``` r
data("esp_codelist")
```
