# Database with the population of Spain by municipality (2019)

Database with the population of Spain by municipality (2019)

## Format

An example `data.frame` object with 8,131 rows containing the population
data by municipality in Spain (2019).

- cpro:

  INE code of the province.

- provincia:

  name of the province.

- cmun:

  INE code of the municipality.

- name:

  Name of the municipality.

- pob19:

  Overall population (2019)

- men:

  Men population (2019)

- women:

  Women population (2019)

## Source

INE: Instituto Nacional de Estadistica <https://www.ine.es/>

## See also

Other datasets:
[`esp_codelist`](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md),
[`esp_munic.sf`](https://ropenspain.github.io/mapSpain/reference/esp_munic.sf.md),
[`esp_nuts.sf`](https://ropenspain.github.io/mapSpain/reference/esp_nuts.sf.md),
[`esp_tiles_providers`](https://ropenspain.github.io/mapSpain/reference/esp_tiles_providers.md)

## Examples

``` r
data("pobmun19")
```
