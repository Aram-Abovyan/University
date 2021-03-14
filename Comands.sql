-- get average result per course



-- get students that have maximum result in each course

Select results.course_id, results.student_id, results.result
From "public"."results"
Join
(
    Select  course_id, Max(result) As "result"
    From "public"."results"
    Group By course_id
) D On results.result = D.result And results.course_id = D.course_id ORDER BY results.course_id