<p align="center">
  <img src="myntra.png" width="140"/>
</p>

<h1 align="center"> Myntra Rating Insights Report</h1>

### Overview
This report analyzes a scraped Myntra fashion product dataset to identify trends in ratings, reviews, price, brand, and colour. The goal is to improve recommendation quality by balancing high-volume items with high-rated ones for better customer engagement and satisfaction.

**Original Dataset Size:** 14,330 rows (scraped Myntra Dataset).

**Cleaned Dataset Size:** 355 high-quality rated products.

**Key Findings:** Overall average rating 4.1; Ahika leads with 58,569 reviews; Black and Pink dominate volume (40k+ reviews each).

The project demonstrates end-to-end analytics: Data cleaning, querying, visualization, and actionable recommendations.

---

### Table of Contents

- Data Source & Cleaning

- Tools Used

- Analysis & Insights
  
- Power BI Report
  
- Recommendations
  
- Limitations
  
- DAX Measures
  
- Setup & Reproduction
  
- Contact

---

### Data Source & Cleaning

**Source:** [Myntra Fashion Product Dataset](https://www.kaggle.com/datasets/hiteshsuthar101/myntra-fashion-product-dataset/data) with 11 columns: index, p_id, name, price, color, brand, img, ratingCount, avg_rating, description, p_attributes.

**Cleaning Process (Excel):**

- **Removed Irrelevant Columns:** Deleted non-analytical fields (index, images, descriptions, p_attributes, unnamed row numbers) to focus on core data (p_id, name, price, colour, brand, ratingCount, avg_rating).

- **Handled Blank Rows:** Used copy-paste values to a new sheet to eliminate empty rows, ensuring only populated records remained.

- **Filtered Incomplete Records:** Applied filters to remove rows with blank ratingCount, resulting in a high-quality dataset of 355 rated products for reliable analysis.

**Result:** From 14,330 raw scraped rows to 355 clean, unique products — prioritizing quality over quantity.

---

### Tools Used

**Excel:** Initial exploration and cleaning.

**MySQL:** Database storage (CREATE TABLE with data types like DECIMAL for price/avg_rating, VARCHAR for brand/colour) and querying (LOAD DATA INFILE for import, 6 analytical queries).

**Power BI:** Interactive visualization (4 pages with KPIs, donut/bar charts, scatter plots, matrix; synced slicers for brand/colour).













