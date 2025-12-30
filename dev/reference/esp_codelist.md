# Database with codes and names of Spanish regions

A [tibble](https://tibble.tidyverse.org/reference/tbl_df-class.html)
object used internally for translating codes and names of the different
subdivisions of Spain. This tibble provides a hierarchical
representation of Spain's subdivisions, including NUTS1 level,
autonomous communities (equivalent to NUTS2), provinces, and NUTS3
level. See **Note**.

## Format

A [tibble](https://tibble.tidyverse.org/reference/tbl_df-class.html)
with 59 rows and columns:

- nuts1.code:

  NUTS 1 code

- nuts1.name:

  NUTS 1 name

- nuts1.name.alt:

  NUTS 1 alternative name

- nuts1.shortname.es:

  NUTS 1 short (common) name (Spanish)

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

- **ISO**: <https://www.iso.org/obp/ui/#iso:code:3166:ES>

- **CLDR**:
  <https://www.unicode.org/cldr/charts/48/subdivisionNames/index.html>

## Note

Although NUTS2 aligns with the first subdivision level of Spain (CCAA -
Autonomous Communities), it is important to note that NUTS3 does not
correspond to the second subdivision level of Spain (Provinces). NUTS3
provides dedicated codes for major islands, whereas provinces do not.

Ceuta and Melilla have a special status as Autonomous Cities but are
treated as autonomous communities with a single province (like Madrid,
Asturias, or Murcia) in this database.

## See also

Other datasets:
[`esp_nuts_2024`](https://ropenspain.github.io/mapSpain/dev/reference/esp_nuts_2024.md),
[`esp_tiles_providers`](https://ropenspain.github.io/mapSpain/dev/reference/esp_tiles_providers.md),
[`pobmun25`](https://ropenspain.github.io/mapSpain/dev/reference/pobmun25.md)

## Examples

``` r
data("esp_codelist")
esp_codelist
#> # A tibble: 59 × 44
#>    nuts1.code nuts1.name nuts1.name.alt nuts1.shortname.es codauto
#>    <chr>      <chr>      <chr>          <chr>              <chr>  
#>  1 ES1        Noroeste   Noroeste       Noroeste           03     
#>  2 ES1        Noroeste   Noroeste       Noroeste           06     
#>  3 ES1        Noroeste   Noroeste       Noroeste           12     
#>  4 ES1        Noroeste   Noroeste       Noroeste           12     
#>  5 ES1        Noroeste   Noroeste       Noroeste           12     
#>  6 ES1        Noroeste   Noroeste       Noroeste           12     
#>  7 ES2        Noreste    Noreste        Noreste            02     
#>  8 ES2        Noreste    Noreste        Noreste            02     
#>  9 ES2        Noreste    Noreste        Noreste            02     
#> 10 ES2        Noreste    Noreste        Noreste            15     
#> # ℹ 49 more rows
#> # ℹ 39 more variables: iso2.ccaa.code <chr>, nuts2.code <chr>,
#> #   ine.ccaa.name <chr>, iso2.ccaa.name.es <chr>, iso2.ccaa.name.ca <chr>,
#> #   iso2.ccaa.name.gl <chr>, iso2.ccaa.name.eu <chr>, nuts2.name <chr>,
#> #   cldr.ccaa.name.en <chr>, cldr.ccaa.name.es <chr>, cldr.ccaa.name.ca <chr>,
#> #   cldr.ccaa.name.ga <chr>, cldr.ccaa.name.eu <chr>, ccaa.shortname.en <chr>,
#> #   ccaa.shortname.es <chr>, ccaa.shortname.ca <chr>, …
```
