-- Goal: Show total campaign performance per advertiser, including advertisers who might not have campaigns or metrics yet.
-- I'm using LEFT JOINs so I don't miss advertisers with no campaigns or campaigns with no metrics.
-- COALESCE is used to replace NULLs with 0 for impressions, clicks, and spend, which helps avoid confusion or calculation errors.
-- Filtering by the given list of advertiser IDs.
-- Grouping by advertiser and campaign so the totals are calculated correctly.
-- Finally, sorting by impressions and spend to highlight the most active campaigns first.
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
