# Databricks notebook source
%sql
USE CATALOG `catalog-<sufix>`;
USE SCHEMA `schema-<sufix>`

# COMMAND ----------

%sql
CREATE TABLE diamonds 
USING PARQUET
LOCATION 'abfss://<sufix>@adloperationsqnoryh.dfs.core.windows.net/diamonds';

# COMMAND ----------

%sql
select * from diamonds

# COMMAND ----------

%sql
CREATE VIEW v_diamonds AS
SELECT * 
FROM diamonds

# COMMAND ----------

%sql
SELECT *
FROM v_diamonds
