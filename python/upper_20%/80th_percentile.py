import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

csv = pd.read_csv('dataset/csv.csv', encoding='latin1')

csv_rating = csv['Rating']
rating_80th_percentile = np.percentile(csv['Rating'], 80)

# top 20% data for rating, average runtime, average year
top_20_percent = csv[csv_rating >= rating_80th_percentile]
avg_runtime_top_20 = np.mean(top_20_percent['TP_min'])
avg_year_top_20 = np.mean(top_20_percent['Air_date'])

# bottom 80% data for rating, average runtime, average year
bottom_80_percent = csv[csv_rating <= rating_80th_percentile]
avg_runtime_bottom_80 = np.mean(bottom_80_percent['TP_min'])
avg_year_bottom_80 = np.mean(bottom_80_percent['Air_date'])

print(f"Top 20% Movies - Avg Runtime: {avg_runtime_top_20}, Avg Year: {avg_year_top_20}")
print(f"Bottom 80% Movies - Avg Runtime: {avg_runtime_bottom_80}, Avg Year: {avg_year_bottom_80}")

# Plot 1: Boxplot for Top 20% Movies - Runtime
plt.figure(figsize=(8, 6))
sns.boxplot(data=top_20_percent['TP_min'], palette="coolwarm", showmeans=True)
plt.title("Top 20% Movies - Runtime")
plt.ylabel("Runtime (minutes)")
plt.show()

# Plot 2: Boxplot for Bottom 80% Movies - Runtime
plt.figure(figsize=(8, 6))
sns.boxplot(data=bottom_80_percent['TP_min'], palette="coolwarm", showmeans=True)
plt.title("Bottom 80% Movies - Runtime")
plt.ylabel("Runtime (minutes)")
plt.show()

# Plot 3: Boxplot for Top 20% Movies - Release Year
plt.figure(figsize=(8, 6))
sns.boxplot(data=top_20_percent['Air_date'], palette="coolwarm", showmeans=True)
plt.title("Top 20% Movies - Release Year")
plt.ylabel("Release Year")
plt.show()

# Plot 4: Boxplot for Bottom 80% Movies - Release Year
plt.figure(figsize=(8, 6))
sns.boxplot(data=bottom_80_percent['Air_date'], palette="coolwarm", showmeans=True)
plt.title("Bottom 80% Movies - Release Year")
plt.ylabel("Release Year")
plt.show()
