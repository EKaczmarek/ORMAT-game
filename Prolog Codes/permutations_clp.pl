% Predykat ten generuje wszystkie kombinacje ciągu [0.. N].
generuj_ciagi(N , X) : -
	ciag_bazowy(N , B) ,
	length(X , N ),
	kombinacja(X , B ).