-- Import raw data
-- Check import worked

SELECT *
FROM CricketStats..TestInnings20thCentury

SELECT *
FROM CricketStats..TestInnings21stCentury;

-- Append the columns to each other via Union

SELECT *
FROM CricketStats..TestInnings20thCentury
UNION
SELECT *
FROM CricketStats..TestInnings21stCentury;

-- Not working, data type mismatch somewhere: 'Error converting data type nvarchar to float.'

-- Will go the long way

-- Delete record of all other players besides Ponting

DELETE 
FROM TestInnings20thCentury
WHERE Player <> 'RT Ponting'
DELETE 
FROM TestInnings21stCentury
WHERE Player <> 'RT Ponting'

-- Drop redundant columns

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [Innings Runs Scored]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [Innings Runs Scored]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [Innings Batted Flag]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [Innings Batted Flag]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [Country]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [Country]

-- Dropping all bowling stats columns as Ponting not primarily a bowler and we aren't interested in these stats

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [Innings Overs Bowled]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [Innings Overs Bowled]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [Innings Bowled Flag]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [Innings Bowled Flag]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [Innings Maidens Bowled]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [Innings Maidens Bowled]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [Innings Runs Conceded]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [Innings Runs Conceded]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [Innings Wickets Taken]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [Innings Wickets Taken]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [4 Wickets]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [4 Wickets]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [5 Wickets]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [5 Wickets]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [10 Wickets]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [10 Wickets]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [Innings Wickets Taken Buckets]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [Innings Wickets Taken Buckets]

ALTER TABLE CricketStats..TestInnings20thCentury
DROP COLUMN [Innings Economy Rate]
ALTER TABLE CricketStats..TestInnings21stCentury
DROP COLUMN [Innings Economy Rate]

-- Check data

SELECT *
FROM TestInnings20thCentury

SELECT *
FROM TestInnings21stCentury;

-- Edit our remaining column names and data types

SP_RENAME 'TestInnings20thCentury.Innings Player', 'Player'
SP_RENAME 'TestInnings21stCentury.Innings Player', 'Player'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Player VARCHAR(50)
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Player VARCHAR(50)

SP_RENAME 'TestInnings20thCentury.Innings Runs Scored Num', 'Runs_Scored'
SP_RENAME 'TestInnings21stCentury.Innings Runs Scored Num', 'Runs_Scored'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Runs_Scored INT
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Runs_Scored INT

SP_RENAME 'TestInnings20thCentury.Innings Minutes Batted', 'Minutes_Batted'
SP_RENAME 'TestInnings21stCentury.Innings Minutes Batted', 'Minutes_Batted'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Minutes_Batted INT
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Minutes_Batted INT

SP_RENAME 'TestInnings20thCentury.Innings Not Out Flag', 'Not_Out'
SP_RENAME 'TestInnings21stCentury.Innings Not Out Flag', 'Not_Out'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Not_Out INT
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Not_Out INT

SP_RENAME 'TestInnings20thCentury.Innings Balls Faced', 'Balls_Faced'
SP_RENAME 'TestInnings21stCentury.Innings Balls Faced', 'Balls_Faced'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Balls_Faced INT
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Balls_Faced INT

SP_RENAME 'TestInnings20thCentury.Innings Boundary Fours', 'Fours'
SP_RENAME 'TestInnings21stCentury.Sixes', 'Fours'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Fours INT
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Fours INT

SP_RENAME 'TestInnings20thCentury.Innings Boundary Sixes', 'Sixes'
SP_RENAME 'TestInnings21stCentury.Innings Boundary Sixes', 'Sixes'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Sixes INT
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Sixes INT

SP_RENAME 'TestInnings20thCentury.Innings Batting Strike Rate', 'Batting_Strike_Rate'
SP_RENAME 'TestInnings21stCentury.Innings Batting Strike Rate', 'Batting_Strike_Rate'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Batting_Strike_Rate DECIMAL(5,2)
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Batting_Strike_Rate DECIMAL(5,2)

SP_RENAME 'TestInnings20thCentury.Innings Number', 'Innings_No'
SP_RENAME 'TestInnings21stCentury.Innings Number', 'Innings_No'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Innings_No INT
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Innings_No INT

SP_RENAME 'TestInnings20thCentury.Innings Date', 'Date'
SP_RENAME 'TestInnings21stCentury.Innings Date', 'Date'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Date DATE
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Date DATE

SP_RENAME 'TestInnings20thCentury.Innings Runs Scored Buckets', 'Runs_Scored_Buckets'
SP_RENAME 'TestInnings21stCentury.Innings Runs Scored Buckets', 'Runs_Scored_Buckets'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN Runs_Scored_Buckets VARCHAR(20)
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN Runs_Scored_Buckets VARCHAR(20)

-- Remove apostrophes from column headers

SP_RENAME "TestInnings20thto21stTEST.50's", '50s'
SP_RENAME "TestInnings20thto21stTEST.[100's]", '100s'

ALTER TABLE CricketStats..TestInnings20thCentury
ALTER COLUMN [50s] INT
ALTER TABLE CricketStats..TestInnings21stCentury
ALTER COLUMN [100s] INT

-- Check data

SELECT *
FROM TestInnings20thCentury

SELECT *
FROM TestInnings21stCentury

-- Check for more data we can clean

SELECT *
FROM TestInnings20thCentury
WHERE Not_Out = 0 AND Runs_Scored = NULL
SELECT *
FROM TestInnings21stCentury
WHERE Not_Out = 0 AND Runs_Scored = NULL

DELETE 
FROM TestInnings20thCentury
WHERE Runs_Scored IS NULL
DELETE 
FROM TestInnings21stCentury
WHERE Runs_Scored IS NULL

-- Append tables together via Union, sort by Date

SELECT * INTO TestInnings20thto21st
FROM TestInnings20thCentury
UNION
SELECT * FROM TestInnings21stCentury
ORDER BY 'Date';

-- Export from SQL