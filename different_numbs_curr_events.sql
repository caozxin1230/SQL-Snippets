USE corp_actions_db;

GO

 

SELECT * FROM

 

(SELECT

 

 ucfs.parent_cfs_id AS parent_cfs_id,

 edcfs.cash_flow_set_id AS cash_flow_set_id,

 ecd.gross_ccy AS gross_ccy,

 MAX(ecd.vendor_event_id) AS vendor_event_id,

 COUNT(gross_ccy) AS num_ccy,

 MAX(ca.event_id) AS event_id

 FROM ultimate_cash_flow_set AS ucfs

 INNER JOIN event_distribution_cash_flow_set AS edcfs ON ucfs.cash_flow_set_id = edcfs.cash_flow_set_id

 INNER JOIN event_cash_dividends AS ecd ON edcfs.vendor_event_id = ecd.vendor_event_id AND edcfs.source_id = ecd.source_id

 INNER JOIN corp_actions ca ON ca.vendor_event_id=ecd.vendor_event_id

 WHERE edcfs.composition_type = 1 AND gross_ccy IS NOT NULL AND ca.status='A'

 GROUP BY ucfs.parent_cfs_id, edcfs.cash_flow_set_id, ecd.gross_ccy) AS cfs_res_1

 

JOIN

 

(SELECT

 ucfs.parent_cfs_id AS parent_cfs_id,

 edcfs.cash_flow_set_id AS cash_flow_set_id,

 ecd.gross_ccy AS gross_ccy,

 MAX(ecd.vendor_event_id) AS vendor_event_id,

 COUNT(gross_ccy) AS num_ccy,

 MAX(ca.event_id) AS event_id

 FROM ultimate_cash_flow_set AS ucfs

 INNER JOIN event_distribution_cash_flow_set AS edcfs ON ucfs.cash_flow_set_id = edcfs.cash_flow_set_id

 INNER JOIN event_cash_dividends AS ecd ON edcfs.vendor_event_id = ecd.vendor_event_id AND edcfs.source_id = ecd.source_id

 INNER JOIN corp_actions ca ON ca.vendor_event_id=ecd.vendor_event_id

 WHERE gross_ccy IS NOT NULL AND ca.status='A'

 GROUP BY ucfs.parent_cfs_id, edcfs.cash_flow_set_id, ecd.gross_ccy) AS cfs_res_2

 

 ON cfs_res_1.parent_cfs_id = cfs_res_2.parent_cfs_id AND cfs_res_1.cash_flow_set_id <> cfs_res_2.cash_flow_set_id AND cfs_res_1.num_ccy <> cfs_res_2.num_ccy AND cfs_res_1.gross_ccy != cfs_res_2.gross_ccy

 ORDER BY cfs_res_1.parent_cfs_id 
