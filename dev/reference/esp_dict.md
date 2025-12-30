# Convert and translate Spanish subdivision names and codes

Convert Spanish subdivision names or identifiers between different
coding schemes (NUTS, ISO2, province codes, etc.) or obtain
human-readable names.

## Usage

``` r
esp_dict_region_code(sourcevar, origin = "text", destination = "text")

esp_dict_translate(sourcevar, lang = "en", all = FALSE)
```

## Arguments

- sourcevar:

  character string. Vector which contains the codes or names to be
  converted.

- origin, destination:

  character string. Coding scheme of origin and destination. One of
  `"text"`, `"nuts"`, `"iso2"`, `"codauto"`, or `"cpro"`.

- lang:

  character string. Target language code, available values:

  - `"es"`: Spanish.

  - `"en"`: English.

  - `"ca"`: Catalan.

  - `"ga"`: Galician.

  - `"eu"`: Basque.

- all:

  logical. If `TRUE` the function returns all possible translations for
  each input as a named list. When `FALSE` (default) a single preferred
  translation per input is returned as a character vector.

## Value

`esp_dict_region_code()` returns a character vector with converted
subdivision identifiers or names. If a value cannot be matched the
corresponding element will be `NA` and a warning is emitted via
[`cli::cli_alert_warning()`](https://cli.r-lib.org/reference/cli_alert.html).

`esp_dict_translate()` translates a vector of names from one language to
another :

- If `all = FALSE`, a character vector with the translated name for each
  element of `sourcevar`.

- If `all = TRUE`, a named `list` is returned where each element
  contains all available translations for the corresponding input value.

## Details

The function uses internal dictionaries together with
[countrycode](https://CRAN.R-project.org/package=countrycode) to map
between schemes. When `origin == destination == "text"` the input is
returned unchanged. Mixing names from different administrative levels
(for example autonomous community and province) may produce `NA` values
for some entries.

## Examples

``` r
vals <- c("Errioxa", "Coruna", "Gerona", "Madrid")

esp_dict_region_code(vals)
#> ℹ No conversion. `origin` equal to `destination` ("text")
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

esp_dict_region_code(valsmix, destination = "codauto")
#> ! No match on `destination = "codauto"` found for "Centro", "Seville", and "Menorca".
#> [1] NA   "01" NA   NA  
esp_dict_region_code(valsmix, destination = "iso2")
#> ! No match on `destination = "iso2"` found for "Centro" and "Menorca".
#> [1] NA      "ES-AN" "ES-SE" NA     

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
#> [4] "Provincia de Madrid"  "Comunidade de Madrid" "provincia de madrid" 
#> [7] "comunidade de madrid" "PROVINCIA DE MADRID"  "COMUNIDADE DE MADRID"
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
