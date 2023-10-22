# Maven Pizza Analysis

## Table of Contents
+ [Project Overview](#Project-overview)
+ [Technologies Used](#Technologies-Used)
+ [Project Problem](#Project-Problem)
+ [Project Walkthrough](#Project-Walkthrough)
+ [Project Insights](#Project-Insights)
+ [Screenshots](#Screenshots)
+ [Source](#Source)

## Project Overview
The primary objective of this project is to gain valuable insights from pizza sales data, focusing on key metrics. This project involves using Python to import CSV data into a MySQL database, writing SQL queries to extract insights from the data, and visualizing the results using Tableau. Additionally, a comprehensive PDF document is provided that showcases the queries, results.

## Technologies Used
+ Python 3.10.9 - For importing CSV data into MySQL.
+ MySQL - As the relational database management system.
+ SQL - For writing queries to analyze the data.
+ Tableau - For creating interactive data visualizations.

## Project Problem
The challenge in this project is to analyze a large dataset of pizza sales and extract meaningful insights to help Maven's Slices make data-driven decisions. The specific problems addressed in this analysis include:

- Understanding overall revenue and sales volume.
- Identifying the most and the least popular pizza categories and individual pizzas.
- Analyzing order size distribution.
- Determining the best hours and days for sales.
- Identifying the best and worst months in terms of revenue.

## Project Walkthrough
1. Importing CSV Data into MySQL
2. Take a preliminary look at the dataset
3. Use SQL queries to determine the data type of each column in the dataset
4. Certain columns required a change in data type
5. Alter values within a column for consistency purposes
6. With SQL's aggregation functions, calculate important metrics (Refer to the PDF document for a comprehensive overview of the queries and results)
7. Create insightful visualization using Tableau. Click in the following link to interact with the visualization: [Tableau Public](https://public.tableau.com/app/profile/nilvia.arjona/viz/MavensSlicesKPITracking/Dashboard2)

## Project Insights
- The total revenue generated from pizza sales amounts to $817,860 reflecting the financial success of the business.
- A substantial quantity of pizzas, totaling $49,574 was sold during the analyzed period.
- The total number of orders placed was $21,350 indicating a significant customer base.
- The "Classic" pizza category was the most popular, with a total of 10,859 orders and the "Chiken" pizza category was the least popular, with a total of 8,536 orders.
- The "Thai Chicken" pizza emerged as the top-selling individual pizza, yielding $43,434 in revenue, in contrast, the "Brie Carre" pizza had the lowest revenue, at $11,588.
- Among the various sizes offered, the "Large" size proved to be the most favored, accounting for 4,564 orders.
- The data indicates that sales with the highest order volumes occurrs during the 12th hour of the day. Additionally, Friday is the best day of the week for sales.
- The analysis indicated that July is the most lucrative months, generating $72,558 in revenue.

  
## Screenshots
<div style="display: flex; flex-direction: row;">
  <img  style="margin-bottom: 10px;" src="https://github.com/NilArj/Pizza-Analysis/blob/c4020069395e7e884c99917c29dab99d2f50312c/images/Captura%20de%20pantalla%202023-10-21%20173229.png" alt="visualization insights" width="600" height="280">

</div>

## Source
Dataset: [Pizza Place Sales](https://mavenanalytics.io/challenges/maven-pizza-challenge/4)
