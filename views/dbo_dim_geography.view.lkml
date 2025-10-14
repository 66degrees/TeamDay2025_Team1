view: dbo_dim_geography {
  sql_table_name: `dna-team-day-2025-20251003.team_day_2025_adventure_works_dw.dbo_DimGeography` ;;

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: country_region_code {
    type: string
    sql: ${TABLE}.CountryRegionCode ;;
  }
  dimension: english_country_region_name {
    type: string
    sql: ${TABLE}.EnglishCountryRegionName ;;
  }
  dimension: french_country_region_name {
    type: string
    sql: ${TABLE}.FrenchCountryRegionName ;;
  }
  dimension: geography_key {
    type: number
    sql: ${TABLE}.GeographyKey ;;
  }
  dimension: ip_address_locator {
    type: string
    sql: ${TABLE}.IpAddressLocator ;;
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }
  dimension: sales_territory_key {
    type: number
    sql: ${TABLE}.SalesTerritoryKey ;;
  }
  dimension: spanish_country_region_name {
    type: string
    sql: ${TABLE}.SpanishCountryRegionName ;;
  }
  dimension: state_province_code {
    type: string
    sql: ${TABLE}.StateProvinceCode ;;
  }
  dimension: state_province_name {
    type: string
    sql: ${TABLE}.StateProvinceName ;;
  }
  measure: count {
    type: count
    drill_fields: [english_country_region_name, french_country_region_name, state_province_name, spanish_country_region_name]
  }
}
