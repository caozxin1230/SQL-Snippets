USE apex_corpact
GO

SELECT DISTINCT e_2.isin,e_2.entry_date, e_2.event_status, em_2.ex_date, d_2.period_total_forecast,d_2.id_event,d_2.id_revision, d_2.period_total_forecast_currency, d_2.forecast_type, d_2.forecast_rule, d_2.total_forecast_income, d_2.total_forecast_income_currency
FROM dividends d_2
INNER JOIN events e_2 ON e_2.id_event=d_2.id_event AND e_2.id_revision = d_2.id_revision 
INNER JOIN event_market_details em_2 ON em_2.id_event=e_2.id_event AND em_2.id_revision= e_2.id_revision
WHERE d_2.id_event='0388200776'
ORDER BY e_2.entry_date


SELECT DISTINCT e_2.isin,e_2.entry_date,d_2.*
FROM dividends d_2
INNER JOIN events e_2 ON e_2.id_event=d_2.id_event AND e_2.id_revision = d_2.id_revision 
INNER JOIN event_market_details em_2 ON em_2.id_event=e_2.id_event AND em_2.id_revision= e_2.id_revision
WHERE d_2.id_event='0340492640'
ORDER BY e_2.entry_date 



SELECT DISTINCT TOP(50)* FROM
(SELECT d_2.id_event,d_2.id_revision,e_2.isin,e_2.entry_date, em_2.ex_date
FROM dividends d_2
INNER JOIN events e_2 ON e_2.id_event=d_2.id_event AND e_2.id_revision = d_2.id_revision 
INNER JOIN event_market_details em_2 ON em_2.id_event=e_2.id_event AND em_2.id_revision= e_2.id_revision) AS dvc_2
INNER JOIN
(SELECT d_1.id_event,d_1.id_revision,e_1.isin,e_1.entry_date, em_1.ex_date
FROM dividends d_1
INNER JOIN events e_1 ON e_1.id_event=d_1.id_event AND e_1.id_revision = d_1.id_revision
INNER JOIN event_market_details em_1 ON em_1.id_event=e_1.id_event AND em_1.id_revision= e_1.id_revision) AS dvc_1
ON dvc_1.isin=dvc_2.isin AND dvc_1.id_event != dvc_2.id_event AND dvc_1.entry_date > dvc_2.entry_date AND dvc_1.ex_date < dvc_2.ex_date
ORDER BY dvc_1.ex_date DESC

/*
SELECT DISTINCT *
FROM dividends
INNER JOIN events ON events.id_event=dividends.id_event AND events.id_revision = dividends.id_revision
INNER JOIN event_market_details ON event_market_details.id_event=dividends.id_event AND event_market_details.id_revision= dividends.id_revision
--LEFT JOIN event_taxation_details ON event_taxation_details.id_event=dividends.id_event AND event_taxation_details.id_revision=dividends.id_revision
INNER JOIN event_periods ON event_periods.id_event=dividends.id_event AND event_periods.id_revision =dividends.id_revision
WHERE dividends.id_event='0364014116'
ORDER BY dividends.id_revision DESC

--SELECT *  FROM [apex_corpact].[dbo].[events] where id_event='0364014116'

*/