USE apex_corpact
GO

/*
SELECT events.isin,dividends.id_event, dividends.id_revision,events.event_status,dividends.dividend_amount, dividends.dividend_amount_currency,dividends.forecast_rule,dividends.forecast_type,
dividends.period_total_forecast,dividends.period_total_forecast_currency,events.entry_date, event_market_details.ex_date, event_market_details.payment_date
FROM dividends
LEFT JOIN events ON events.id_event=dividends.id_event AND events.id_revision = dividends.id_revision
LEFT JOIN event_market_details ON event_market_details.id_event=dividends.id_event AND event_market_details.id_revision= dividends.id_revision
LEFT JOIN event_periods ON event_periods.id_event=dividends.id_event AND event_periods.id_revision =dividends.id_revision
WHERE dividends.id_event='0192021906'
*/

SELECT DISTINCT events.isin,dividends.id_event, dividends.id_revision,events.event_status,dividends.dividend_amount, dividends.dividend_amount_currency,dividends.forecast_rule,dividends.forecast_type,
dividends.period_total_forecast,dividends.period_total_forecast_currency,events.entry_date, event_market_details.ex_date, event_market_details.payment_date
FROM dividends
INNER JOIN events ON events.id_event=dividends.id_event AND events.id_revision = dividends.id_revision
INNER JOIN event_market_details ON event_market_details.id_event=dividends.id_event AND event_market_details.id_revision= dividends.id_revision
INNER JOIN event_periods ON event_periods.id_event=dividends.id_event AND event_periods.id_revision =dividends.id_revision
WHERE events.id_event IN (
SELECT dividends.id_event
FROM dividends
INNER JOIN events ON events.id_event=dividends.id_event AND events.id_revision = dividends.id_revision
INNER JOIN event_market_details ON event_market_details.id_event=dividends.id_event AND event_market_details.id_revision= dividends.id_revision
INNER JOIN event_periods ON event_periods.id_event=dividends.id_event AND event_periods.id_revision =dividends.id_revision
WHERE events.id_event IN (
SELECT dividends.id_event
FROM dividends
INNER JOIN events ON events.id_event=dividends.id_event AND events.id_revision = dividends.id_revision
INNER JOIN event_market_details ON event_market_details.id_event=dividends.id_event AND event_market_details.id_revision= dividends.id_revision
INNER JOIN event_periods ON event_periods.id_event=dividends.id_event AND event_periods.id_revision =dividends.id_revision
WHERE events.entry_date > event_market_details.ex_date)
AND events.entry_date < event_market_details.ex_date AND dividends.period_total_forecast IS NOT NULL
GROUP BY dividends.id_event
HAVING COUNT(dividends.id_event)>2)
ORDER BY dividends.id_event,dividends.id_revision

