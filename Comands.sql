-- get average result per course

select course_id, AVG(result) AS "Average Result"
from "public"."results"
GROUP BY course_id
ORDER BY course_id

-- get students that have maximum result in each course

Select results.course_id, results.student_id, results.result
From "public"."results"
Join
(
    Select  course_id, Max(result) As "result"
    From "public"."results"
    Group By course_id
) D On results.result = D.result And results.course_id = D.course_id
ORDER BY results.course_id

-- get first 10 students per course that get highest results

SELECT
  *
FROM
  "public"."results" a
WHERE (
  SELECT
    COUNT(5)
  FROM
    "public"."results"
  WHERE
    course_id = a.course_id
  AND
    result >= a.result
) <= 10
ORDER BY course_id