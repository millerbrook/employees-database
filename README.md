# sql-challenge
# sql-challenge

In this homework assignment for the Data Visualization bootcamp program, I learned the basics of designing, importing, and working with a database.

The workflow involved beginning with looking at provided csv files and determining their relationships. This was done via quickdatabasediagrams.com, which generates ERD diagrams via basic instructions regarding the composition of tables. In designing the ERD, one nuance was junction tables, which have composite keys. Another nuance involved thinking through the one to many relationships of titles to employees, and understanding the complexities of designing a personnel database at an organization, like mine, that permits employees to hold multiple job titles and multiple salaries. These issues were not directly pertinent to this homework. The ERD is called sqlchallengeERD.pdf.

Once the ERD was designed and troubleshot, the next task involved using pgadmin to create the database. This process was pretty straightforward, although attending to the different naming conventions for data types and focusing on ensuring the data types and, in the case of string, lengths remained consistent. There were some fine tuning issues. For example, I had initially set the string length for sex to 1. However, I ran into problems with that and ended up converting it to 255.

Next, the process involved importing the csv files into the database. This required thinking through the order of table creation as a result of dependencies. The file that does this is called schema.sql.

With the database populated with data, the analysis involved some queries that required joins and subqueries. These were mostly straightforward. The file that does this is called query.sql.

Finally, the bonus required importing the database into Pandas. This required using sqlalchemy to create an engine, and then pd.read_sql to perform the analysis. Figuring out the syntax of the sqlalchemy call, and first importing a module called psycopg2, required some additional research. I created a config.py file to store the password, and noted it in git.ignore. In addition, testing queries in pgadmin before running them in Pandas was a useful workful.

Plotting the data was straightforward through matplotlib and pd.plot. I set the index of the dataframe to the title in order to make the titles appear on the x-axis of the bar chart, which I hadn't realized as a simple solution before.

In terms of analysis, the April Foolsday message and the strange distribution of salaries (where staff seem to make more money than one would expect relative to more senior and technical employees, for example) suggest that the data is not taken from a real source.

