CREATE TABLE "Team table"(
    "id" BIGINT NOT NULL,
    "team_name" TEXT NOT NULL,
    "team_points" BIGINT NOT NULL
);
ALTER TABLE
    "Team table" ADD PRIMARY KEY("id");
CREATE TABLE "Goals"(
    "id" BIGINT NOT NULL,
    "goal_id" BIGINT NOT NULL,
    "player_id" BIGINT NOT NULL,
    "game_id" BIGINT NOT NULL
);
ALTER TABLE
    "Goals" ADD PRIMARY KEY("id");
CREATE TABLE "Players"(
    "id" BIGINT NOT NULL,
    "player_name" TEXT NOT NULL,
    "team_id" BIGINT NOT NULL
);
ALTER TABLE
    "Players" ADD PRIMARY KEY("id");
CREATE TABLE "Referees"(
    "id" BIGINT NOT NULL,
    "referee_name" TEXT NOT NULL
);
ALTER TABLE
    "Referees" ADD PRIMARY KEY("id");
CREATE TABLE "Matches"(
    "id" BIGINT NOT NULL,
    "team_1_id" BIGINT NOT NULL,
    "team_2_id" BIGINT NOT NULL
);
ALTER TABLE
    "Matches" ADD PRIMARY KEY("id");
ALTER TABLE
    "Matches" ADD CONSTRAINT "matches_team_1_id_unique" UNIQUE("team_1_id");
ALTER TABLE
    "Matches" ADD CONSTRAINT "matches_team_2_id_unique" UNIQUE("team_2_id");
CREATE TABLE "Game_referee"(
    "id" BIGINT NOT NULL,
    "referee_id" BIGINT NOT NULL,
    "match_id" BIGINT NOT NULL
);
ALTER TABLE
    "Game_referee" ADD PRIMARY KEY("id");
ALTER TABLE
    "Game_referee" ADD CONSTRAINT "game_referee_referee_id_unique" UNIQUE("referee_id");
ALTER TABLE
    "Game_referee" ADD CONSTRAINT "game_referee_match_id_unique" UNIQUE("match_id");
CREATE TABLE "Season Table"(
    "id" BIGINT NOT NULL,
    "season_name" TEXT NOT NULL,
    "start_date" BIGINT NOT NULL,
    "end_date" BIGINT NOT NULL
);
ALTER TABLE
    "Season Table" ADD PRIMARY KEY("id");
CREATE TABLE "Team Standing"(
    "id" BIGINT NOT NULL,
    "team_id" BIGINT NOT NULL,
    "season_id" BIGINT NOT NULL,
    "wins" BIGINT NOT NULL,
    "losses" BIGINT NOT NULL,
    "draws" BIGINT NOT NULL,
    "goals_for" BIGINT NOT NULL,
    "goals_against" BIGINT NOT NULL,
    "points" BIGINT NOT NULL
);
ALTER TABLE
    "Team Standing" ADD PRIMARY KEY("id");
ALTER TABLE
    "Matches" ADD CONSTRAINT "matches_team_2_id_foreign" FOREIGN KEY("team_2_id") REFERENCES "Team table"("id");
ALTER TABLE
    "Goals" ADD CONSTRAINT "goals_game_id_foreign" FOREIGN KEY("game_id") REFERENCES "Matches"("id");
ALTER TABLE
    "Game_referee" ADD CONSTRAINT "game_referee_referee_id_foreign" FOREIGN KEY("referee_id") REFERENCES "Referees"("id");
ALTER TABLE
    "Team Standing" ADD CONSTRAINT "team standing_season_id_foreign" FOREIGN KEY("season_id") REFERENCES "Season Table"("id");
ALTER TABLE
    "Matches" ADD CONSTRAINT "matches_team_1_id_foreign" FOREIGN KEY("team_1_id") REFERENCES "Team table"("id");
ALTER TABLE
    "Game_referee" ADD CONSTRAINT "game_referee_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "Matches"("id");
ALTER TABLE
    "Goals" ADD CONSTRAINT "goals_player_id_foreign" FOREIGN KEY("player_id") REFERENCES "Players"("id");
ALTER TABLE
    "Team Standing" ADD CONSTRAINT "team standing_team_id_foreign" FOREIGN KEY("team_id") REFERENCES "Team table"("id");
ALTER TABLE
    "Players" ADD CONSTRAINT "players_team_id_foreign" FOREIGN KEY("team_id") REFERENCES "Team table"("id");