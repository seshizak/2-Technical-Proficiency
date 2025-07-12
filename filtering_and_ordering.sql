SELECT campaign_id, campaign_name
FROM Campaigns
WHERE start_date >= '2025-06-01' AND start_date <= '2025-06-30'
  AND budget > 5000
ORDER BY budget DESC;
