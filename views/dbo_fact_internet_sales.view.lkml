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

      # Amount measures
      measure: discount_amount {
        type: sum
        sql: ${TABLE}.DiscountAmount ;;
        value_format_name: "usd"
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

      measure: extended_amount {
        type: sum
        sql: ${TABLE}.ExtendedAmount ;;
        value_format_name: "usd"
      }

      measure: freight {
        type: sum
        sql: ${TABLE}.Freight ;;
        value_format_name: "usd"
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

      measure: product_standard_cost {
        type: sum
        sql: ${TABLE}.ProductStandardCost ;;
        value_format_name: "usd"
      }

      dimension: promotion_key {
        type: number
        sql: ${TABLE}.PromotionKey ;;
      }
      dimension: revision_number {
        type: number
        sql: ${TABLE}.RevisionNumber ;;
      }

      measure: sales_amount {
        type: sum
        sql: ${TABLE}.SalesAmount ;;
        value_format_name: "usd"
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

      measure: tax_amt {
        type: sum
        sql: ${TABLE}.TaxAmt ;;
        value_format_name: "usd"
      }

      measure: total_product_cost {
        type: sum
        sql: ${TABLE}.TotalProductCost ;;
        value_format_name: "usd"
      }

      measure: unit_price {
        type: sum
        sql: ${TABLE}.UnitPrice ;;
        value_format_name: "usd"
      }

      dimension: unit_price_discount_pct {
        type: number
        sql: ${TABLE}.UnitPriceDiscountPct ;;
        value_format_name: "percent_2"
      }

      measure: count {
        type: count
      }
    }
