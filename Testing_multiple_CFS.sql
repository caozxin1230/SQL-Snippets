/* Testing multiple CFS*/

SELECT DISTINCT ucfs.parent_cfs_id,ucfs.composition_type AS ultimate_composition_type, ucfs.default_cash_flow AS ultimate_cfs_default_cash_flow,
cfs.cash_flow_set_id,cfs.composition_type,cfs.default_cash_flow AS regular_cfs_default_cash_flow, cfs.flag,
ocfs.default_cash_flow AS override_default_cash_flow,
ca.fds_id,cal.ex_date, ca.vendor_event_id,ca.event_id,ca.source_id,ca.event_type,ca.status,
ecd.gross_rate,ecd.gross_ccy,ecd.net_rate,ecd.net_ccy,
ecd.reinvestment_price_D,ecd.DRIP_ccy,ecd.DRIP_discount_D,ecd.DRIP_end_date,ecd.DRIP_start_date,sd.percentage_rate,
oecd.gross_rate AS override_gross_rate ,oecd.gross_ccy AS override_gross_ccy,oecd.net_rate AS override_net_rate,oecd.net_ccy AS override_net_ccy,
oecd.reinvestment_price_D AS override_reinvetsment_price,oecd.DRIP_ccy AS override_DRIP_ccy,oecd.DRIP_discount_D AS override_DRIP_discount,
oecd.DRIP_end_date AS override_DRIP_end_date,oecd.DRIP_start_date AS override_DRIP_start_date

FROM corp_actions_listing cal
LEFT JOIN event_cash_dividends ecd ON ecd.vendor_event_id= cal.vendor_event_id
LEFT JOIN event_dividends_rates edr ON edr.vendor_event_id = cal.vendor_event_id
LEFT JOIN event_stock_distribution sd ON sd.vendor_event_id=cal.vendor_event_id
LEFT JOIN event_distribution_cash_flow_set cfs ON cfs.vendor_event_id=cal.vendor_event_id
LEFT JOIN ultimate_cash_flow_set ucfs ON ucfs.cash_flow_set_id=cfs.cash_flow_set_id
LEFT JOIN corp_actions ca ON cal.vendor_event_id = ca.vendor_event_id
LEFT JOIN override_corp_actions oca ON oca.vendor_event_id = ca.vendor_event_id
LEFT JOIN precalc_cash_dividends pcd ON pcd.vendor_event_id=ca.vendor_event_id
LEFT JOIN override_event_cash_dividends oecd ON oecd.vendor_event_id=ca.vendor_event_id
LEFT JOIN override_event_distribution_cash_flow_set ocfs ON ocfs.vendor_event_id=ca.vendor_event_id

WHERE ca.source_id='TK' AND ucfs.parent_cfs_id='267952774' or ca.vendor_event_id='D_267952765'
