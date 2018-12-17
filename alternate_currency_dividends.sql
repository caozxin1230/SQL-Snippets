 1.  
  SELECT DISTINCT TOP(100) [cash_flow_set_id],
        [vendor_event_id]
  FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set]

 2. 
  USE [corp_actions_db]
  SELECT DISTINCT TOP(100) cfs.cash_flow_set_id
      , cfs.vendor_event_id
  FROM [dbo].[event_distribution_cash_flow_set] AS cfs
  LEFT JOIN [dbo].[event_cash_dividends] AS ecd
  ON cfs.vendor_event_id = ecd.vendor_event_id

	3. 
  USE [corp_actions_db]
  SELECT DISTINCT TOP(100) cfs.cash_flow_set_id
  , ecd.* 
  FROM [dbo].[event_distribution_cash_flow_set] AS cfs
  LEFT JOIN [dbo].[event_cash_dividends] AS ecd
  ON cfs.vendor_event_id = ecd.vendor_event_id



	4. 
USE [corp_actions_db]
SELECT *
FROM [dbo].[corp_actions] AS ca
LEFT 
JOIN [dbo].[event_distribution_cash_flow_set] AS cfs
ON ca.vendor_event_id = cfs.vendor_event_id
WHERE 
cfs.default_cash_flow = 'Y' AND ca.status != 'S'

JOIN [dbo].[event_distribution_cash_flow_set] AS cfs
ON ca.vendor_event_id = cfs.vendor_event_id
WHERE 
cfs.default_cash_flow = 'N' AND ca.status = 'S'

	5. 
	
	
CREATE VIEW ALTcurr
AS

USE [corp_actions_db]
SELECT *
FROM [dbo].[corp_actions] AS ca
LEFT 
JOIN [dbo].[event_distribution_cash_flow_set] AS cfs
ON ca.vendor_event_id = cfs.vendor_event_id
WHERE 
cfs.default_cash_flow = 'Y' AND ca.status != 'S'
UNION ALL
SELECT *
FROM [dbo].[corp_actions] AS ca
LEFT
JOIN [dbo].[event_distribution_cash_flow_set] AS cfs
ON ca.vendor_event_id = cfs.vendor_event_id
WHERE 
cfs.default_cash_flow = 'N' AND ca.status = 'S'
