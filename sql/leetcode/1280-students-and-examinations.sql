-- Platform:   LeetCode 1280
-- Title:      Students and Examinations
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/students-and-examinations/
-- Solved:     2026-09-30
-- Hint used:  no
-- Redo:       no
-- Pattern:    CROSS JOIN to build every (student, subject) pair, then LEFT JOIN facts + COUNT
-- Time:       O(s*j + e) plus sorting: s*j pairs from the cross join, each matched to its exam rows, then grouped and ordered
-- Space:      O(s*j + e) for the pair grid and joined rows
-- Trap:       COUNT(e.subject_name), not COUNT(*): unmatched pairs have one NULL row and must show 0; without the CROSS JOIN, subjects a student never took disappear
-- Dialect:    MySQL (accepted on LeetCode)

SELECT s.student_id, s.student_name, sub.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students AS s
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS e
       ON e.student_id = s.student_id
      AND e.subject_name = sub.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
