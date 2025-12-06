# Convert and translate subdivision names

Converts long subdivision names into different coding schemes and
languages.

## Usage

``` r
esp_dict_region_code(sourcevar, origin = "text", destination = "text")

esp_dict_translate(sourcevar, lang = "en", all = FALSE)
```

## Arguments

- sourcevar:

  Vector which contains the subdivision names to be converted.

- origin, destination:

  One of `"text"`, `"nuts"`, `"iso2"`, `"codauto"` and `"cpro"`.

- lang:

  Language of translation. Available languages are:

  - `"es"`: Spanish

  - `"en"`: English

  - `"ca"`: Catalan

  - `"ga"`: Galician

  - `"eu"`: Basque

- all:

  Logical. Should the function return all names or not? On `FALSE` it
  returns a character vector. See **Value**.

## Value

`esp_dict_region_code()` returns a vector of characters.

`esp_dict_translate()` returns a `character` vector or a named `list`
with each of the possible names of each `sourcevar` on the required
language `lang`.

## Details

If no match is found for any value, the function displays a warning and
returns `NA` for those values.

Note that mixing names of different administrative levels (e.g.
"Catalonia" and "Barcelona") may return empty values, depending on the
`destination` values.

## See also

Other dictionary:
[`esp_codelist`](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md)

Other dictionary:
[`esp_codelist`](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md)

## Examples

``` r
vals <- c("Errioxa", "Coruna", "Gerona", "Madrid")

esp_dict_region_code(vals)
#> No conversion - origin equal to destination
#> [1] "Errioxa" "Coruna"  "Gerona"  "Madrid" 
esp_dict_region_code(vals, destination = "nuts")
#> [1] "ES23"  "ES111" "ES512" "ES30" 
esp_dict_region_code(vals, destination = "cpro")
#> [1] "26" "15" "17" "28"
esp_dict_region_code(vals, destination = "iso2")
#> [1] "ES-RI" "ES-C"  "ES-GI" "ES-MD"

# From ISO2 to another codes

iso2vals <- c("ES-M", "ES-S", "ES-SG")
esp_dict_region_code(iso2vals, origin = "iso2")
#> [1] "Madrid"    "Cantabria" "Segovia"  
esp_dict_region_code(iso2vals,
  origin = "iso2",
  destination = "nuts"
)
#> [1] "ES300" "ES130" "ES416"
esp_dict_region_code(iso2vals,
  origin = "iso2",
  destination = "cpro"
)
#> [1] "28" "39" "40"

# Mixing levels
valsmix <- c("Centro", "Andalucia", "Seville", "Menorca")
esp_dict_region_code(valsmix, destination = "nuts")
#> [1] "ES4"   "ES61"  "ES618" "ES533"
# \dontrun{

# Warning

esp_dict_region_code(valsmix, destination = "codauto")
#> Warning: No match on codauto found for Centro, Seville, Menorca
#> [1] NA   "01" NA   NA  
esp_dict_region_code(valsmix, destination = "iso2")
#> Warning: No match on iso2 found for Centro, Menorca
#> [1] NA      "ES-AN" "ES-SE" NA     
# }


vals <- c("La Rioja", "Sevilla", "Madrid", "Jaen", "Orense", "Baleares")

esp_dict_translate(vals)
#> [1] "La Rioja"         "Seville"          "Madrid"           "Jaén"            
#> [5] "Ourense"          "Balearic Islands"
esp_dict_translate(vals, lang = "es")
#> [1] "La Rioja" "Sevilla"  "Madrid"   "Jaén"     "Orense"   "Baleares"
esp_dict_translate(vals, lang = "ca")
#> [1] "La Rioja"      "Sevilla"       "Madrid"        "Jaén"         
#> [5] "Ourense"       "Illes Balears"
esp_dict_translate(vals, lang = "eu")
#> [1] "Errioxa"         "Sevilla"         "Madril"          "Jaén"           
#> [5] "Ourense"         "Balear Uharteak"
esp_dict_translate(vals, lang = "ga")
#> [1] "A Rioxa"        "Sevilla"        "Madrid"         "Xaén"          
#> [5] "Ourense"        "Illas Baleares"

esp_dict_translate(vals, lang = "ga", all = TRUE)
#> $`La Rioja`
#> [1] "A Rioxa" "a rioxa" "A RIOXA"
#> 
#> $Sevilla
#> [1] "Sevilla"              "sevilla"              "SEVILLA"             
#> [4] "Provincia de Sevilla" "provincia de sevilla" "PROVINCIA DE SEVILLA"
#> 
#> $Madrid
#> [1] "Madrid"               "madrid"               "MADRID"              
#> [4] "Comunidade de Madrid" "comunidade de madrid" "COMUNIDADE DE MADRID"
#> 
#> $Jaen
#>  [1] "Xaén"              "Xaen"              "xaén"             
#>  [4] "xaen"              "XAÉN"              "XAEN"             
#>  [7] "Provincia de Xaén" "Provincia de Xaen" "provincia de xaén"
#> [10] "provincia de xaen" "PROVINCIA DE XAÉN" "PROVINCIA DE XAEN"
#> 
#> $Orense
#> [1] "Ourense"              "ourense"              "OURENSE"             
#> [4] "Provincia de Ourense" "provincia de ourense" "PROVINCIA DE OURENSE"
#> 
#> $Baleares
#> [1] "Illas Baleares"                 "illas baleares"                
#> [3] "ILLAS BALEARES"                 "Illas Baleares - Illes Balears"
#> [5] "illas baleares - illes balears" "ILLAS BALEARES - ILLES BALEARS"
#> 
```
