### Star Schema Design: Adventure Works Sales

This model is designed around a central fact table, `fct_sales`, which contains the quantitative metrics of each sales order line item. This fact table is linked to several dimension tables that provide the business context (the "who, what, where, and when") for each sale.

#### Schema Diagram (Conceptual)

```
+---------------------+      +-------------------------+
|    dim_date         |      |      dim_product        |
|---------------------|      |-------------------------|
| - date_key (PK)     |      | - product_key (PK)      |
| - date              |      | - product_id            |
| - year              |      | - product_name          |
| - quarter           |      | - product_number        |
| - month             |      | - color                 |
| - day_of_week       |      | - standard_cost         |
| ...                 |      | - list_price            |
+---------------------+      | - size                  |
        |                    | - weight                |
        |                    | - product_category_name |
        |                    | - product_subcategory_name|
        |                    +-------------------------+
        |                                |
        |                                |
+-------------------------------------------------------------+
|                           fct_sales                           |
|-------------------------------------------------------------|
| - product_key (FK)                                          |
| - customer_key (FK)                                         |
| - territory_key (FK)                                        |
| - order_date_key (FK)                                       |
| - sales_order_id (Degenerate Dimension)                     |
| - sales_order_detail_id (Degenerate Dimension)              |
| - order_qty (Measure)                                       |
| - unit_price (Measure)                                      |
| - unit_price_discount (Measure)                             |
| - line_total (Measure)                                      |
| - freight (Measure)                                         |
| - tax_amt (Measure)                                         |
+-------------------------------------------------------------+
        |                                |
        |                                |
        |                    +-------------------------+
+---------------------+      |     dim_customer        |
|   dim_territory     |      |-------------------------|
|---------------------|      | - customer_key (PK)     |
| - territory_key (PK)|      | - customer_id           |
| - territory_name    |      | - person_type           |
| - country_region    |      | - full_name             |
| - "group"           |      | - email_address         |
+---------------------+      +-------------------------+

```

**Key Concepts:**

*   **Fact Table (`fct_sales`):** The core of the model. Each row represents a single line item from a sales order (`SalesOrderDetail`). It contains foreign keys to the dimensions and the numeric measures.
*   **Dimension Tables (`dim_`):** These tables store the descriptive attributes of the business entities. They are denormalized to be wide and easy to query, avoiding complex joins. For example, `dim_product` includes product category and subcategory information directly in the table.
*   **Surrogate Keys (`_key`):** Each dimension has a simple integer primary key (`product_key`, `customer_key`, etc.). These are used to join to the fact table. They are independent of the original OLTP database's primary keys, which protects the data warehouse from changes in the source system.
*   **Degenerate Dimensions:** Fields like `sales_order_id` are kept in the fact table for operational reference (i.e., to easily find the original order) but do not warrant their own dimension table.

---
