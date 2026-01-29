<code>RELATIONAL DATABASE</code> <code>SQL</code> <code>PostgreSQL</code> 

<h1>Relational Database Workshop Notes</h1>

<p>Personal notes made while creating a Relational Database in a FreeCodeCamp Workshop using PostgreSQL.</p>

<h2>PostgreSQL</h2>
<p><bold>PostgreSQL</bold> is an object-relational database management system that utilizes the SQL language.</p>
<p><bold>PSQL</bold> is a powerful interactive terminal for working with the PostreSQL database.</p>

<h2>PSQL commands in PostgreSQL</h2>

<table>
  <caption>
    PSQL Commands used
  </caption>
  <thead>
    <tr>
      <th>Command</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>psql --username=freecodecamp --dbname=postgres</td>
      <td>Connects to a database under a specific user</td>
    </tr>
    <tr>
      <td>\l</td>
      <td>List all available databases</td>
    </tr>
    <tr>
      <td>\c database_name</td>
      <td>Switch connection to a new database</td>
    </tr>
    <tr>
      <td>\d</td>
      <td>Display relations/Tables of the current database</td>
    </tr>
    <tr>
      <td>\d table_name</td>
      <td>Describe details about the table such as columns, types, modifiers, etc.</td>
    </tr>
  </tbody>
</table>

<h2>SQL - Structured Query Language</h2>
<p><bold>SQL</bold> is a programming language for managing and manipulating data in relational database management systems (RDBMS).</p>

```mermaid
graph TD;
  SQL_Commands-->DDL;
  SQL_Commands-->DML;
  SQL_Commands-->TCL;
  SQL_Commands-->DQL;
  SQL_Commands-->DCL;
```

<p>In this Workshop were used three different types of SQL commands:</p>
<ul>
  <li>DDL - Data Definition Language</li>
  <li>DML - Data Manipulation Language</li>
  <li>DQL - Data Query Language</li>
</ul>
<p>In addition to these SQL types of commands, there are also the following ones, for informational purposes only.</p>
<ul>
  <li>DCL - Data Control Language</li>
  <li>TCL - Transaction Control Languange</li>
</ul>

<h3>Data Definition Language (DDL)</h3>
<p>These commands are used to define or modify the database schema or structure.</p>

```mermaid
graph TD;
  DDL-->CREATE;
  DDL-->DROP;
  DDL-->ALTER;
  DDL-->TRUNCATE;
```

<h4>DATABASES</h4>

```sql
CREATE DATABASE database_name; --Creates a new Database.
```
```sql
ALTER DATABASE database_name RENAME TO new_database_name; --Rename database.
```
```sql
DROP DATABASE database_name; --Drop a database.
```

<h4>TABLES</h4>
<h5>CREATE TABLE</h5>

```sql
CREATE TABLE table_name();      --Create Table

CREATE TABLE table_name(        --Create Table with columns
  column1 DATA_TYPE CONSTRAINT,
  column2 DATA_TYPE CONSTRAINT,
  column3 DATA_TYPE CONSTRAINT
);
```
<h5>ALTER TABLE</h5>

```sql
--Set Primary Key to
ALTER TABLE table_name ADD PRIMARY KEY(column_name);  

--Composite Primary Key
ALTER TABLE table_name ADD PRIMARY KEY(column1,column2); 

--Create and set a new column as Foreign Key
ALTER TABLE table_name ADD COLUMN DATA_TYPE REFERENCES referenced_table_name(referenced_column_name); 

--Set an existing column as Foreign Key
ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column);

--Set a UNIQUE constraint to a column
ALTER TABLE table_name ADD UNIQUE(column_name); 

--Set column constraint
ALTER TABLE table_name ALTER COLUMN column_name SET CONSTRAINT. 

--Drop column constraint
ALTER TABLE table_name DROP CONSTRAINT constraint_name; 

--Remove a column
ALTER TABLE table_name DROP COLUMN; 

--Rename column
ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name; 
```

<h5>DROP TABLE</h5>

```sql
DROP TABLE table_name; --Drop table from Database
```

<h3>Data Manipulation Language (DML)</h3>

```mermaid
graph TD;
  DML-->INSERT;
  DML-->UPDATE;
  DML-->DELETE;
```

```sql
INSERT INTO table_name(column1, column2) --Insert values in table
  VALUES(value1,value2),
        (value3,value4);
```
```sql
UPDATE table_name SET column_name=new_value WHERE condition; --Change record\value by WHERE condition;
```
```sql
DELETE FROM table_name WHERE condition;
```

<h3>Data Query Language (DQL)</h3>

```mermaid
graph TD;
  DQL-->SELECT;
```
```sql
SELECT * FROM table_name; --Use * to denote all the table's column

SELECT column1, column2, FROM table_name ORDER BY column_name;
```
<h2>DATA TYPES</h2>

<h3>INT</h3>
<h3>VARCHAR(30)</h3>
<h3>SERIAL</h3>
<h3>DATE ('YYYY-MM-DD')</h3>
<h3>NUMERIC(4,1)</h3>

<h2>CONSTRAINTs</h2>
<h3>NOT NULL</h3>
<h3>PRIMARY KEY</h3>
<h3>UNIQUE</h3>

<h2>REFERENCES</h2>
<ul>
  <li><a href="https://www.geeksforgeeks.org/postgresql/postgresql-psql-commands/">GeeksForGeeks: PostgreSQL - Psql commands</a></li>
  <li><a href="https://www.ibm.com/think/topics/structured-query-language#:~:text=Authors,city%20=%20'New%20York'%20;">IBM: What is Structured Query Language (SQL)?</a></li>
  <li><a href="https://www.geeksforgeeks.org/sql/sql-ddl-dql-dml-dcl-tcl-commands/">GeeksForGeeks: SQL Commands</a></li>
  <li><a href="https://www.geeksforgeeks.org/postgresql/postgresql-primary-key/">PostgreSQL - Primary Key</a></li>
</ul>
