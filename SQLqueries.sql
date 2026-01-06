
# Create table for importing data

CREATE TABLE myntra_cleaned_dataset (
    p_id VARCHAR(20) PRIMARY KEY,
    `name` VARCHAR(255),
    price DECIMAL(10 , 2 ),
    colour VARCHAR(50),
    brand VARCHAR(100),
    ratingCount INT,
    avg_rating DECIMAL(3 , 2 )
);

# Imported data using 'Table data import wizard'

SELECT 
    *
FROM
    myntra_cleaned_dataset;


# QUERIES

-- 1. Uniqueness Validation Query

SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT p_id) AS unique_products
FROM
    myntra_cleaned_dataset;


-- 2. Top 10 Highest-Rated Brands

SELECT 
    brand,
    AVG(avg_rating) AS avg_rating,
    SUM(ratingCount) AS total_rating_counts,
    count(*) as product_count
FROM
    myntra_cleaned_dataset
GROUP BY brand
HAVING product_count >= 5  -- only brands with at least 5 products for reliable stats
ORDER BY total_rating_counts DESC
LIMIT 10;


-- 3. Average Price & Rating by Colour

SELECT 
    colour,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(avg_rating), 2) AS avg_rating,
    COUNT(*) AS product_count
FROM
    myntra_cleaned_dataset
GROUP BY colour
ORDER BY avg_rating DESC;


-- 4. Brands with Highest Average Rating (Min 10 Reviews)

SELECT 
    brand,
    ROUND(AVG(avg_rating), 2) AS avg_rating,
    SUM(ratingcount) as total_reviews
FROM
    myntra_cleaned_dataset
GROUP BY brand
HAVING total_reviews >= 10
ORDER BY avg_rating DESC
LIMIT 10;


-- 5. Most Common Colours in High-Rated Products (4.5+ Rating)

SELECT 
    colour, COUNT(*) AS high_rated_count
FROM
    myntra_cleaned_dataset
WHERE
    avg_rating >= 4.5
GROUP BY colour
ORDER BY high_rated_count DESC
LIMIT 10;


-- 6. Price Segments vs Average Rating

SELECT 
    CASE
        WHEN price < 1000 THEN 'Budget (<1k INR)'
        WHEN price BETWEEN 1000 AND 2500 THEN 'Mid-range (1k-2.5k INR)'
        WHEN price > 2500 THEN 'Expensive (>2.5k INR)'
    END AS price_segment,
    ROUND(AVG(avg_rating), 2) AS avg_rating,
    COUNT(*) AS product_count
FROM
    myntra_cleaned_dataset
GROUP BY price_segment
ORDER BY avg_rating DESC;



