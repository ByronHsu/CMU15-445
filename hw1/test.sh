#!/bin/bash

fileArray=("q1_sample.sql" "q2_uncommon_type.sql" "q3_tv_vs_movie.sql" "q4_old_is_not_gold.sql" "q5_percentage.sql" "q6_dubbed_smash.sql" "q7_imdb_250.sql" "q8_number_of_actors.sql" "q9_movie_names.sql" "q10_genre_counts.sql")

for file in ${fileArray[*]}; do
    echo "Executing $file..."
    diff <(sqlite3 imdb-cmudb2019.db ".read $file") <(sqlite3 imdb-cmudb2019.db ".read ../hw1-sols/$file")
done