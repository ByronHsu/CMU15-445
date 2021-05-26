WITH 
    MIdTable (m_id) AS (
        SELECT person_id FROM people WHERE (name == "Mark Hamill" and born == 1951)
    ),
    GIdTable (g_id) AS (
        SELECT person_id FROM people WHERE (name == "George Lucas" and born == 1944)
    ),
    MGTitleTable (MG_title_id) AS (
        SELECT title_id FROM crew, MIdTable WHERE person_id == m_id
        INTERSECT
        SELECT title_id FROM crew, GIdTable WHERE person_id == g_id
    )
SELECT primary_title FROM titles WHERE title_id IN MGTitleTable AND type == "movie";
