WITH
    joinTable AS (
        SELECT * FROM titles INNER JOIN akas ON titles.title_id = akas.title_id
    )
SELECT primary_title, COUNT(*) as count FROM joinTable GROUP BY title_id ORDER BY count DESC LIMIT 10;