import pandas as pd

data = pd.read_csv('./data/linkedin-jobs-usa.csv')
data.info()

data['salary'] = data['salary'].str.replace('$', '', regex=False)
print(data['salary'].head(20))
data['salary'] = data['salary'].str.replace(',', '', regex=False)

data[['min_salary', 'max_salary']] = data['salary'].str.split('-', expand=True)
print(data['min_salary'].head(20))


print(data.isnull().sum())
print(len(data['company'].unique))