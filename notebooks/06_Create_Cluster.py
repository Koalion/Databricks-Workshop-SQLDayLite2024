# Databricks notebook source
dbutils.secrets.listScopes()

# COMMAND ----------

dbutils.secrets.list("<secret_scope_name>")

# COMMAND ----------

x = dbutils.secrets.get("<secret_scope_name>", "<secret_name>")
print(x)

# COMMAND ----------

path = "abfss://test-csv@adloperationsqnoryh.dfs.core.windows.net/"
file_name = "diamonds.csv"
df = spark.read.csv(path=path+file_name, header=True)
df.show()

# COMMAND ----------

path = "abfss://<your_container_name>@adloperationsqnoryh.dfs.core.windows.net/diamonds"
df.write.format("parquet").save(path) 

# COMMAND ----------
df2 = spark.read.parquet(path)
display(df2)