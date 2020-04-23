import pandas as pd
import plotly.express as px

df = pd.read_csv(r'us-pa-with-headers\data.csv')

fig = px.line(df, x="date", y="cases", title='Number of cases', color='filename')
fig.show()