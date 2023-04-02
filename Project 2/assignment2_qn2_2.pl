/* define genders of individuals */
female(queen_elizabeth).
female(princess_ann).
male(prince_charles).
male(prince_andrew).
male(prince_edward).

/* define the parent-child relationships */
parent_of(queen_elizabeth, prince_charles).
parent_of(queen_elizabeth, princess_ann).
parent_of(queen_elizabeth, prince_andrew).
parent_of(queen_elizabeth, prince_edward).

/* define order of birth of siblings */
older_than(prince_charles, princess_ann).
older_than(princess_ann, prince_andrew).
older_than(prince_andrew, prince_edward).

/* define transitive relationship between birth order */
is_older(X,Y):- older_than(X,Y).
is_older(X,Y):- older_than(X,Z), is_older(Z,Y).

/* helper function to sort list of members in new order of succession */
insert(A,[B|C],[B|D]):- not(is_older(A,B)),!,insert(A,C,D).
insert(A,C,[A|C]).

/* function to sort list of members */
new_succession_sort([A|B],SortList):- new_succession_sort(B,Tail), insert(A,Tail,SortList).
new_succession_sort([],[]).

/* main function to generate list of members in new line of succession */
newRoyalSuccessionList(X,SuccessionList):- findall(Y,parent_of(X,Y),Child), new_succession_sort(Child,SuccessionList).

