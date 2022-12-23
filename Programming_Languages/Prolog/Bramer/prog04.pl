capital(london, england). capital('buenos aires', argentina).
european(england):-write('God save de Queen!'),nl.
latam(argentina):-write('La mano de Dios!'),nl.
pred(City, 'european capital'):-capital(City, Country),european(Country),write(City),nl.
pred(City, 'latino capital'):-capital(City, Country),latam(Country),write(City),nl.
