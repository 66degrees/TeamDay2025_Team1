view: dbo_dim_date {
  sql_table_name: `dna-team-day-2025-20251003.team_day_2025_adventure_works_dw.dbo_DimDate` ;;

  dimension: calendar_quarter {
    type: number
    sql: ${TABLE}.CalendarQuarter ;;
  }
  dimension: calendar_semester {
    type: number
    sql: ${TABLE}.CalendarSemester ;;
  }
  dimension: calendar_year {
    type: number
    sql: ${TABLE}.CalendarYear ;;
  }
  dimension: date_key {
    type: number
    sql: ${TABLE}.DateKey ;;
  }
  dimension: day_number_of_month {
    type: number
    sql: ${TABLE}.DayNumberOfMonth ;;
  }
  dimension: day_number_of_week {
    type: number
    sql: ${TABLE}.DayNumberOfWeek ;;
  }
  dimension: day_number_of_year {
    type: number
    sql: ${TABLE}.DayNumberOfYear ;;
  }
  dimension: english_day_name_of_week {
    type: string
    sql: ${TABLE}.EnglishDayNameOfWeek ;;
  }
  dimension: english_month_name {
    type: string
    sql: ${TABLE}.EnglishMonthName ;;
  }
  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.FiscalQuarter ;;
  }
  dimension: fiscal_semester {
    type: number
    sql: ${TABLE}.FiscalSemester ;;
  }
  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.FiscalYear ;;
  }
  dimension: french_day_name_of_week {
    type: string
    sql: ${TABLE}.FrenchDayNameOfWeek ;;
  }
  dimension: french_month_name {
    type: string
    sql: ${TABLE}.FrenchMonthName ;;
  }
  dimension_group: full_date_alternate_key {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FullDateAlternateKey ;;
  }
  dimension: month_number_of_year {
    type: number
    sql: ${TABLE}.MonthNumberOfYear ;;
  }
  dimension: spanish_day_name_of_week {
    type: string
    sql: ${TABLE}.SpanishDayNameOfWeek ;;
  }
  dimension: spanish_month_name {
    type: string
    sql: ${TABLE}.SpanishMonthName ;;
  }
  dimension: week_number_of_year {
    type: number
    sql: ${TABLE}.WeekNumberOfYear ;;
  }
  measure: count {
    type: count
    drill_fields: [spanish_month_name, french_month_name, english_month_name]
  }
}
