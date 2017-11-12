/* There are two ways to 
write comments in prolog. 
This is one way */
% Single line comments use a percent and terminate on EOL
% 

hand(item).
color(item,red).


color(red).
ate(joe, salad).
ate(jill, hamburger).
ate(albert, hamburger).

fruit(apple) :- color(red).
full(X)      :- ate(X, hamburger).