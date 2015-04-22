CREATE TABLE dbo.TickerQuotes
	(
	Ticker varchar(20) NOT NULL,
	[Date] date NOT NULL,
	[Open] decimal(10, 2) NOT NULL,
	High decimal(10, 2) NOT NULL,
	Low decimal(10, 2) NOT NULL,
	[Close] decimal(10, 2) NOT NULL,
	Volume bigint NOT NULL,
	[Adj_Close] decimal(10, 2) NOT NULL
	) 