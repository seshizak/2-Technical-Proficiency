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
