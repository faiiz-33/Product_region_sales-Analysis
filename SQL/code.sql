-- =========================
-- Revenue Contribution by Region
-- =========================
SELECT
    Region,
    ROUND(SUM(TotalPrice), 2) AS store_sales,
    ROUND(
        100 * SUM(TotalPrice) / SUM(SUM(TotalPrice)) OVER (),
        2
    ) AS contribution_pct
FROM products_proj
GROUP BY Region
ORDER BY contribution_pct DESC;

-- =========================
-- Product Volume & Revenue
-- =========================
SELECT
    Product,
    ROUND(SUM(Quantity), 2) AS total_units,
    ROUND(SUM(TotalPrice), 2) AS total_revenue,
    ROUND(SUM(TotalPrice) / SUM(Quantity), 2) AS avg_unit_price
FROM products_proj
GROUP BY Product
ORDER BY total_revenue DESC;

-- =========================
-- Product Segmentation分类 (Volume vs Revenue)
-- =========================
SELECT
    Product,
    ROUND(SUM(Quantity), 2) AS total_units,
    ROUND(SUM(TotalPrice), 2) AS total_revenue,
    CASE
        WHEN SUM(Quantity) >= (
            SELECT AVG(qty)
            FROM (
                SELECT SUM(Quantity) AS qty
                FROM products_proj
                GROUP BY Product
            ) t1
        )
        AND SUM(TotalPrice) < (
            SELECT AVG(rev)
            FROM (
                SELECT SUM(TotalPrice) AS rev
                FROM products_proj
                GROUP BY Product
            ) t2
        )
        THEN 'High Volume / Low Revenue'
        WHEN SUM(Quantity) < (
            SELECT AVG(qty)
            FROM (
                SELECT SUM(Quantity) AS qty
                FROM products_proj
                GROUP BY Product
            ) t1
        )
        AND SUM(TotalPrice) >= (
            SELECT AVG(rev)
            FROM (
                SELECT SUM(TotalPrice) AS rev
                FROM products_proj
                GROUP BY Product
            ) t2
        )
        THEN 'Low Volume / High Revenue'
        ELSE 'Balanced'
    END AS product_category
FROM products_proj
GROUP BY Product
ORDER BY total_revenue DESC;

-- =========================
-- Sales Efficiency by Salesperson
-- =========================
SELECT
    Salesperson,
    ROUND(SUM(TotalPrice), 2) AS total_revenue,
    ROUND(SUM(Quantity), 2) AS total_units,
    ROUND(SUM(TotalPrice) / SUM(Quantity), 2) AS revenue_per_unit,
    ROUND(AVG(TotalPrice), 2) AS avg_order_value
FROM products_proj
GROUP BY Salesperson
ORDER BY total_revenue DESC;

-- =========================
-- Yearly Sales & YoY Growth
-- =========================
SELECT
    year,
    ROUND(yearly_sales, 2) AS yearly_sales,
    ROUND(
        100 * (yearly_sales - LAG(yearly_sales) OVER (ORDER BY year))
        / LAG(yearly_sales) OVER (ORDER BY year),
        2
    ) AS yoy_growth_pct
FROM (
    SELECT
        YEAR(`Date`) AS year,
        SUM(TotalPrice) AS yearly_sales
    FROM products_proj
    GROUP BY year
) t;

