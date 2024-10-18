-- Create the schema
CREATE schema stackoverflow_filtered;

-- Set the search path to the newly created schema
SET search_path TO stackoverflow_filtered;

-- Create the results table
CREATE TABLE "results" (
    "user_id" int4,
    "display_name" text,
    "views" int4,
    "reputation" text,
    "updated_at" text,
    "created_at" text,
    "location" text,
    "city" text,
    "country" text,
    "questions_id" int4,
    "question_user_id" int4,
    "title" text,
    "body" text,
    "accepted_answer_id" int4,
    "score" int4,
    "view_count" int4,
    "comment_count" int4,
    "questions_created_at" text,
    "answer_id" int4,
    "answer_user_id" int4,
    "question_id" int4,
    "answers_body" text,
    "answers_score" int4,
    "answers_comment_count" int4,
    "answers_created_at" text
);

-- Create a btree index on the reputation column within the results table
CREATE INDEX reputation_idx ON results (reputation);

-- Create a hash index on the display_name column within the results table
CREATE INDEX display_name_idx ON results USING hash (display_name);

-- Create a view
CREATE VIEW results_view AS 
    SELECT results.display_name, city, questions_id
    FROM results
    WHERE accepted_answer_id IS NOT NULL;

-- Create a materialized view 
CREATE MATERIALIZED VIEW results_view1 AS 
    SELECT results.display_name, city, questions_id
    FROM results
    WHERE accepted_answer_id IS NOT NULL;
