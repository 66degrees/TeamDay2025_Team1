-- =============================================
-- Dimension Table: dim_date
-- =============================================
-- Purpose: A standard date dimension table is crucial for any time-based analysis.
-- It is pre-populated with all dates for a given range, allowing for easy filtering
-- and grouping by year, quarter, month, etc.

CREATE OR REPLACE TABLE team_day_2025_adventure_works_dw.dim_date (
    date_key INT64 NOT NULL OPTIONS(description="Surrogate key for the date."),
    date DATE NOT NULL OPTIONS(description="The specific date."),
    year INT64 NOT NULL OPTIONS(description="The four-digit year."),
    quarter INT64 NOT NULL OPTIONS(description="The quarter of the year (1-4)."),
    month INT64 NOT NULL OPTIONS(description="The month number (1-12)."),
    month_name STRING NOT NULL OPTIONS(description="The full name of the month."),
    day_of_month INT64 NOT NULL OPTIONS(description="The day of the month (1-31)."),
    day_of_week INT64 NOT NULL OPTIONS(description="The day of the week (e.g., 1 for Sunday, 2 for Monday)."),
    week_of_year INT64 NOT NULL OPTIONS(description="The week number of the year."),
    is_weekday BOOL NOT NULL OPTIONS(description="True if the day is a weekday, False if it is a weekend.")
)
OPTIONS(
    description="A comprehensive date dimension table for time-series analysis."
);


-- =============================================
-- Dimension Table: dim_customer
-- =============================================
-- Purpose: Stores descriptive information about customers. It combines data from
-- the Customer and Person tables in the source system.

CREATE OR REPLACE TABLE team_day_2025_adventure_works_dw.dim_customer (
    customer_key INT64 NOT NULL OPTIONS(description="Surrogate key for the customer."),
    customer_id INT64 NOT NULL OPTIONS(description="Original customer ID from the OLTP system."),
    person_type STRING OPTIONS(description="Type of person (e.g., SC for Store Contact, IN for Individual Customer)."),
    title STRING OPTIONS(description="Title such as Mr., Ms., etc."),
    first_name STRING OPTIONS(description="Customer's first name."),
    middle_name STRING OPTIONS(description="Customer's middle name."),
    last_name STRING OPTIONS(description="Customer's last name."),
    full_name STRING OPTIONS(description="Concatenated full name of the customer."),
    email_address STRING OPTIONS(description="Customer's primary email address.")
)
OPTIONS(
    description="Dimension table containing customer attributes."
);


-- =============================================
-- Dimension Table: dim_territory
-- =============================================
-- Purpose: Stores information about the sales territories where sales occur.

CREATE OR REPLACE TABLE team_day_2025_adventure_works_dw.dim_territory (
    territory_key INT64 NOT NULL OPTIONS(description="Surrogate key for the sales territory."),
    territory_id INT64 NOT NULL OPTIONS(description="Original territory ID from the OLTP system."),
    territory_name STRING NOT NULL OPTIONS(description="The name of the sales territory."),
    country_region_code STRING NOT NULL OPTIONS(description="The country/region code (e.g., US, GB)."),
    "group" STRING NOT NULL OPTIONS(description="The sales group the territory belongs to (e.g., North America, Europe).")
)
OPTIONS(
    description="Dimension table for sales territories."
);


-- =============================================
-- Dimension Table: dim_product
-- =============================================
-- Purpose: Stores all attributes related to products. This table denormalizes
-- Product, ProductCategory, and ProductSubcategory for ease of use.

CREATE OR REPLACE TABLE team_day_2025_adventure_works_dw.dim_product (
    product_key INT64 NOT NULL OPTIONS(description="Surrogate key for the product."),
    product_id INT64 NOT NULL OPTIONS(description="Original product ID from the OLTP system."),
    product_name STRING NOT NULL OPTIONS(description="Name of the product."),
    product_number STRING NOT NULL OPTIONS(description="Unique product identification number."),
    color STRING OPTIONS(description="Product color."),
    standard_cost NUMERIC OPTIONS(description="Standard cost of the product."),
    list_price NUMERIC OPTIONS(description="Selling list price."),
    size STRING OPTIONS(description="Product size."),
    weight NUMERIC OPTIONS(description="Product weight."),
    product_category_name STRING OPTIONS(description="Name of the product category (denormalized)."),
    product_subcategory_name STRING OPTIONS(description="Name of the product subcategory (denormalized)."),
    sell_start_date TIMESTAMP OPTIONS(description="Date the product was available for sale."),
    sell_end_date TIMESTAMP OPTIONS(description="Date the product was discontinued.")
)
OPTIONS(
    description="Dimension table containing denormalized product attributes."
);


-- =============================================
-- Fact Table: fct_sales
-- =============================================
-- Purpose: The central fact table containing sales transaction data at the
-- level of an individual order line item.
-- Optimization: Partitioned by order_date for efficient time-based queries and
-- clustered by key dimensions to co-locate related data.

CREATE OR REPLACE TABLE team_day_2025_adventure_works_dw.fct_sales (
    -- Foreign Keys to Dimensions
    order_date_key INT64 NOT NULL OPTIONS(description="Foreign key to the dim_date table."),
    product_key INT64 NOT NULL OPTIONS(description="Foreign key to the dim_product table."),
    customer_key INT64 NOT NULL OPTIONS(description="Foreign key to the dim_customer table."),
    territory_key INT64 NOT NULL OPTIONS(description="Foreign key to the dim_territory table."),

    -- Degenerate Dimensions
    sales_order_id INT64 NOT NULL OPTIONS(description="Original sales order ID for reference."),
    sales_order_detail_id INT64 NOT NULL OPTIONS(description="Original sales order detail ID for uniqueness."),

    -- Measures
    order_qty INT64 NOT NULL OPTIONS(description="Quantity of the product ordered."),
    unit_price NUMERIC NOT NULL OPTIONS(description="Price per unit of the product."),
    unit_price_discount NUMERIC NOT NULL OPTIONS(description="Discount applied per unit."),
    line_total NUMERIC NOT NULL OPTIONS(description="Total amount for the line item (OrderQty * UnitPrice)."),
    freight NUMERIC NOT NULL OPTIONS(description="Freight cost for the order."),
    tax_amt NUMERIC NOT NULL OPTIONS(description="Tax amount for the order.")
)
PARTITION BY
    DATE_TRUNC(order_date, MONTH)
CLUSTER BY
    product_key, customer_key, territory_key
OPTIONS(
    description="Fact table for sales order line items, partitioned by month and clustered by key dimensions."
);
