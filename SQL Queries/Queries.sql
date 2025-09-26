-- Revenue Breakdown
SELECT
  SUM(ft.fare_amount) AS total_fare,
  SUM(ft.extra) AS total_extra_fees,
  SUM(ft.mta_tax) AS total_mta_tax,
  SUM(ft.tolls_amount) AS total_tolls,
  SUM(ft.improvement_surcharge) AS total_surcharge,
  SUM(ft.total_amount) AS grand_total_revenue
FROM
  `uber-data-analysis-473212.Uber_dataset.fact_table` AS ft;

-- Total Amount by Payment Type
SELECT payment_type_name, ROUND(SUM(total_amount),2) AS Total_amount
FROM `uber-data-analysis-473212.Uber_dataset.tbl_analysis_report`
GROUP BY payment_type_name
ORDER BY total_amount DESC;

-- Average Trip Distance by Payment Type
SELECT payment_type_name, ROUND(AVG(total_amount),2) AS distance
FROM `uber-data-analysis-473212.Uber_dataset.tbl_analysis_report`
GROUP BY payment_type_name
ORDER BY distance DESC;

-- Total Amount by Rate code
SELECT rate_code_name, ROUND(SUM(total_amount),2) AS total_amount
FROM `uber-data-analysis-473212.Uber_dataset.tbl_analysis_report`
GROUP BY rate_code_name
ORDER BY total_amount DESC;

-- Total Amount by Passenger Count
SELECT passenger_count, ROUND(SUM(total_amount),2) AS Total_amount
FROM `uber-data-analysis-473212.Uber_dataset.tbl_analysis_report`
GROUP BY passenger_count
ORDER BY total_amount DESC;

-- Total Tip amount by Passenger count
SELECT passenger_count, ROUND(SUM(tip_amount),2) AS Total_amount
FROM `uber-data-analysis-473212.Uber_dataset.tbl_analysis_report`
GROUP BY passenger_count
ORDER BY total_amount DESC;

-- Average Fare and Tip by Payment Type
SELECT
  pt.payment_type_name,
  COUNT(ft.trip_id) AS total_trips,
  AVG(ft.fare_amount) AS avg_fare,
  AVG(ft.tip_amount) AS avg_tip,
  SUM(ft.total_amount) AS total_fare_and_tip
FROM
  `uber-data-analysis-473212.Uber_dataset.fact_table` AS ft
JOIN
  `uber-data-analysis-473212.Uber_dataset.payment_type_dim` AS pt
  ON ft.payment_type_id = pt.payment_type_id
GROUP BY
  1
ORDER BY

  total_fare_and_tip DESC;
