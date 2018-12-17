
----------------------------------------------- Begin Script
DECLARE @vendor_event_id VARCHAR(50);  
 
 
------------------ Change vendor_event_id below
SET @vendor_event_id='D_196498150';
------------------ Change vendor_event_id above
 
 
DECLARE @all_related_vendor_event_ids TABLE (vendor_event_id VARCHAR(50));
DECLARE @all_related_event_ids TABLE (event_id VARCHAR(50));
 
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) VALUES (@vendor_event_id)
 
 DECLARE @all_cash_flow_sets TABLE (cfs_id VARCHAR(50));
DECLARE @ult_cf_1 TABLE (cfs_id VARCHAR(50));
DECLARE @ult_cf_2 TABLE (cfs_id VARCHAR(50));
DECLARE @ult_cf_3 TABLE (cfs_id VARCHAR(50));
DECLARE @ult_cf_4 TABLE (cfs_id VARCHAR(50));
DECLARE @ult_cf_5 TABLE (cfs_id VARCHAR(50));
 
INSERT INTO @all_related_vendor_event_ids(vendor_event_id)(SELECT vendor_event_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE vendor_event_id=@vendor_event_id)
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE vendor_event_id=@vendor_event_id)
  
 INSERT INTO @ult_cf_1(cfs_id) (SELECT parent_cfs_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE cash_flow_set_id IN (SELECT * FROM @all_cash_flow_sets) OR vendor_event_id in (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE parent_cfs_id IN (SELECT * FROM @ult_cf_1) AND vendor_event_id IS NOT NULL and vendor_event_id <> '')
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE parent_cfs_id IN (SELECT * FROM @ult_cf_1) AND cash_flow_set_id IS NOT NULL and cash_flow_set_id <> '')
INSERT INTO @all_related_vendor_event_ids(vendor_event_id)(SELECT vendor_event_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE cash_flow_set_id in (SELECT * FROM @all_cash_flow_sets))
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_event_ids(event_id) (SELECT event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE event_id IN (SELECT * FROM @all_related_event_ids))
 
INSERT INTO @ult_cf_2(cfs_id) (SELECT parent_cfs_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE cash_flow_set_id IN (SELECT * FROM @all_cash_flow_sets) OR vendor_event_id in (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE parent_cfs_id IN (SELECT * FROM @ult_cf_2) AND vendor_event_id IS NOT NULL and vendor_event_id <> '')
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE parent_cfs_id IN (SELECT * FROM @ult_cf_2) AND cash_flow_set_id IS NOT NULL and cash_flow_set_id <> '')
INSERT INTO @all_related_vendor_event_ids(vendor_event_id)(SELECT vendor_event_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE cash_flow_set_id in (SELECT * FROM @all_cash_flow_sets))
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_event_ids(event_id) (SELECT event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE event_id IN (SELECT * FROM @all_related_event_ids))
 
 
 INSERT INTO @ult_cf_3(cfs_id) (SELECT parent_cfs_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE cash_flow_set_id IN (SELECT * FROM @all_cash_flow_sets) OR vendor_event_id in (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE parent_cfs_id IN (SELECT * FROM @ult_cf_3) AND vendor_event_id IS NOT NULL and vendor_event_id <> '')
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE parent_cfs_id IN (SELECT * FROM @ult_cf_3) AND cash_flow_set_id IS NOT NULL and cash_flow_set_id <> '')
INSERT INTO @all_related_vendor_event_ids(vendor_event_id)(SELECT vendor_event_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE cash_flow_set_id in (SELECT * FROM @all_cash_flow_sets))
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_event_ids(event_id) (SELECT event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE event_id IN (SELECT * FROM @all_related_event_ids))
 
 
 INSERT INTO @ult_cf_4(cfs_id) (SELECT parent_cfs_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE cash_flow_set_id IN (SELECT * FROM @all_cash_flow_sets) OR vendor_event_id in (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE parent_cfs_id IN (SELECT * FROM @ult_cf_4) AND vendor_event_id IS NOT NULL and vendor_event_id <> '')
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE parent_cfs_id IN (SELECT * FROM @ult_cf_4) AND cash_flow_set_id IS NOT NULL and cash_flow_set_id <> '')
INSERT INTO @all_related_vendor_event_ids(vendor_event_id)(SELECT vendor_event_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE cash_flow_set_id in (SELECT * FROM @all_cash_flow_sets))
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_event_ids(event_id) (SELECT event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE event_id IN (SELECT * FROM @all_related_event_ids))
 
 
 INSERT INTO @ult_cf_5(cfs_id) (SELECT parent_cfs_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE cash_flow_set_id IN (SELECT * FROM @all_cash_flow_sets) OR vendor_event_id in (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE parent_cfs_id IN (SELECT * FROM @ult_cf_5) AND vendor_event_id IS NOT NULL and vendor_event_id <> '')
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE parent_cfs_id IN (SELECT * FROM @ult_cf_5) AND cash_flow_set_id IS NOT NULL and cash_flow_set_id <> '')
INSERT INTO @all_related_vendor_event_ids(vendor_event_id)(SELECT vendor_event_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE cash_flow_set_id in (SELECT * FROM @all_cash_flow_sets))
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_event_ids(event_id) (SELECT event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE event_id IN (SELECT * FROM @all_related_event_ids))
 
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE cash_flow_set_id IN (SELECT * FROM @all_cash_flow_sets))
INSERT INTO @all_cash_flow_sets(cfs_id) (SELECT cash_flow_set_id FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_event_ids(event_id) (SELECT event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids))
INSERT INTO @all_related_vendor_event_ids(vendor_event_id) (SELECT vendor_event_id FROM [corp_actions_db].[dbo].[corp_actions] WHERE event_id IN (SELECT * FROM @all_related_event_ids))
 
  -- Now display actual table data from corp_actions, event_distribution_cash_flow_set and ultimate_cash_flow_set
SELECT * FROM [corp_actions_db].[dbo].[corp_actions] WHERE vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids)
SELECT * FROM [corp_actions_db].[dbo].[event_distribution_cash_flow_set] WHERE cash_flow_set_id in (SELECT * FROM @all_cash_flow_sets)
SELECT * FROM [corp_actions_db].[dbo].[ultimate_cash_flow_set] WHERE cash_flow_set_id in (SELECT * FROM @all_cash_flow_sets) OR vendor_event_id IN (SELECT * FROM @all_related_vendor_event_ids)
 
----------------------------------------------- End Script
