USE apex_corpact
GO

SELECT e_1.isin, e_1.entry_date, dvc_1.id_event,dvc_1.id_revision, dvc_1.period_total_forecast,dvc_1.period_total_forecast_currency,dvc_1.total_forecast_income, dvc_1.total_forecast_income_currency,
e_2.isin, e_2.entry_date, dvc_2.id_event,dvc_2.id_revision, dvc_2.period_total_forecast,dvc_2.period_total_forecast_currency,dvc_2.total_forecast_income, dvc_2.total_forecast_income_currency
FROM dividends dvc_1
INNER JOIN dividends dvc_2 ON dvc_1.id_event = dvc_2.id_event --AND dvc_1.id_revision = dvc_2.id_revision
INNER JOIN events e_1 on e_1 .id_event=dvc_1.id_event AND e_1.id_revision=dvc_1.id_revision
INNER JOIN events e_2 on e_2 .id_event=dvc_2.id_event AND e_2.id_revision=dvc_2.id_revision
WHERE dvc_1.total_forecast_income != dvc_2 .total_forecast_income AND dvc_1.period_total_forecast=dvc_2.period_total_forecast
AND dvc_1.forecast_type != dvc_2.forecast_type
AND e_1.entry_date>'2018-06-01'AND e_2.entry_date>'2018-06-01' --AND dvc_1.id_event='0009731914' 
ORDER BY dvc_1.id_event, dvc_1.id_revision