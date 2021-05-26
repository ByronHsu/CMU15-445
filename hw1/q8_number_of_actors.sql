With 
    MarkHamill (mark_id) AS (
        SELECT person_id FROM people WHERE name == "Mark Hamill" AND born == 1951
    ),
    MarkTitles (mark_title_id) AS (
        SELECT title_id FROM MarkHamill, crew WHERE person_id == mark_id -- use previous CTE
    )
SELECT COUNT(DISTINCT person_id) FROM crew WHERE (title_id IN MarkTitles) AND (category == "actor" OR category == "actress");
