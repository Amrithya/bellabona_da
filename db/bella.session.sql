WITH total_users AS (
  SELECT COUNT(DISTINCT id) AS total_user_count
  FROM users
)
SELECT 
  'July' AS month, 
  COUNT(DISTINCT o.user_id) AS users_with_order, tu.total_user_count AS Total_Users,
  (COUNT(DISTINCT o.user_id) * 1.0 / tu.total_user_count) AS activation_rate
FROM orders o, total_users tu
WHERE o.date >= '2024-07-01T00:00:00Z' 
  AND o.date < '2024-08-01T00:00:00Z'
GROUP BY month

UNION ALL

SELECT 
  'August' AS month, 
  COUNT(DISTINCT o.user_id) AS users_with_order,tu.total_user_count AS Total_Users,
  (COUNT(DISTINCT o.user_id) * 1.0 / tu.total_user_count) AS activation_rate
FROM orders o, total_users tu
WHERE o.date >= '2024-08-01T00:00:00Z' 
  AND o.date < '2024-09-01T00:00:00Z'
GROUP BY month

UNION ALL

SELECT 
  'September' AS month, 
  COUNT(DISTINCT o.user_id) AS users_with_order,tu.total_user_count AS Total_Users,
  (COUNT(DISTINCT o.user_id) * 1.0 / tu.total_user_count) AS activation_rate
FROM orders o, total_users tu
WHERE o.date >= '2024-09-01T00:00:00Z' 
  AND o.date < '2024-10-01T00:00:00Z'
GROUP BY month;


WITH category_order_count AS (
    SELECT 
        u.city,
        d.category,
        COUNT(o.id) AS order_count
    FROM 
        orders o
    JOIN 
        dishes d ON o.dish_id = d.id
    JOIN 
        users u ON o.user_id = u.id
    GROUP BY 
        u.city, d.category
),
ranked_categories AS (
    SELECT 
        city,
        category,
        order_count,
        RANK() OVER (PARTITION BY city ORDER BY order_count DESC) AS category_rank
    FROM 
        category_order_count
)
SELECT 
    city,
    category,
    order_count
FROM 
    ranked_categories
WHERE 
    category_rank <= 3
ORDER BY 
    city, category_rank;

SELECT 
    CASE strftime('%m', o.date)
        WHEN '01' THEN 'January'
        WHEN '02' THEN 'February'
        WHEN '03' THEN 'March'
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
        WHEN '07' THEN 'July'
        WHEN '08' THEN 'August'
        WHEN '09' THEN 'September'
        WHEN '10' THEN 'October'
        WHEN '11' THEN 'November'
        WHEN '12' THEN 'December'
    END AS month_name,
    strftime('%Y', o.date) AS year,
    SUM(d.price) AS total_revenue
FROM 
    orders o
JOIN 
    dishes d ON o.dish_id = d.id
GROUP BY 
    year, month_name
ORDER BY 
    year, strftime('%m', o.date);



