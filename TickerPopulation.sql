declare @tickerLocation varchar(max);  --String of file path w/ ticker name
declare @bulkInsertCmd varchar(max);  --String to bulk insert each ticker
Declare @filePath varchar(max);  --Stores file path to tickers
Declare @dirTree varchar(max);  --xp_dirtree sproc string

--Enter directory of folder when calling sproc
SET @filePath = '''F:\MarketData''';

--Create temp table to store ticker file locations
CREATE TABLE #TickerFilePaths
(
	subdirectory varchar(500),
	depth int,
	[file] int
)

--Execute xp_dirtree to get file names
set @dirTree = 'xp_dirtree ' + @filePath + ',0,1;'
insert into #TickerFilePaths
exec(@dirTree);

--Prepend file path to file names
set @filePath = left(@filePath, LEN(@filePath) - 1);
update #TickerFilePaths
set subdirectory = concat(@filePath + '\', subdirectory + '''');

--Use cursor to loop through all tickers
DECLARE db_cursor CURSOR FOR  
SELECT subdirectory
from #TickerFilePaths
open db_cursor
fetch next from db_cursor into @tickerLocation
while @@FETCH_STATUS = 0
begin
  set @bulkInsertCmd = 'bulk insert TickerQuotes FROM ' + @tickerLocation +
  'with
  (
  Firstrow =2,
  fieldterminator = '','',
  rowterminator = ''\n''
  )'
  exec (@bulkInsertCmd);
  fetch next from db_cursor into @tickerLocation
end
close db_cursor
deallocate db_cursor

drop table #TickerFilePaths