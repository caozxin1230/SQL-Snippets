USE apex_corpact
GO

SELECT *
FROM dividends
LEFT JOIN events ON events.id_event=dividends.id_event AND events.id_revision = dividends.id_revision
LEFT JOIN event_market_details ON event_market_details.id_event=dividends.id_event AND event_market_details.id_revision= dividends.id_revision
LEFT JOIN event_periods ON event_periods.id_event=dividends.id_event AND event_periods.id_revision =dividends.id_revision
WHERE dividends.id_event IN ('0341429320')

/*
SELECT DISTINCT dividends.period_total_forecast,dividends.id_event, event_market_details.ex_date,event_market_details.payment_date, dividends.id_revision
FROM [apex_corpact].[dbo].[dividends]
INNER JOIN [apex_corpact].[dbo].events ON [apex_corpact].[dbo].[dividends].id_event=[apex_corpact].[dbo].events.id_event
INNER JOIN [apex_corpact].[dbo].event_market_details ON [apex_corpact].[dbo].[dividends].id_event=event_market_details.id_event
WHERE dividends.period_total_forecast IS NOT NULL
AND events.isin='US67011E2046'
AND dividends.id_revision IN 
(
SELECT MAX(dividends.id_revision)
FROM [apex_corpact].[dbo].[dividends]
INNER JOIN [apex_corpact].[dbo].events ON [apex_corpact].[dbo].[dividends].id_event=[apex_corpact].[dbo].events.id_event
WHERE events.isin='US67011E2046'
GROUP BY dividends.id_event
HAVING (COUNT (dividends.id_event)>1)
)
ORDER by dividends.period_total_forecast DESC

*/