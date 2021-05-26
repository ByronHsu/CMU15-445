WITH 
    decadeTable AS (
        SELECT SUBSTR(premiered, 1, 3) || "0s"  AS decade, * FROM titles WHERE premiered IS NOT NULL
    ),
    countTable (totalCount) AS (
        SELECT COUNT(*) FROM titles
    )
SELECT A.decade, ROUND(100 * CAST(COUNT(A.title_id) AS REAL) / CAST(B.totalCount AS REAL), 4) AS perc FROM decadeTable as A, countTable as B GROUP BY A.decade ORDER BY perc DESC;