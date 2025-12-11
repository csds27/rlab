library(plotly)
library(gapminder)
library(dplyr)

# Load Gapminder dataset
data("gapminder")

# Scatter plot of GDP vs Life Expectancy by Continent
scatter_plot <- gapminder %>%
  plot_ly(
    x = ~gdpPercap,
    y = ~lifeExp,
    color = ~continent,
    size = ~pop,
    hoverinfo = 'text',
    text = ~paste("Country:", country, "<br>GDP per Capita:", gdpPercap),
    type = 'scatter',
    mode = 'markers'
  ) %>%
  layout(title = 'GDP vs Life Expectancy by Continent')

# Display the scatter plot
scatter_plot

# Bar chart of Life Expectancy by Country in 2007
bar_chart <- gapminder %>%
  filter(year == 2007) %>%
  plot_ly(
    x = ~country,
    y = ~lifeExp,
    type = 'bar',
    hoverinfo = 'text',
    text = ~paste("Country:", country, "<br>Life Expectancy:", lifeExp)
  ) %>%
  layout(title = 'Life Expectancy by Country in 2007')

# Display the bar chart
bar_chart

# Line chart showing Life Expectancy trends in Asia
line_chart <- gapminder %>%
  filter(continent == 'Asia') %>%
  plot_ly(
    x = ~year,
    y = ~lifeExp,
    color = ~country,
    type = 'scatter',
    mode = 'lines'
  ) %>%
  layout(title = 'Life Expectancy Trend in Asia')

# Display the line chart
line_chart

# Combine the scatter, bar, and line charts into one interactive layout
dashboard <- subplot(scatter_plot, bar_chart, line_chart, nrows = 1) %>%
  layout(title = 'Gapminder Data Visualization')

# Display the dashboard
dashboard
