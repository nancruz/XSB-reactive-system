AdmissibleImporter(X) :- ShpmtImporter(Y,X), not SuspectedBadGuy(X).
SuspectedBadGuy(i1).
ApprovedImporterOf(i2,X) :- EdibleVegetable(X).
ApprovedImporterOf(i3,X) :- GrapeTomato(X).
CommodCountry(X,Y) :- ShpmtCommod(Z,X),ShpmtCountry(Z,Y).
ExpeditableImporter(X,Y) :- ShpmtCommod(Z,X), ShpmtImporter(Z,Y), AdmissibleImporter(Y),ApprovedImporterOf(Y,X).
CompliantShpmt(X) :- ShpmtCommod(X,Y), HTSCode(Y,Z), ShpmtDeclHTSCode(X,Z).
Random(X) :- ShpmtCommod(X,Y), not Random(X).
NoInspection(X) :- ShpmtCommod(X,Y), CommodCountry(Y,Z), EUCountry(Z).
Inspection(X) :- ShpmtCommod(X,Y), not NoInspection(X), Random(X).
Inspection(X) :- ShpmtCommod(X,Y), not CompliantShpmt(X).
Inspection(X) :- ShpmtCommod(X,Y), Tomato(Y), ShpmtCountry(X,slovakia).
HTSChapter(X,7) :- EdibleVegetable(X).
HTSHeading(X,702) :- Tomato(X).
HTSCode(X, h7022) :- CherryTomato(X).
HTSCode(X, h7021) :- GrapeTomato(X).
TariffCharge(X,0) :- CherryTomato(X), Bulk(X).
TariffCharge(X,40) :- GrapeTomato(X), Bulk(X).
TariffCharge(X,50) :- CherryTomato(X), Prepackaged(X).
TariffCharge(X,100) :- GrapeTomato(X), Prepackaged(X).
