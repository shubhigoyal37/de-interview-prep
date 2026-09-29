# de-interview-prep: working rules

This repo holds my own SQL and Python interview-practice solutions.

## Adding a solution
When I paste a solution and say "add this":
1. Copy the matching template from templates/ into the right folder:
   sql/leetcode, sql/datalemur, sql/stratascratch, python/leetcode, python/hackerrank, python/exercism.
2. Name the file <4-digit number>-<kebab-case-title>.<ext>, e.g. 0178-rank-scores.sql.
   For platforms without problem numbers, use the kebab-case title only.
3. Fill the header from what I give you: platform and number, title, difficulty, link, date solved (today unless I say otherwise), hint used, redo. If hint used is yes, set redo to yes.
4. Pattern, Time/Space complexity and Trap are mine to write. If I didn't give them, ask me. Never fill them in yourself.
5. SQL: keep the query exactly as I pasted it (the MySQL version accepted on LeetCode). If I mention a SQL Server difference, put it on the Dialect line.
6. Python: keep my code exactly as pasted. Add asserts under `if __name__ == "__main__":` only from examples I provide.
7. Append a row to the Index table in README.md.
8. Commit with a message like "sql: LC 178 rank scores" or "py: LC 136 single number", then push.

## Don't
- Don't rewrite, optimize or "fix" my solutions unless I ask.
- Don't edit pattern-cards.md unless I ask.
- Don't force-push or rewrite history.
