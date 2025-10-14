view: dbo_fact_internet_sales {
  sql_table_name: `dna-team-day-2025-20251003.team_day_2025_adventure_works_dw.dbo_FactInternetSales` ;;

  dimension: carrier_tracking_number {
    type: string
    sql: ${TABLE}.CarrierTrackingNumber ;;
  }
  dimension: currency_key {
    type: number
    sql: ${TABLE}.CurrencyKey ;;
  }
  dimension: customer_key {
    type: number
    sql: ${TABLE}.CustomerKey ;;
  }
  dimension: customer_ponumber {
    type: string
    sql: ${TABLE}.CustomerPONumber ;;
  }
  dimension: discount_amount {
    type: number
    sql: ${TABLE}.DiscountAmount ;;
  }
  dimension_group: due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DueDate ;;
  }
  dimension: due_date_key {
    type: number
    sql: ${TABLE}.DueDateKey ;;
  }
  dimension: extended_amount {
    type: number
    sql: ${TABLE}.ExtendedAmount ;;
  }
  dimension: freight {
    type: number
    sql: ${TABLE}.Freight ;;
  }
  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.OrderDate ;;
  }
  dimension: order_date_key {
    type: number
    sql: ${TABLE}.OrderDateKey ;;
  }
  dimension: order_quantity {
    type: number
    sql: ${TABLE}.OrderQuantity ;;
  }
  dimension: product_key {
    type: number
    sql: ${TABLE}.ProductKey ;;
  }
  dimension: product_standard_cost {
    type: number
    sql: ${TABLE}.ProductStandardCost ;;
  }
  dimension: promotion_key {
    type: number
    sql: ${TABLE}.PromotionKey ;;
  }
  dimension: revision_number {
    type: number
    sql: ${TABLE}.RevisionNumber ;;
  }
  dimension: sales_amount {
    type: number
    sql: ${TABLE}.SalesAmount ;;
  }
  dimension: sales_order_line_number {
    type: number
    sql: ${TABLE}.SalesOrderLineNumber ;;
  }
  dimension: sales_order_number {
    type: string
    sql: ${TABLE}.SalesOrderNumber ;;
  }
  dimension: sales_territory_key {
    type: number
    sql: ${TABLE}.SalesTerritoryKey ;;
  }
  dimension_group: ship {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ShipDate ;;
  }
  dimension: ship_date_key {
    type: number
    sql: ${TABLE}.ShipDateKey ;;
  }
  dimension: tax_amt {
    type: number
    sql: ${TABLE}.TaxAmt ;;
  }
  dimension: total_product_cost {
    type: number
    sql: ${TABLE}.TotalProductCost ;;
  }
  dimension: unit_price {
    type: number
    sql: ${TABLE}.UnitPrice ;;
  }
  dimension: unit_price_discount_pct {
    type: number
    sql: ${TABLE}.UnitPriceDiscountPct ;;
  }
  measure: count {
    type: count
  }
}
