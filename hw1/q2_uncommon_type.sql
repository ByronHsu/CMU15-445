WITH rankTable AS (
    SELECT *, RANK() OVER (PARTITION BY type ORDER BY runtime_minutes DESC) AS rank FROM titles
)
SELECT type, primary_title, runtime_minutes FROM rankTable WHERE rank = 1 ORDER BY type ASC, primary_title ASC;