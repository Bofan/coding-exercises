/* A query to find the median value in a table column.
   HackerRank's "Weather Observation Station 20" problem.
 */

-- "A.COLUMN_NAME" is the smaller number, if there is an even amount of values.
-- "B.COLUMN_NAME" is the larger number, if there is an even amount of values.
-- Round the median to the thousandth's place.
SELECT FORMAT((A.COLUMN_NAME+B.COLUMN_NAME)/2,3)
FROM TABLE_NAME A, TABLE_NAME B
WHERE (
    SELECT COUNT(*)
    FROM TABLE_NAME
    /*
       Sub-queries can access the table variables declared in higher-level queries.
     */
    WHERE COLUMN_NAME < A.COLUMN_NAME) = (
    SELECT FLOOR(COUNT(*)/2)
    FROM TABLE_NAME)
AND (
    SELECT COUNT(*)
    FROM TABLE_NAME
    WHERE COLUMN_NAME > B.COLUMN_NAME) = (
    SELECT FLOOR(COUNT(*)/2)
    FROM TABLE_NAME);
