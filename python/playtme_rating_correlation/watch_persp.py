import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

csv = pd.read_csv('dataset/csv.csv', encoding='latin1')
# print(csv.head())
ratings_csv = csv['Rating'].values
playtime_csv = csv['TP_min'].values

array_ratings = list(ratings_csv)
array_playtime = list(playtime_csv)


# correlation coefficient

corr_coeff = np.corrcoef(array_ratings,array_playtime)[0,1]
print(f'correlation oeffiecient is: {corr_coeff}')

# no clear relationship


plt.scatter(csv['TP_min'], csv['Rating'], alpha=0.5, c='green')
plt.title('Runtime vs. Rating')
plt.xlabel('Runtime (TP_min)')
plt.ylabel('Rating')
plt.grid()
plt.show()


