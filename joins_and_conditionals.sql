-- Goal: Show total campaign performance per advertiser, including advertisers who might not have campaigns or metrics yet.
-- I'm using LEFT JOINs so I don't miss advertisers with no campaigns or campaigns with no metrics.
-- COALESCE is used to replace NULLs with 0 for impressions, clicks, and spend, which helps avoid confusion or calculation errors.
-- Filtering by the given list of advertiser IDs.
-- Grouping by advertiser and campaign so the totals are calculated correctly.
-- Finally, sorting by impressions and spend to highlight the most active campaigns first.

SELECT 
  a.advertiser_id,
  c.campaign_id,
  c.campaign_name,
  COALESCE(SUM(m.impressions), 0) AS total_impressions,
  COALESCE(SUM(m.clicks), 0) AS total_clicks,
  COALESCE(SUM(m.spend), 0) AS total_spend
FROM Advertisers a
LEFT JOIN Campaigns c ON a.advertiser_id = c.advertiser_id
LEFT JOIN AdMetrics m ON c.campaign_id = m.campaign_id
WHERE a.advertiser_id IN ('ADV-111', 'ADV-222', 'ADV-333')
GROUP BY a.advertiser_id, c.campaign_id, c.campaign_name
ORDER BY total_impressions DESC, total_spend DESC;
