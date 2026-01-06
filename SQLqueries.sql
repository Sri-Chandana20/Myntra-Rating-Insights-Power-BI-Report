
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



