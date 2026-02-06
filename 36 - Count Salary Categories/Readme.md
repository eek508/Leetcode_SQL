# [1907. Count Salary Categories](https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50)

Table: <code>Accounts</code>

```
+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+
account_id is the primary key (column with unique values) for this table.
Each row contains information about the monthly income for one bank account.
```

Write a solutionto calculate the number of bank accounts for each salary category. The salary categories are:

- <code>"Low Salary"</code>: All the salaries **strictly less**  than <code>$20000</code>.
- <code>"Average Salary"</code>: All the salaries in the **inclusive**  range <code>[$20000, $50000]</code>.
- <code>"High Salary"</code>: All the salaries **strictly greater**  than <code>$50000</code>.

The result table **must**  contain all three categories. If there are no accounts in a category,return<code>0</code>.

Return the result table in **any order** .

Theresult format is in the following example.

**Example 1:** 

```
Input: 
Accounts table:
+------------+--------+
| account_id | income |
+------------+--------+
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |
+------------+--------+
Output: 
+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+
Explanation: 
Low Salary: Account 2.
Average Salary: No accounts.
High Salary: Accounts 3, 6, and 8.
```
