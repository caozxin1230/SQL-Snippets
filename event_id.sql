USE corp_actions_db
GO

SELECT ca.vendor_event_id,ca.event_id
FROM corp_actions ca
WHERE  ca.event_type='DVC' AND ca.source_id ='PRICE'
AND ca.event_id ='FCA_EID_B00BPC-S_B00BPC-S_20170329_DVC_JP_6'

SELECT ca.vendor_event_id, ca.event_id, COUNT(ca.event_id) 
FROM corp_actions ca
LEFT JOIN event_cash_dividends ecd ON ecd.vendor_event_id=ca.vendor_event_id
INNER JOIN event_dividends_rates edr ON edr.vendor_event_id=ca.vendor_event_id
INNER JOIN precalc_cash_dividends pcd ON pcd.vendor_event_id=ca.vendor_event_id
LEFT JOIN corp_actions_listing cal ON cal.vendor_event_id =ca.vendor_event_id
LEFT JOIN event_distribution_cash_flow_set cfs ON cfs.vendor_event_id=ca.vendor_event_id
LEFT JOIN override_event_distribution_cash_flow_set ocfs ON ocfs.vendor_event_id = ca.vendor_event_id
WHERE ca.event_type='DVC' AND ocfs.vendor_event_id IS NULL ---no override
AND ca.source_id ='PRICE' AND cfs.vendor_event_id IS NULL ---no cfs 
AND ca.announcement_date>'2009-01-01'
GROUP BY ca.vendor_event_id,ca.event_id
HAVING (COUNT(ca.event_id) > 2 ) 
ORDER BY ca.event_id