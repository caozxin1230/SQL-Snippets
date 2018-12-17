USE apex_corpact
GO

SELECT DISTINCT *
FROM

(SELECT events.isin,dividends.id_event, MAX(dividends.id_revision) AS id_revision
FROM dividends
INNER JOIN events ON events.id_event=dividends.id_event AND events.id_revision = dividends.id_revision
INNER JOIN event_market_details ON event_market_details.id_event=dividends.id_event AND event_market_details.id_revision= dividends.id_revision
INNER JOIN event_periods ON event_periods.id_event=dividends.id_event AND event_periods.id_revision =dividends.id_revision
--WHERE dividends.dividend_subtype != 'Alternative Currency' and dividends.dividend_amount_currency != dividends.period_total_forecast_currency AND events.isin IS NOT NULL
GROUP BY events.isin,dividends.id_event) AS part_1
INNER JOIN 
(SELECT events.isin,dividends.id_event, dividends.id_revision,dividends.dividend_status,dividends.dividend_amount, dividends.dividend_amount_currency,dividends.forecast_rule,dividends.forecast_type,
dividends.period_total_forecast,dividends.period_total_forecast_currency,dividends.dividend_subtype, events.entry_date, event_market_details.ex_date, event_market_details.payment_date, events.event_status
FROM dividends
INNER JOIN events ON events.id_event=dividends.id_event AND events.id_revision = dividends.id_revision
INNER JOIN event_market_details ON event_market_details.id_event=dividends.id_event AND event_market_details.id_revision= dividends.id_revision
INNER JOIN event_periods ON event_periods.id_event=dividends.id_event AND event_periods.id_revision =dividends.id_revision
) AS part_2
ON part_1.id_event=part_2.id_event AND part_1.id_revision=part_2.id_revision 
WHERE part_2.dividend_subtype!= 'Alternative Currency' and part_2.dividend_amount_currency != part_2.period_total_forecast_currency AND part_2.isin IS NOT NULL
ORDER BY part_2.entry_date, part_1.isin, payment_date