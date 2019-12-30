# Bank Management App

* http://bank.in

## Features
 * customers should be able to view all the branches
 
### Feature 1:List all branches
```sql
  create table banks(
  branch_name varchar2(50) primary key,
  branch_city varchar2(60)
  );
  ```

Query:
```sql
  select * from banks;
  ```
