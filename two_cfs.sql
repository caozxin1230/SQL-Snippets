/* Link multiple CFS through the same regular_cfs_id or ultimate_cfs_id*/

SELECT DISTINCT TOP(50)*
FROM

(SELECT ucfs.parent_cfs_id, ucfs.composition_type AS parent_composition_type, ucfs.default_cash_flow AS parent_default_cash_flow,
ca.fds_id,cfs.cash_flow_set_id,cfs.composition_type,cal.ex_date,
ca.vendor_event_id,ca.event_id,ca.source_id,ca.event_type,ca.status,cfs.default_cash_flow,
ocfs.cash_flow_set_id AS overrride_cfs_id, ocfs.default_cash_flow AS override_default_cash_flow
FROM corp_actions ca
LEFT JOIN event_distribution_cash_flow_set cfs ON ca.vendor_event_id=cfs.vendor_event_id
LEFT JOIN ultimate_cash_flow_set ucfs ON ucfs.cash_flow_set_id=cfs.cash_flow_set_id OR ucfs.vendor_event_id=ca.vendor_event_id
LEFT JOIN corp_actions_listing cal ON cal.vendor_event_id=ca.vendor_event_id
LEFT JOIN override_event_distribution_cash_flow_set ocfs ON ocfs.vendor_event_id=ca.vendor_event_id OR ocfs.cash_flow_set_id=cfs.cash_flow_set_id
WHERE cal.ex_date>'2013-12-31'AND ca.source_id='TK' AND ca.event_type='DVC' and cfs.default_cash_flow ='Y' AND cfs.composition_type='2'
AND ca.event_id IS NOT NULL AND ca.status='A') AS cf_1

INNER JOIN

(SELECT ucfs.parent_cfs_id, ucfs.composition_type AS parent_composition_type, ucfs.default_cash_flow AS parent_default_cash_flow,
ca.fds_id,cfs.cash_flow_set_id,cfs.composition_type,cal.ex_date,
ca.vendor_event_id,ca.event_id,ca.source_id,ca.event_type,ca.status,cfs.default_cash_flow,
ocfs.cash_flow_set_id AS overrride_cfs_id, ocfs.default_cash_flow AS override_default_cash_flow
FROM corp_actions ca
LEFT JOIN event_distribution_cash_flow_set cfs ON ca.vendor_event_id=cfs.vendor_event_id
LEFT JOIN ultimate_cash_flow_set ucfs ON ucfs.cash_flow_set_id=cfs.cash_flow_set_id OR ucfs.vendor_event_id=ca.vendor_event_id
LEFT JOIN corp_actions_listing cal ON cal.vendor_event_id=ca.vendor_event_id
LEFT JOIN override_event_distribution_cash_flow_set ocfs ON ocfs.vendor_event_id=ca.vendor_event_id OR ocfs.cash_flow_set_id=cfs.cash_flow_set_id
LEFT JOIN event_cash_dividends ecd ON ecd.vendor_event_id=ca.vendor_event_id
WHERE cal.ex_date>'2013-12-31'AND ca.source_id='TK' AND ca.event_type='DRIP' and cfs.default_cash_flow ='N' AND cfs.composition_type='2'
AND ca.event_id IS NOT NULL AND ca.status='A' AND ecd.reinvestment_price_D IS NOT NULL) AS cf_2

ON cf_1.vendor_event_id != cf_2.vendor_event_id AND cf_1.cash_flow_set_id=cf_2.cash_flow_set_id OR cf_1.parent_cfs_id=cf_2.parent_cfs_id
