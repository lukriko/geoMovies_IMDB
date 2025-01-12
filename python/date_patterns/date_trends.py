import pandas as pd
import matplotlib.pyplot as plt

csv = pd.read_csv('dataset/csv.csv', encoding='latin1')

csv['Air_date'] = pd.to_numeric(csv['Air_date'], errors='coerce')

yearly_trends = csv.groupby('Air_date').agg({
    'Rating': 'mean',  # Average ratings
    'Votes': 'sum'     # Total votes
}).reset_index()


yearly_trends.rename(columns={'Air_date': 'Year', 'Rating': 'Average Rating', 'Votes': 'Total Votes'}, inplace=True)

plt.figure(figsize=(14, 6))

# average rating - year
plt.subplot(1, 2, 1)
plt.plot(yearly_trends['Year'], yearly_trends['Average Rating'], marker='o', color='blue', label='Average Rating')
plt.title('Trend of Average Ratings Over the Years')
plt.xlabel('Year')
plt.ylabel('Average Rating')
plt.grid(True)
plt.legend()

# total votes - year
plt.subplot(1, 2, 2)
plt.plot(yearly_trends['Year'], yearly_trends['Total Votes'], marker='o', color='green', label='Total Votes')
plt.title('Trend of Total Votes Over the Years')
plt.xlabel('Year')
plt.ylabel('Total Votes')
plt.grid(True)
plt.legend()


plt.tight_layout()
plt.show()
