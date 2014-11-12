nonCardiacPhenomenon(john).
nonCardiacPhenomenon(mile).
CardiacPhenomenon(simone).

CardiacPhenomenon(X) :- CoronaryArteryDisease(X) , not
    nonCardiacPhenomenon(X).
CoronaryArteryDisease(X) :- AnginaPectoris(X).