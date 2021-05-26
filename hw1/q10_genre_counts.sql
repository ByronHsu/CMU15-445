WITH RECURSIVE split (title_id, genre, rest) AS (
    SELECT title_id, "", genres || "," FROM titles WHERE genres != "\N"-- initial select
    UNION ALL
    -- recursive select
    SELECT title_id, SUBSTR(rest, 1, INSTR(rest, ",")-1), SUBSTR(rest, INSTR(rest, ",")+1) FROM split WHERE rest != "" -- pretend there is only one row in recursive table
)
SELECT genre, COUNT(*) as count FROM split WHERE genre != "" GROUP BY genre ORDER BY count DESC;