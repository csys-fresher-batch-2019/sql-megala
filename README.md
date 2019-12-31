# Citibank Management App

* http://citibank.in

## Features
 * customers should be able to view all the branches
 
### Feature 1:List all branches
```sql
  create table branch(
  branch_id number,
  branch_name varchar2(50) not null,
  branch_city varchar2(60) not null,
  constraint branch_id_pk primary key(branch_id),
  constraint branch_name_uq unique(branch_name)
  );
  ```

Query:
```sql
  select * from branch;
  ```
