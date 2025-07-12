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
