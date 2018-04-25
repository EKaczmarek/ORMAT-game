sum2([],[],[]).
sum2([H|T],[H1|T1],[H2|T2]):- 
                 H2 is H+H1,
                 sum2(T,T1,T2).