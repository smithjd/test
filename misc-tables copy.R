# frequently used tables from the SDB
# all these data frames end in ".tbl"

# all are in-line except for "prog_codes_table.tsv"

library(readr)
member_type_tbl <- read_tsv('member_type_code	member_type
1	Non-member
2	Friend of Shambhala
3	Member
4	Ex-member
5	Temp. Inactive
6	Deceased
')

type_of_program.tbl <- read_tsv('program_id	program_name	program_sort_order
B	Other Buddhist Classes	4
C	Advanced Programs	5
D	Contemplative Arts & Disciplines	8
E	Other Events & Classes	99
F	Introductory Programs	1
G	Way of Shambhala	2
H	MI / Teacher Training / Gathering /Ritual Academy Training	6
I	Family & Children	7
J	Kasung	10
K	Feasts	11
L	Regular Events	100
N	Group Retreats	4
O	Sacred Path	0
P	Annual Celebrations and Community Events	0
Q	Practice Events	0
R	Vows	0
S	Leadership Program	0
')
