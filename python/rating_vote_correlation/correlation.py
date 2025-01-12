
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

csv = pd.read_csv('dataset/csv.csv', encoding='latin1')  # or 'iso-8859-1'
# print(csv.head())
ratings_csv = csv['Rating'].values
votes_csv = csv['Votes'].values

array_ratings = list(ratings_csv)
array_votes = list(votes_csv)


# correlation coefficient

corr_coeff = np.corrcoef(array_ratings,array_votes)[0,1]
print(f'correlation oeffiecient is: {corr_coeff}')


plt.scatter(array_ratings, array_votes, alpha=0.5)
plt.title('Ratings vs Votes')
plt.xlabel('Ratings')
plt.ylabel('Votes')
plt.show()

low_ratings = csv[csv['Rating'] <= 5]
high_ratings = csv[csv['Rating'] >= 9]
print(low_ratings)
print(high_ratings)


csv['Rating'].hist(bins=20)
plt.title('Distribution of Ratings')
plt.xlabel('Rating')
plt.ylabel('Frequency')
plt.show()

csv['Votes'].hist(bins=20)
plt.title('Distribution of Votes')
plt.xlabel('Votes')
plt.ylabel('Frequency')
plt.show()
