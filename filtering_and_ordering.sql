-- Goal: Find campaigns that started in June 2025 with a high budget.
-- I’m filtering based on the date range for June and only including campaigns with a budget over 5000.
-- I'm also ordering the results from highest to lowest budget to prioritize bigger campaigns.

SELECT campaign_id, campaign_name
FROM Campaigns
WHERE start_date >= '2025-06-01' AND start_date <= '2025-06-30'
  AND budget > 5000
ORDER BY budget DESC;
