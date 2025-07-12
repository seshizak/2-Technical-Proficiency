-- Goal: Calculate CPC (Cost Per Click) for a few specific campaigns, broken down by device type.
-- I'm filtering by campaign_id and the June 2025 date range as requested.
-- CPC is calculated as total spend divided by total clicks.
-- I added a CASE WHEN to avoid division by zero if there are no clicks, and used ROUND to keep the result readable.
-- Grouping by both campaign_id and device_type so the CPC is broken down properly.
SELECT 
  campaign_id,
  device_type,
  CASE 
    WHEN SUM(clicks) = 0 THEN 0
    ELSE ROUND(SUM(spend) / SUM(clicks), 2)
  END AS cpc
FROM AdMetrics
WHERE campaign_id IN ('CID-ABC111', 'CID-ABC222', 'CID-ABC333')
  AND report_date BETWEEN '2025-06-01' AND '2025-06-30'
GROUP BY campaign_id, device_type;
