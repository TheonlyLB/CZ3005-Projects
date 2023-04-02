company(sumsum).
company(appy).
smart_phone_technology(galactica_s3).
developed(sumsum, galactica_s3).
boss(stevey).
competitors(sumsum, appy).
steal(stevey, galactica_s3).

rival(X) :- competitors(X, appy).
business(X) :- smart_phone_technology(X).
unethical(Boss) :- boss(Boss), business(Tech), company(Y), rival(Y), steal(Boss, Tech), developed(Y, Tech).
