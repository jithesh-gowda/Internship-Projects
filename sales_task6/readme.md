# Sales Data Analysis - SQL Queries

## Overview
This repository contains SQL queries for analyzing sales transaction data. The queries help extract insights such as monthly revenue, order volume, and trends over specific time periods.

## SQL Queries Guide

### 1. Extract Year and Month from Transaction Date
If `Transaction_Date` is stored as text, convert it to a date format using `STR_TO_DATE()`:
```sql
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(Transaction_Date, '%d-%b-%y')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(Transaction_Date, '%d-%b-%y')) AS month
FROM sales
LIMIT 10;
