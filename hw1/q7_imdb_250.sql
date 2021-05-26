WITH 
    weightedAverageRating (war) AS (
        SELECT SUM(votes * rating) / SUM(votes) 
        FROM ratings
        INNER JOIN titles
        ON ratings.title_id == titles.title_id and titles.type == "movie"
    ),
    minimumVotes (mv) AS (
        SELECT 25000.0
    )
SELECT primary_title, (votes/(votes+mv)) * (rating) + (mv/(votes+mv)) * war as wr -- title_id is PK in ratings, so we do not need to group by title_id
FROM ratings, minimumVotes, weightedAverageRating
INNER JOIN titles
ON ratings.title_id == titles.title_id and titles.type == "movie"
ORDER BY wr DESC
LIMIT 250;