--Run this to find any duplicate dates
select ticker, date
from TickerQuotes
group by ticker, date
having count(*) > 1

----Run this to insert a duplicate to test
--insert into Tickerquotes (Ticker, Date, [Open], high, low, [Close], volume, Adj_Close)
--values ('ge', '2015-04-15', 125, 126, 127, 128, 129, 130);

----Run this to delete the duplicate
--delete
--from TickerQuotes
--where ticker = 'ge'
--and date = '2015-04-15'
--and [open] = '125'