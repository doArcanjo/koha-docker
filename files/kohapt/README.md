# Order to execute the scripts
0 - Init 
1 - 010-authorised_values_categories.sql
2 - 020-auth_types.sql
3 - 030-authorised_values v2.sql
4 - 040-biblio_framework.sql
5 - 050-auth_tag_structure.sql
6 - 060-auth_subfield_structure.sql
7 - 070-marc_tag_structure.sql
8 - 080-marc_subfield_structure.sql
9 - 090-z3950 Servers.sql


# Set all the scripts into one
## BASH
cat sqlpt/*.sql > merged-file.sql

## Windows cmd
type sqlpt\*.sql > merged.sql