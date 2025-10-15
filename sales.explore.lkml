include: "/views/*"
explore: sales {
  from: dbo_fact_internet_sales
  join: dbo_dim_customer {
    sql_on: ${sales.customer_key} = ${dbo_dim_customer.customer_key} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: dbo_dim_geography {
    sql_on: ${dbo_dim_customer.geography_key} = ${dbo_dim_geography.geography_key} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: dbo_dim_product {
    sql_on: ${sales.product_key} = ${dbo_dim_product.product_key} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: dbo_dim_date {
    sql_on: ${sales.order_date_key} = ${dbo_dim_date.date_key} ;;
    type: left_outer
    relationship: many_to_one
  }
}
