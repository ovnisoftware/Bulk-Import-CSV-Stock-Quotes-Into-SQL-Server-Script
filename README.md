# Bulk-Import-CSV-Stock-Quotes-Into-SQL-Server-Script
SQL script to copy stock quotes in .csv files into a SQL server database

These scripts can be used to import stock quote information that is downloaded in .csv format from Yahoo Finance into SQL Server.

How to get it to work:

1. Download some .csv stock information using the Yahoo Finance Quote Downloader app I wrote (also on Github here:
https://github.com/ovnisoftware/YahooFinanceQuoteDownloader)

2. Create a new database in SQL Server (I used SSMS 2014 but it may work in previous versions.  However I I didn't test it)

3. Run the TickerPopulation.sql script to create the table that will hold all of the stock quotes.

4. Open the TickerTableCreation.sql script file and change the @filePath variable on line 7 from 'F:\MarketData' to whatever folder your .csv file info is in.  The folder you download the .csv files in should not have anything else in it except for the .csv files.

5. Run the TickerTableCreation.sql script file.
