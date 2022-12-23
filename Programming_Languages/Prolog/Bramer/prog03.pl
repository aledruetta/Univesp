person(john).
person(mary).
person(steve).
dog(fido).
dog(bark).
dog(laika).
cat(kitty).
owns(john, fido).
owns(john, kitty).
owns(mary, kitty).
owns(steve, bark).
owns(steve, laika).
owns(laika, steve).
owns(kitty, fido).
animal(X):-cat(X).
animal(X):-dog(X).