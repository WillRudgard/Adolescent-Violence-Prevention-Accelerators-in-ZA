* Save estimates of adjusted prevalence of SEXUAL abuse IN BOYS.
matrix B_SANothing = ( rC2[ 1 , ( 16 * 0 + 2 * 0 + 1 ) ] , rC2[ 5 , ( 16 * 0 + 2 * 0 + 1 ) ] , rC2[ 6 , ( 16 * 0 + 2 * 0 + 1 ) ] )
matrix B_SAFood = ( rC2[ 1 , ( 16 * 0 + 2 * 0 + 2 ) ] , rC2[ 5 , ( 16 * 0 + 2 * 0 + 2 ) ] , rC2[ 6 , ( 16 * 0 + 2 * 0 + 2 ) ] )
matrix B_SACMon = ( rC2[ 1 , ( 16 * 0 + 2 * 2 + 1 ) ] , rC2[ 5 , ( 16 * 0 + 2 * 2 + 1 ) ] , rC2[ 6 , ( 16 * 0 + 2 * 2 + 1 ) ] )
matrix B_SAPosP = ( rC2[ 1 , ( 16 * 0 + 2 * 4 + 1 ) ] , rC2[ 5 , ( 16 * 0 + 2 * 4 + 1 ) ] , rC2[ 6 , ( 16 * 0 + 2 * 4 + 1 ) ] )
matrix B_SACombo = ( rC2[ 1 , ( 16 * 0 + 2 * 6 + 2 ) ] , rC2[ 5 , ( 16 * 0 + 2 * 6 + 2 ) ] , rC2[ 6 , ( 16 * 0 + 2 * 6 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 1._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 1._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_SAratiob = r(b)
matrix B_SAratioV = r(V)
matrix B_SAratioSE = sqrt( B_SAratioV[1,1] )
matrix B_SAratiolb = B_SAratiob - 1.96 * B_SAratioSE
matrix B_SAratioub = B_SAratiob + 1.96 * B_SAratioSE
matrix B_SAratio1 = ( B_SAratiob , B_SAratiolb , B_SAratioub )  
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 1._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 1._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_SAdiff1 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 1._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 1._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_SAratiob = r(b)
matrix B_SAratioV = r(V)
matrix B_SAratioSE = sqrt( B_SAratioV[1,1] )
matrix B_SAratiolb = B_SAratiob - 1.96 * B_SAratioSE
matrix B_SAratioub = B_SAratiob + 1.96 * B_SAratioSE
matrix B_SAratio2 = ( B_SAratiob , B_SAratiolb , B_SAratioub )   
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 1._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 1._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_SAdiff2 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 1._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 1._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_SAratiob = r(b)
matrix B_SAratioV = r(V)
matrix B_SAratioSE = sqrt( B_SAratioV[1,1] )
matrix B_SAratiolb = B_SAratiob - 1.96 * B_SAratioSE
matrix B_SAratioub = B_SAratiob + 1.96 * B_SAratioSE
matrix B_SAratio3 = ( B_SAratiob , B_SAratiolb , B_SAratioub )  
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 1._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 1._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_SAdiff3 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 1._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 1._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_SAratiob = r(b)
matrix B_SAratioV = r(V)
matrix B_SAratioSE = sqrt( B_SAratioV[1,1] )
matrix B_SAratiolb = B_SAratiob - 1.96 * B_SAratioSE
matrix B_SAratioub = B_SAratiob + 1.96 * B_SAratioSE
matrix B_SAratio4 = ( B_SAratiob , B_SAratiolb , B_SAratioub )   
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 1._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 1._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_SAdiff4 = r(estimate) , r(lb) , r(ub) 

* Combine all SA matrices IN BOYS.
matrix B_SAcomb = ( B_SANothing \ B_SAPosP \ B_SAratio1 \ B_SAdiff1 \ B_SACMon \ B_SAratio2 \ B_SAdiff2 \ B_SAFood \ B_SAratio3 \ B_SAdiff3 \ B_SACombo \ B_SAratio4 \ B_SAdiff4 )
matrix list B_SAcomb

* Save estimates of predicted probability of SEXUAL abuse IN GIRLS 
matrix G_SANothing = ( rC2[ 1 , ( 16 * 0 + 2 * 1 + 1 ) ] , rC2[ 5 , ( 16 * 0 + 2 * 1 + 1 ) ] , rC2[ 6 , ( 16 * 0 + 2 * 1 + 1 ) ] )
matrix G_SAFood = ( rC2[ 1 , ( 16 * 0 + 2 * 1 + 2 ) ] , rC2[ 5 , ( 16 * 0 + 2 * 1 + 2 ) ] , rC2[ 6 , ( 16 * 0 + 2 * 1 + 2 ) ] )
matrix G_SACMon = ( rC2[ 1 , ( 16 * 0 + 2 * 3 + 1 ) ] , rC2[ 5 , ( 16 * 0 + 2 * 3 + 1 ) ] , rC2[ 6 , ( 16 * 0 + 2 * 3 + 1 ) ] )
matrix G_SAPosP = ( rC2[ 1 , ( 16 * 0 + 2 * 5 + 1 ) ] , rC2[ 5 , ( 16 * 0 + 2 * 5 + 1 ) ] , rC2[ 6 , ( 16 * 0 + 2 * 5 + 1 ) ] )
matrix G_SACombo = ( rC2[ 1 , ( 16 * 0 + 2 * 7 + 2 ) ] , rC2[ 5 , ( 16 * 0 + 2 * 7 + 2 ) ] , rC2[ 6 , ( 16 * 0 + 2 * 7 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 1._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 1._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_SAratiob = r(b)
matrix G_SAratioV = r(V)
matrix G_SAratioSE = sqrt( G_SAratioV[1,1] )
matrix G_SAratiolb = G_SAratiob - 1.96 * G_SAratioSE
matrix G_SAratioub = G_SAratiob + 1.96 * G_SAratioSE
matrix G_SAratio1 = ( G_SAratiob , G_SAratiolb , G_SAratioub )   
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 1._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 1._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_SAdiff1 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 1._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 1._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_SAratiob = r(b)
matrix G_SAratioV = r(V)
matrix G_SAratioSE = sqrt( G_SAratioV[1,1] )
matrix G_SAratiolb = G_SAratiob - 1.96 * G_SAratioSE
matrix G_SAratioub = G_SAratiob + 1.96 * G_SAratioSE
matrix G_SAratio2 = ( G_SAratiob , G_SAratiolb , G_SAratioub )  
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 1._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 1._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_SAdiff2 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 1._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 1._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_SAratiob = r(b)
matrix G_SAratioV = r(V)
matrix G_SAratioSE = sqrt( G_SAratioV[1,1] )
matrix G_SAratiolb = G_SAratiob - 1.96 * G_SAratioSE
matrix G_SAratioub = G_SAratiob + 1.96 * G_SAratioSE
matrix G_SAratio3 = ( G_SAratiob , G_SAratiolb , G_SAratioub )  
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 1._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 1._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_SAdiff3 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 1._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 1._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_SAratiob = r(b)
matrix G_SAratioV = r(V)
matrix G_SAratioSE = sqrt( G_SAratioV[1,1] )
matrix G_SAratiolb = G_SAratiob - 1.96 * G_SAratioSE
matrix G_SAratioub = G_SAratiob + 1.96 * G_SAratioSE
matrix G_SAratio4 = ( G_SAratiob , G_SAratiolb , G_SAratioub )  
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 1._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 1._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_SAdiff4 = r(estimate) , r(lb) , r(ub) 

* Combine all SA matrices IN GIRLS.
matrix G_SAcomb = ( G_SANothing \ G_SAPosP \ G_SAratio1 \ G_SAdiff1 \ G_SACMon \ G_SAratio2 \ G_SAdiff2 \ G_SAFood \ G_SAratio3 \ G_SAdiff3 \ G_SACombo \ G_SAratio4 \ G_SAdiff4 )
matrix list G_SAcomb

*----------------------------------------------

* Save estimates of predicted probability of TRANSACTIONAL sex IN BOYS.
matrix B_TSNothing = ( rC2[ 1 , ( 16 * 1 + 2 * 0 + 1 ) ] , rC2[ 5 , ( 16 * 1 + 2 * 0 + 1 ) ] , rC2[ 6 , ( 16 * 1 + 2 * 0 + 1 ) ] )
matrix B_TSFood = ( rC2[ 1 , ( 16 * 1 + 2 * 0 + 2 ) ] , rC2[ 5 , ( 16 * 1 + 2 * 0 + 2 ) ] , rC2[ 6 , ( 16 * 1 + 2 * 0 + 2 ) ] )
matrix B_TSCMon = ( rC2[ 1 , ( 16 * 1 + 2 * 2 + 1 ) ] , rC2[ 5 , ( 16 * 1 + 2 * 2 + 1 ) ] , rC2[ 6 , ( 16 * 1 + 2 * 2 + 1 ) ] )
matrix B_TSPosP = ( rC2[ 1 , ( 16 * 1 + 2 * 4 + 1 ) ] , rC2[ 5 , ( 16 * 1 + 2 * 4 + 1 ) ] , rC2[ 6 , ( 16 * 1 + 2 * 4 + 1 ) ] )
matrix B_TSCombo = ( rC2[ 1 , ( 16 * 1 + 2 * 6 + 2 ) ] , rC2[ 5 , ( 16 * 1 + 2 * 6 + 2 ) ] , rC2[ 6 , ( 16 * 1 + 2 * 6 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 2._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 2._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_TSratiob = r(b)
matrix B_TSratioV = r(V)
matrix B_TSratioSE = sqrt( B_TSratioV[1,1] )
matrix B_TSratiolb = B_TSratiob - 1.96 * B_TSratioSE
matrix B_TSratioub = B_TSratiob + 1.96 * B_TSratioSE
matrix B_TSratio1 = ( B_TSratiob , B_TSratiolb , B_TSratioub ) 
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 2._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 2._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_TSdiff1 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 2._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 2._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_TSratiob = r(b)
matrix B_TSratioV = r(V)
matrix B_TSratioSE = sqrt( B_TSratioV[1,1] )
matrix B_TSratiolb = B_TSratiob - 1.96 * B_TSratioSE
matrix B_TSratioub = B_TSratiob + 1.96 * B_TSratioSE
matrix B_TSratio2 = ( B_TSratiob , B_TSratiolb , B_TSratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 2._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 2._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_TSdiff2 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 2._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 2._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_TSratiob = r(b)
matrix B_TSratioV = r(V)
matrix B_TSratioSE = sqrt( B_TSratioV[1,1] )
matrix B_TSratiolb = B_TSratiob - 1.96 * B_TSratioSE
matrix B_TSratioub = B_TSratiob + 1.96 * B_TSratioSE
matrix B_TSratio3 = ( B_TSratiob , B_TSratiolb , B_TSratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 2._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 2._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_TSdiff3 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 2._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 2._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_TSratiob = r(b)
matrix B_TSratioV = r(V)
matrix B_TSratioSE = sqrt( B_TSratioV[1,1] )
matrix B_TSratiolb = B_TSratiob - 1.96 * B_TSratioSE
matrix B_TSratioub = B_TSratiob + 1.96 * B_TSratioSE
matrix B_TSratio4 = ( B_TSratiob , B_TSratiolb , B_TSratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 2._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 2._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_TSdiff4 = r(estimate) , r(lb) , r(ub) 

* Combine all TS matrices IN BOYS.
matrix B_TScomb = ( B_TSNothing \ B_TSPosP \ B_TSratio1 \ B_TSdiff1 \ B_TSCMon \ B_TSratio2 \ B_TSdiff2 \ B_TSFood \ B_TSratio3 \ B_TSdiff3 \ B_TSCombo \ B_TSratio4 \ B_TSdiff4 )
matrix list B_TScomb

* Save estimates of predicted probability of TRANSACTIONAL sex IN GIRLS.
matrix G_TSNothing = ( rC2[ 1 , ( 16 * 1 + 2 * 1 + 1 ) ] , rC2[ 5 , ( 16 * 1 + 2 * 1 + 1 ) ] , rC2[ 6 , ( 16 * 1 + 2 * 1 + 1 ) ] )
matrix G_TSFood = ( rC2[ 1 , ( 16 * 1 + 2 * 1 + 2 ) ] , rC2[ 5 , ( 16 * 1 + 2 * 1 + 2 ) ] , rC2[ 6 , ( 16 * 1 + 2 * 1 + 2 ) ] )
matrix G_TSCMon = ( rC2[ 1 , ( 16 * 1 + 2 * 3 + 1 ) ] , rC2[ 5 , ( 16 * 1 + 2 * 3 + 1 ) ] , rC2[ 6 , ( 16 * 1 + 2 * 3 + 1 ) ] )
matrix G_TSPosP = ( rC2[ 1 , ( 16 * 1 + 2 * 5 + 1 ) ] , rC2[ 5 , ( 16 * 1 + 2 * 5 + 1 ) ] , rC2[ 6 , ( 16 * 1 + 2 * 5 + 1 ) ] )
matrix G_TSCombo = ( rC2[ 1 , ( 16 * 1 + 2 * 7 + 2 ) ] , rC2[ 5 , ( 16 * 1 + 2 * 7 + 2 ) ] , rC2[ 6 , ( 16 * 1 + 2 * 7 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 2._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 2._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_TSratiob = r(b)
matrix G_TSratioV = r(V)
matrix G_TSratioSE = sqrt( G_TSratioV[1,1] )
matrix G_TSratiolb = G_TSratiob - 1.96 * G_TSratioSE
matrix G_TSratioub = G_TSratiob + 1.96 * G_TSratioSE
matrix G_TSratio1 = ( G_TSratiob , G_TSratiolb , G_TSratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 2._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 2._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_TSdiff1 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 2._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 2._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_TSratiob = r(b)
matrix G_TSratioV = r(V)
matrix G_TSratioSE = sqrt( G_TSratioV[1,1] )
matrix G_TSratiolb = G_TSratiob - 1.96 * G_TSratioSE
matrix G_TSratioub = G_TSratiob + 1.96 * G_TSratioSE
matrix G_TSratio2 = ( G_TSratiob , G_TSratiolb , G_TSratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 2._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 2._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_TSdiff2 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 2._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 2._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_TSratiob = r(b)
matrix G_TSratioV = r(V)
matrix G_TSratioSE = sqrt( G_TSratioV[1,1] )
matrix G_TSratiolb = G_TSratiob - 1.96 * G_TSratioSE
matrix G_TSratioub = G_TSratiob + 1.96 * G_TSratioSE
matrix G_TSratio3 = ( G_TSratiob , G_TSratiolb , G_TSratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 2._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 2._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_TSdiff3 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 2._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 2._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_TSratiob = r(b)
matrix G_TSratioV = r(V)
matrix G_TSratioSE = sqrt( G_TSratioV[1,1] )
matrix G_TSratiolb = G_TSratiob - 1.96 * G_TSratioSE
matrix G_TSratioub = G_TSratiob + 1.96 * G_TSratioSE
matrix G_TSratio4 = ( G_TSratiob , G_TSratiolb , G_TSratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 2._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 2._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_TSdiff4 = r(estimate) , r(lb) , r(ub) 

* Combine all TS matrices IN GIRLS.
matrix G_TScomb = ( G_TSNothing \ G_TSPosP \ G_TSratio1 \ G_TSdiff1 \ G_TSCMon \ G_TSratio2 \ G_TSdiff2 \ G_TSFood \ G_TSratio3 \ G_TSdiff3 \ G_TSCombo \ G_TSratio4 \ G_TSdiff4 )
matrix list G_TScomb

*----------------------------------------------

* Save estimates of predicted probability of PHYSICAL abuse IN BOYS.
matrix B_PANothing = ( rC2[ 1 , ( 16 * 2 + 2 * 0 + 1 ) ] , rC2[ 5 , ( 16 * 2 + 2 * 0 + 1 ) ] , rC2[ 6 , ( 16 * 2 + 2 * 0 + 1 ) ] )
matrix B_PAFood = ( rC2[ 1 , ( 16 * 2 + 2 * 0 + 2 ) ] , rC2[ 5 , ( 16 * 2 + 2 * 0 + 2 ) ] , rC2[ 6 , ( 16 * 2 + 2 * 0 + 2 ) ] )
matrix B_PACMon = ( rC2[ 1 , ( 16 * 2 + 2 * 2 + 1 ) ] , rC2[ 5 , ( 16 * 2 + 2 * 2 + 1 ) ] , rC2[ 6 , ( 16 * 2 + 2 * 2 + 1 ) ] )
matrix B_PAPosP = ( rC2[ 1 , ( 16 * 2 + 2 * 4 + 1 ) ] , rC2[ 5 , ( 16 * 2 + 2 * 4 + 1 ) ] , rC2[ 6 , ( 16 * 2 + 2 * 4 + 1 ) ] )
matrix B_PACombo = ( rC2[ 1 , ( 16 * 2 + 2 * 6 + 2 ) ] , rC2[ 5 , ( 16 * 2 + 2 * 6 + 2 ) ] , rC2[ 6 , ( 16 * 2 + 2 * 6 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ratio: ( _b[ 3._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 3._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_PAratiob = r(b)
matrix B_PAratioV = r(V)
matrix B_PAratioSE = sqrt( B_PAratioV[1,1] )
matrix B_PAratiolb = B_PAratiob - 1.96 * B_PAratioSE
matrix B_PAratioub = B_PAratiob + 1.96 * B_PAratioSE
matrix B_PAratio1 = ( B_PAratiob , B_PAratiolb , B_PAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 3._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 3._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_PAdiff1 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 3._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 3._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_PAratiob = r(b)
matrix B_PAratioV = r(V)
matrix B_PAratioSE = sqrt( B_PAratioV[1,1] )
matrix B_PAratiolb = B_PAratiob - 1.96 * B_PAratioSE
matrix B_PAratioub = B_PAratiob + 1.96 * B_PAratioSE
matrix B_PAratio2 = ( B_PAratiob , B_PAratiolb , B_PAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 3._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 3._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_PAdiff2 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 3._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 3._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_PAratiob = r(b)
matrix B_PAratioV = r(V)
matrix B_PAratioSE = sqrt( B_PAratioV[1,1] )
matrix B_PAratiolb = B_PAratiob - 1.96 * B_PAratioSE
matrix B_PAratioub = B_PAratiob + 1.96 * B_PAratioSE
matrix B_PAratio3 = ( B_PAratiob , B_PAratiolb , B_PAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 3._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 3._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_PAdiff3 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 3._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 3._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_PAratiob = r(b)
matrix B_PAratioV = r(V)
matrix B_PAratioSE = sqrt( B_PAratioV[1,1] )
matrix B_PAratiolb = B_PAratiob - 1.96 * B_PAratioSE
matrix B_PAratioub = B_PAratiob + 1.96 * B_PAratioSE
matrix B_PAratio4 = ( B_PAratiob , B_PAratiolb , B_PAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 3._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 3._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_PAdiff4 = r(estimate) , r(lb) , r(ub) 

* Combine all PA matrices IN BOYS.
matrix B_PAcomb = ( B_PANothing \ B_PAPosP \ B_PAratio1 \ B_PAdiff1 \ B_PACMon \ B_PAratio2 \ B_PAdiff2 \ B_PAFood \ B_PAratio3 \ B_PAdiff3 \ B_PACombo \ B_PAratio4 \ B_PAdiff4 )
matrix list B_PAcomb

* Save estimates of predicted probability of PHYSICAL abuse IN GIRLS.
matrix G_PANothing = ( rC2[ 1 , ( 16 * 2 + 2 * 1 + 1 ) ] , rC2[ 5 , ( 16 * 2 + 2 * 1 + 1 ) ] , rC2[ 6 , ( 16 * 2 + 2 * 1 + 1 ) ] )
matrix G_PAFood = ( rC2[ 1 , ( 16 * 2 + 2 * 1 + 2 ) ] , rC2[ 5 , ( 16 * 2 + 2 * 1 + 2 ) ] , rC2[ 6 , ( 16 * 2 + 2 * 1 + 2 ) ] )
matrix G_PACMon = ( rC2[ 1 , ( 16 * 2 + 2 * 3 + 1 ) ] , rC2[ 5 , ( 16 * 2 + 2 * 3 + 1 ) ] , rC2[ 6 , ( 16 * 2 + 2 * 3 + 1 ) ] )
matrix G_PAPosP = ( rC2[ 1 , ( 16 * 2 + 2 * 5 + 1 ) ] , rC2[ 5 , ( 16 * 2 + 2 * 5 + 1 ) ] , rC2[ 6 , ( 16 * 2 + 2 * 5 + 1 ) ] )
matrix G_PACombo = ( rC2[ 1 , ( 16 * 2 + 2 * 7 + 2 ) ] , rC2[ 5 , ( 16 * 2 + 2 * 7 + 2 ) ] , rC2[ 6 , ( 16 * 2 + 2 * 7 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 3._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 3._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_PAratiob = r(b)
matrix G_PAratioV = r(V)
matrix G_PAratioSE = sqrt( G_PAratioV[1,1] )
matrix G_PAratiolb = G_PAratiob - 1.96 * G_PAratioSE
matrix G_PAratioub = G_PAratiob + 1.96 * G_PAratioSE
matrix G_PAratio1 = ( G_PAratiob , G_PAratiolb , G_PAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 3._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 3._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_PAdiff1 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 3._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 3._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_PAratiob = r(b)
matrix G_PAratioV = r(V)
matrix G_PAratioSE = sqrt( G_PAratioV[1,1] )
matrix G_PAratiolb = G_PAratiob - 1.96 * G_PAratioSE
matrix G_PAratioub = G_PAratiob + 1.96 * G_PAratioSE
matrix G_PAratio2 = ( G_PAratiob , G_PAratiolb , G_PAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 3._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 3._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_PAdiff2 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 3._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 3._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_PAratiob = r(b)
matrix G_PAratioV = r(V)
matrix G_PAratioSE = sqrt( G_PAratioV[1,1] )
matrix G_PAratiolb = G_PAratiob - 1.96 * G_PAratioSE
matrix G_PAratioub = G_PAratiob + 1.96 * G_PAratioSE
matrix G_PAratio3 = ( G_PAratiob , G_PAratiolb , G_PAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 3._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 3._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_PAdiff3 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 3._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 3._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_PAratiob = r(b)
matrix G_PAratioV = r(V)
matrix G_PAratioSE = sqrt( G_PAratioV[1,1] )
matrix G_PAratiolb = G_PAratiob - 1.96 * G_PAratioSE
matrix G_PAratioub = G_PAratiob + 1.96 * G_PAratioSE
matrix G_PAratio4 = ( G_PAratiob , G_PAratiolb , G_PAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 3._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 3._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_PAdiff4 = r(estimate) , r(lb) , r(ub) 

* Combine all PA matrices IN GIRLS.
matrix G_PAcomb = ( G_PANothing \ G_PAPosP \ G_PAratio1 \ G_PAdiff1 \ G_PACMon \ G_PAratio2 \ G_PAdiff2 \ G_PAFood \ G_PAratio3 \ G_PAdiff3 \ G_PACombo \ G_PAratio4 \ G_PAdiff4 )
matrix list G_PAcomb

*----------------------------------------------

* Save estimates of predicted probability of EMOTIONAL abuse IN BOYS.
matrix B_EANothing = ( rC2[ 1 , ( 16 * 3 + 2 * 0 + 1 ) ] , rC2[ 5 , ( 16 * 3 + 2 * 0 + 1 ) ] , rC2[ 6 , ( 16 * 3 + 2 * 0 + 1 ) ] )
matrix B_EAFood = ( rC2[ 1 , ( 16 * 3 + 2 * 0 + 2 ) ] , rC2[ 5 , ( 16 * 3 + 2 * 0 + 2 ) ] , rC2[ 6 , ( 16 * 3 + 2 * 0 + 2 ) ] )
matrix B_EACMon = ( rC2[ 1 , ( 16 * 3 + 2 * 2 + 1 ) ] , rC2[ 5 , ( 16 * 3 + 2 * 2 + 1 ) ] , rC2[ 6 , ( 16 * 3 + 2 * 2 + 1 ) ] )
matrix B_EAPosP = ( rC2[ 1 , ( 16 * 3 + 2 * 4 + 1 ) ] , rC2[ 5 , ( 16 * 3 + 2 * 4 + 1 ) ] , rC2[ 6 , ( 16 * 3 + 2 * 4 + 1 ) ] )
matrix B_EACombo = ( rC2[ 1 , ( 16 * 3 + 2 * 6 + 2 ) ] , rC2[ 5 , ( 16 * 3 + 2 * 6 + 2 ) ] , rC2[ 6 , ( 16 * 3 + 2 * 6 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 4._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 4._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_EAratiob = r(b)
matrix B_EAratioV = r(V)
matrix B_EAratioSE = sqrt( B_EAratioV[1,1] )
matrix B_EAratiolb = B_EAratiob - 1.96 * B_EAratioSE
matrix B_EAratioub = B_EAratiob + 1.96 * B_EAratioSE
matrix B_EAratio1 = ( B_EAratiob , B_EAratiolb , B_EAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 4._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 4._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_EAdiff1 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 4._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 4._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_EAratiob = r(b)
matrix B_EAratioV = r(V)
matrix B_EAratioSE = sqrt( B_EAratioV[1,1] )
matrix B_EAratiolb = B_EAratiob - 1.96 * B_EAratioSE
matrix B_EAratioub = B_EAratiob + 1.96 * B_EAratioSE
matrix B_EAratio2 = ( B_EAratiob , B_EAratiolb , B_EAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 4._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 4._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_EAdiff2 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 4._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 4._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_EAratiob = r(b)
matrix B_EAratioV = r(V)
matrix B_EAratioSE = sqrt( B_EAratioV[1,1] )
matrix B_EAratiolb = B_EAratiob - 1.96 * B_EAratioSE
matrix B_EAratioub = B_EAratiob + 1.96 * B_EAratioSE
matrix B_EAratio3 = ( B_EAratiob , B_EAratiolb , B_EAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 4._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 4._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_EAdiff3 = r(estimate) , r(lb) , r(ub) 

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 4._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 4._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_EAratiob = r(b)
matrix B_EAratioV = r(V)
matrix B_EAratioSE = sqrt( B_EAratioV[1,1] )
matrix B_EAratiolb = B_EAratiob - 1.96 * B_EAratioSE
matrix B_EAratioub = B_EAratiob + 1.96 * B_EAratioSE
matrix B_EAratio4 = ( B_EAratiob , B_EAratiolb , B_EAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 4._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 4._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_EAdiff4 = r(estimate) , r(lb) , r(ub) 

* Combine all EA matrices IN BOYS.
matrix B_EAcomb = ( B_EANothing \ B_EAPosP \ B_EAratio1 \ B_EAdiff1 \ B_EACMon \ B_EAratio2 \ B_EAdiff2 \ B_EAFood \ B_EAratio3 \ B_EAdiff3 \ B_EACombo \ B_EAratio4 \ B_EAdiff4 )
matrix list B_EAcomb

* Save estimates of predicted probability of EMOTIONAL abuse IN GIRLS.
matrix G_EANothing = ( rC2[ 1 , ( 16 * 3 + 2 * 1 + 1 ) ] , rC2[ 5 , ( 16 * 3 + 2 * 1 + 1 ) ] , rC2[ 6 , ( 16 * 3 + 2 * 1 + 1 ) ] )
matrix G_EAFood = ( rC2[ 1 , ( 16 * 3 + 2 * 1 + 2 ) ] , rC2[ 5 , ( 16 * 3 + 2 * 1 + 2 ) ] , rC2[ 6 , ( 16 * 3 + 2 * 1 + 2 ) ] )
matrix G_EACMon = ( rC2[ 1 , ( 16 * 3 + 2 * 3 + 1 ) ] , rC2[ 5 , ( 16 * 3 + 2 * 3 + 1 ) ] , rC2[ 6 , ( 16 * 3 + 2 * 3 + 1 ) ] )
matrix G_EAPosP = ( rC2[ 1 , ( 16 * 3 + 2 * 5 + 1 ) ] , rC2[ 5 , ( 16 * 3 + 2 * 5 + 1 ) ] , rC2[ 6 , ( 16 * 3 + 2 * 5 + 1 ) ] )
matrix G_EACombo = ( rC2[ 1 , ( 16 * 3 + 2 * 7 + 2 ) ] , rC2[ 5 , ( 16 * 3 + 2 * 7 + 2 ) ] , rC2[ 6 , ( 16 * 3 + 2 * 7 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 4._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 4._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_EAratiob = r(b)
matrix G_EAratioV = r(V)
matrix G_EAratioSE = sqrt( G_EAratioV[1,1] )
matrix G_EAratiolb = G_EAratiob - 1.96 * G_EAratioSE
matrix G_EAratioub = G_EAratiob + 1.96 * G_EAratioSE
matrix G_EAratio1 = ( G_EAratiob , G_EAratiolb , G_EAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 4._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 4._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_EAdiff1 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 4._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 4._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_EAratiob = r(b)
matrix G_EAratioV = r(V)
matrix G_EAratioSE = sqrt( G_EAratioV[1,1] )
matrix G_EAratiolb = G_EAratiob - 1.96 * G_EAratioSE
matrix G_EAratioub = G_EAratiob + 1.96 * G_EAratioSE
matrix G_EAratio2 = ( G_EAratiob , G_EAratiolb , G_EAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 4._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 4._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_EAdiff2 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 4._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 4._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_EAratiob = r(b)
matrix G_EAratioV = r(V)
matrix G_EAratioSE = sqrt( G_EAratioV[1,1] )
matrix G_EAratiolb = G_EAratiob - 1.96 * G_EAratioSE
matrix G_EAratioub = G_EAratiob + 1.96 * G_EAratioSE
matrix G_EAratio3 = ( G_EAratiob , G_EAratiolb , G_EAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 4._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 4._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_EAdiff3 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 4._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 4._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_EAratiob = r(b)
matrix G_EAratioV = r(V)
matrix G_EAratioSE = sqrt( G_EAratioV[1,1] )
matrix G_EAratiolb = G_EAratiob - 1.96 * G_EAratioSE
matrix G_EAratioub = G_EAratiob + 1.96 * G_EAratioSE
matrix G_EAratio4 = ( G_EAratiob , G_EAratiolb , G_EAratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 4._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 4._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_EAdiff4 = r(estimate) , r(lb) , r(ub)

* Combine all EA matrices IN GIRLS.
matrix G_EAcomb = ( G_EANothing \ G_EAPosP \ G_EAratio1 \ G_EAdiff1 \ G_EACMon \ G_EAratio2 \ G_EAdiff2 \ G_EAFood \ G_EAratio3 \ G_EAdiff3 \ G_EACombo \ G_EAratio4 \ G_EAdiff4 )
matrix list G_EAcomb

*----------------------------------------------

* Save estimates of predicted probability of Community Violence Victimisation IN BOYS.
matrix B_CVVNothing = ( rC2[ 1 , ( 16 * 5 + 2 * 0 + 1 ) ] , rC2[ 5 , ( 16 * 5 + 2 * 0 + 1 ) ] , rC2[ 6 , ( 16 * 5 + 2 * 0 + 1 ) ] )
matrix B_CVVFood = ( rC2[ 1 , ( 16 * 5 + 2 * 0 + 2 ) ] , rC2[ 5 , ( 16 * 5 + 2 * 0 + 2 ) ] , rC2[ 6 , ( 16 * 5 + 2 * 0 + 2 ) ] )
matrix B_CVVCMon = ( rC2[ 1 , ( 16 * 5 + 2 * 2 + 1 ) ] , rC2[ 5 , ( 16 * 5 + 2 * 2 + 1 ) ] , rC2[ 6 , ( 16 * 5 + 2 * 2 + 1 ) ] )
matrix B_CVVPosP = ( rC2[ 1 , ( 16 * 5 + 2 * 4 + 1 ) ] , rC2[ 5 , ( 16 * 5 + 2 * 4 + 1 ) ] , rC2[ 6 , ( 16 * 5 + 2 * 4 + 1 ) ] )
matrix B_CVVCombo = ( rC2[ 1 , ( 16 * 5 + 2 * 6 + 2 ) ] , rC2[ 5 , ( 16 * 5 + 2 * 6 + 2 ) ] , rC2[ 6 , ( 16 * 5 + 2 * 6 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 6._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 6._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_CVVratiob = r(b)
matrix B_CVVratioV = r(V)
matrix B_CVVratioSE = sqrt( B_CVVratioV[1,1] )
matrix B_CVVratiolb = B_CVVratiob - 1.96 * B_CVVratioSE
matrix B_CVVratioub = B_CVVratiob + 1.96 * B_CVVratioSE
matrix B_CVVratio1 = ( B_CVVratiob , B_CVVratiolb , B_CVVratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 6._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 6._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_CVVdiff1 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 6._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 6._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_CVVratiob = r(b)
matrix B_CVVratioV = r(V)
matrix B_CVVratioSE = sqrt( B_CVVratioV[1,1] )
matrix B_CVVratiolb = B_CVVratiob - 1.96 * B_CVVratioSE
matrix B_CVVratioub = B_CVVratiob + 1.96 * B_CVVratioSE
matrix B_CVVratio2 = ( B_CVVratiob , B_CVVratiolb , B_CVVratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 6._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 6._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_CVVdiff2 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 6._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 6._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_CVVratiob = r(b)
matrix B_CVVratioV = r(V)
matrix B_CVVratioSE = sqrt( B_CVVratioV[1,1] )
matrix B_CVVratiolb = B_CVVratiob - 1.96 * B_CVVratioSE
matrix B_CVVratioub = B_CVVratiob + 1.96 * B_CVVratioSE
matrix B_CVVratio3 = ( B_CVVratiob , B_CVVratiolb , B_CVVratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 6._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 6._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_CVVdiff3 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 6._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 6._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_CVVratiob = r(b)
matrix B_CVVratioV = r(V)
matrix B_CVVratioSE = sqrt( B_CVVratioV[1,1] )
matrix B_CVVratiolb = B_CVVratiob - 1.96 * B_CVVratioSE
matrix B_CVVratioub = B_CVVratiob + 1.96 * B_CVVratioSE
matrix B_CVVratio4 = ( B_CVVratiob , B_CVVratiolb , B_CVVratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 6._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 6._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_CVVdiff4 = r(estimate) , r(lb) , r(ub)

* Combine all CVV matrices IN BOYS.
matrix B_CVVcomb = ( B_CVVNothing \ B_CVVPosP \ B_CVVratio1 \ B_CVVdiff1 \ B_CVVCMon \ B_CVVratio2 \ B_CVVdiff2 \ B_CVVFood \ B_CVVratio3 \ B_CVVdiff3 \ B_CVVCombo \ B_CVVratio4 \ B_CVVdiff4 )
matrix list B_CVVcomb

* Save estimates of predicted probability of Community Violence Victimisation IN GIRLS.
matrix G_CVVNothing = ( rC2[ 1 , ( 16 * 5 + 2 * 1 + 1 ) ] , rC2[ 5 , ( 16 * 5 + 2 * 1 + 1 ) ] , rC2[ 6 , ( 16 * 5 + 2 * 1 + 1 ) ] )
matrix G_CVVFood = ( rC2[ 1 , ( 16 * 5 + 2 * 1 + 2 ) ] , rC2[ 5 , ( 16 * 5 + 2 * 1 + 2 ) ] , rC2[ 6 , ( 16 * 5 + 2 * 1 + 2 ) ] )
matrix G_CVVCMon = ( rC2[ 1 , ( 16 * 5 + 2 * 3 + 1 ) ] , rC2[ 5 , ( 16 * 5 + 2 * 3 + 1 ) ] , rC2[ 6 , ( 16 * 5 + 2 * 3 + 1 ) ] )
matrix G_CVVPosP = ( rC2[ 1 , ( 16 * 5 + 2 * 5 + 1 ) ] , rC2[ 5 , ( 16 * 5 + 2 * 5 + 1 ) ] , rC2[ 6 , ( 16 * 5 + 2 * 5 + 1 ) ] )
matrix G_CVVCombo = ( rC2[ 1 , ( 16 * 5 + 2 * 7 + 2 ) ] , rC2[ 5 , ( 16 * 5 + 2 * 7 + 2 ) ] , rC2[ 6 , ( 16 * 5 + 2 * 7 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 6._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 6._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_CVVratiob = r(b)
matrix G_CVVratioV = r(V)
matrix G_CVVratioSE = sqrt( G_CVVratioV[1,1] )
matrix G_CVVratiolb = G_CVVratiob - 1.96 * G_CVVratioSE
matrix G_CVVratioub = G_CVVratiob + 1.96 * G_CVVratioSE
matrix G_CVVratio1 = ( G_CVVratiob , G_CVVratiolb , G_CVVratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 6._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 6._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_CVVdiff1 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 6._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 6._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_CVVratiob = r(b)
matrix G_CVVratioV = r(V)
matrix G_CVVratioSE = sqrt( G_CVVratioV[1,1] )
matrix G_CVVratiolb = G_CVVratiob - 1.96 * G_CVVratioSE
matrix G_CVVratioub = G_CVVratiob + 1.96 * G_CVVratioSE
matrix G_CVVratio2 = ( G_CVVratiob , G_CVVratiolb , G_CVVratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 6._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 6._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_CVVdiff2 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 6._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 6._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_CVVratiob = r(b)
matrix G_CVVratioV = r(V)
matrix G_CVVratioSE = sqrt( G_CVVratioV[1,1] )
matrix G_CVVratiolb = G_CVVratiob - 1.96 * G_CVVratioSE
matrix G_CVVratioub = G_CVVratiob + 1.96 * G_CVVratioSE
matrix G_CVVratio3 = ( G_CVVratiob , G_CVVratiolb , G_CVVratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 6._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 6._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_CVVdiff3 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 6._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 6._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_CVVratiob = r(b)
matrix G_CVVratioV = r(V)
matrix G_CVVratioSE = sqrt( G_CVVratioV[1,1] )
matrix G_CVVratiolb = G_CVVratiob - 1.96 * G_CVVratioSE
matrix G_CVVratioub = G_CVVratiob + 1.96 * G_CVVratioSE
matrix G_CVVratio4 = ( G_CVVratiob , G_CVVratiolb , G_CVVratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 6._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 6._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_CVVdiff4 = r(estimate) , r(lb) , r(ub)

* Combine all CVV matrices IN GIRLS.
matrix G_CVVcomb = ( G_CVVNothing \ G_CVVPosP \ G_CVVratio1 \ G_CVVdiff1 \ G_CVVCMon \ G_CVVratio2 \ G_CVVdiff2 \ G_CVVFood \ G_CVVratio3 \ G_CVVdiff3 \ G_CVVCombo \ G_CVVratio4 \ G_CVVdiff4 )
matrix list G_CVVcomb

*----------------------------------------------

* Save estimates of predicted probability of Youth Lawbreaking IN BOYS.
matrix B_YLNothing = ( rC2[ 1 , ( 16 * 4 + 2 * 0 + 1 ) ] , rC2[ 5 , ( 16 * 4 + 2 * 0 + 1 ) ] , rC2[ 6 , ( 16 * 4 + 2 * 0 + 1 ) ] )
matrix B_YLFood = ( rC2[ 1 , ( 16 * 4 + 2 * 0 + 2 ) ] , rC2[ 5 , ( 16 * 4 + 2 * 0 + 2 ) ] , rC2[ 6 , ( 16 * 4 + 2 * 0 + 2 ) ] )
matrix B_YLCMon = ( rC2[ 1 , ( 16 * 4 + 2 * 2 + 1 ) ] , rC2[ 5 , ( 16 * 4 + 2 * 2 + 1 ) ] , rC2[ 6 , ( 16 * 4 + 2 * 2 + 1 ) ] )
matrix B_YLPosP = ( rC2[ 1 , ( 16 * 4 + 2 * 4 + 1 ) ] , rC2[ 5 , ( 16 * 4 + 2 * 4 + 1 ) ] , rC2[ 6 , ( 16 * 4 + 2 * 4 + 1 ) ] )
matrix B_YLCombo = ( rC2[ 1 , ( 16 * 4 + 2 * 6 + 2 ) ] , rC2[ 5 , ( 16 * 4 + 2 * 6 + 2 ) ] , rC2[ 6 , ( 16 * 4 + 2 * 6 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 5._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 5._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_YLratiob = r(b)
matrix B_YLratioV = r(V)
matrix B_YLratioSE = sqrt( B_YLratioV[1,1] )
matrix B_YLratiolb = B_YLratiob - 1.96 * B_YLratioSE
matrix B_YLratioub = B_YLratiob + 1.96 * B_YLratioSE
matrix B_YLratio1 = ( B_YLratiob , B_YLratiolb , B_YLratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 5._predict#3._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 5._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_YLdiff1 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 5._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 5._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_YLratiob = r(b)
matrix B_YLratioV = r(V)
matrix B_YLratioSE = sqrt( B_YLratioV[1,1] )
matrix B_YLratiolb = B_YLratiob - 1.96 * B_YLratioSE
matrix B_YLratioub = B_YLratiob + 1.96 * B_YLratioSE
matrix B_YLratio2 = ( B_YLratiob , B_YLratiolb , B_YLratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 5._predict#2._at#0.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 5._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_YLdiff2 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 5._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 5._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_YLratiob = r(b)
matrix B_YLratioV = r(V)
matrix B_YLratioSE = sqrt( B_YLratioV[1,1] )
matrix B_YLratiolb = B_YLratiob - 1.96 * B_YLratioSE
matrix B_YLratioub = B_YLratiob + 1.96 * B_YLratioSE
matrix B_YLratio3 = ( B_YLratiob , B_YLratiolb , B_YLratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 5._predict#1._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 5._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_YLdiff3 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 5._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 5._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] )
matrix B_YLratiob = r(b)
matrix B_YLratioV = r(V)
matrix B_YLratioSE = sqrt( B_YLratioV[1,1] )
matrix B_YLratiolb = B_YLratiob - 1.96 * B_YLratioSE
matrix B_YLratioub = B_YLratiob + 1.96 * B_YLratioSE
matrix B_YLratio4 = ( B_YLratiob , B_YLratiolb , B_YLratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 5._predict#4._at#0.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 5._predict#1._at#0.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix B_YLdiff4 = r(estimate) , r(lb) , r(ub)

* Combine all YL matrices IN BOYS.
matrix B_YLcomb = ( B_YLNothing \ B_YLPosP \ B_YLratio1 \ B_YLdiff1 \ B_YLCMon \ B_YLratio2 \ B_YLdiff2 \ B_YLFood \ B_YLratio3 \ B_YLdiff3 \ B_YLCombo \ B_YLratio4 \ B_YLdiff4 )
matrix list B_YLcomb

* Save estimates of predicted probability of Youth lawbreaking IN GIRLS.
matrix G_YLNothing = ( rC2[ 1 , ( 16 * 4 + 2 * 1 + 1 ) ] , rC2[ 5 , ( 16 * 4 + 2 * 1 + 1 ) ] , rC2[ 6 , ( 16 * 4 + 2 * 1 + 1 ) ] )
matrix G_YLFood = ( rC2[ 1 , ( 16 * 4 + 2 * 1 + 2 ) ] , rC2[ 5 , ( 16 * 4 + 2 * 1 + 2 ) ] , rC2[ 6 , ( 16 * 4 + 2 * 1 + 2 ) ] )
matrix G_YLCMon = ( rC2[ 1 , ( 16 * 4 + 2 * 3 + 1 ) ] , rC2[ 5 , ( 16 * 4 + 2 * 3 + 1 ) ] , rC2[ 6 , ( 16 * 4 + 2 * 3 + 1 ) ] )
matrix G_YLPosP = ( rC2[ 1 , ( 16 * 4 + 2 * 5 + 1 ) ] , rC2[ 5 , ( 16 * 4 + 2 * 5 + 1 ) ] , rC2[ 6 , ( 16 * 4 + 2 * 5 + 1 ) ] )
matrix G_YLCombo = ( rC2[ 1 , ( 16 * 4 + 2 * 7 + 2 ) ] , rC2[ 5 , ( 16 * 4 + 2 * 7 + 2 ) ] , rC2[ 6 , ( 16 * 4 + 2 * 7 + 2 ) ] )

* Estimate prevalence ratio between experiencing no protective factors and experiencing positive parenting.
nlcom ( _b[ 5._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 5._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_YLratiob = r(b)
matrix G_YLratioV = r(V)
matrix G_YLratioSE = sqrt( G_YLratioV[1,1] )
matrix G_YLratiolb = G_YLratiob - 1.96 * G_YLratioSE
matrix G_YLratioub = G_YLratiob + 1.96 * G_YLratioSE
matrix G_YLratio1 = ( G_YLratiob , G_YLratiolb , G_YLratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing positive parenting.
lincom ( ( _b[ 5._predict#3._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 5._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_YLdiff1 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing parental monitoring and supervision.
nlcom ( _b[ 5._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) / ( _b[ 5._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_YLratiob = r(b)
matrix G_YLratioV = r(V)
matrix G_YLratioSE = sqrt( G_YLratioV[1,1] )
matrix G_YLratiolb = G_YLratiob - 1.96 * G_YLratioSE
matrix G_YLratioub = G_YLratiob + 1.96 * G_YLratioSE
matrix G_YLratio2 = ( G_YLratiob , G_YLratiolb , G_YLratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing parental monitoring and supervision.
lincom ( ( _b[ 5._predict#2._at#1.GenderT1#0.FoodSecureT1T2 ] ) - ( _b[ 5._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_YLdiff2 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing food security.
nlcom ( _b[ 5._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 5._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_YLratiob = r(b)
matrix G_YLratioV = r(V)
matrix G_YLratioSE = sqrt( G_YLratioV[1,1] )
matrix G_YLratiolb = G_YLratiob - 1.96 * G_YLratioSE
matrix G_YLratioub = G_YLratiob + 1.96 * G_YLratioSE
matrix G_YLratio3 = ( G_YLratiob , G_YLratiolb , G_YLratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing food security.
lincom ( ( _b[ 5._predict#1._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 5._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_YLdiff3 = r(estimate) , r(lb) , r(ub)

* Estimate prevalence ratio between experiencing no protective factors and experiencing all protective factors.
nlcom ( _b[ 5._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) / ( _b[ 5._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] )
matrix G_YLratiob = r(b)
matrix G_YLratioV = r(V)
matrix G_YLratioSE = sqrt( G_YLratioV[1,1] )
matrix G_YLratiolb = G_YLratiob - 1.96 * G_YLratioSE
matrix G_YLratioub = G_YLratiob + 1.96 * G_YLratioSE
matrix G_YLratio4 = ( G_YLratiob , G_YLratiolb , G_YLratioub )
* Estimate prevalence difference between experiencing no protective factors and experiencing all protective factors.
lincom ( ( _b[ 5._predict#4._at#1.GenderT1#1.FoodSecureT1T2 ] ) - ( _b[ 5._predict#1._at#1.GenderT1#0.FoodSecureT1T2 ] ) ) * 100
matrix G_YLdiff4 = r(estimate) , r(lb) , r(ub)

* Combine all YL matrices IN GIRLS.
matrix G_YLcomb = ( G_YLNothing \ G_YLPosP \ G_YLratio1 \ G_YLdiff1 \ G_YLCMon \ G_YLratio2 \ G_YLdiff2 \ G_YLFood \ G_YLratio3 \ G_YLdiff3 \ G_YLCombo \ G_YLratio4 \ G_YLdiff4 )
matrix list G_YLcomb

* Overall Table
matrix BAllPred = ( B_SAcomb \ B_TScomb \ B_PAcomb \ B_EAcomb \ B_CVVcomb \ B_YLcomb )
matrix GAllPred = ( G_SAcomb \ G_TScomb \ G_PAcomb \ G_EAcomb \ G_CVVcomb \ G_YLcomb )
matrix BGAllPred = ( BAllPred , GAllPred )
matrix list BGAllPred

* p-values
matrix b = r(b)
matrix V = r(V)
local std_err = sqrt(V[1,1])
local z = b[1,1]/`std_err'
local pvalue = 2*normal(-abs(`z'))
display `pvalue'

* for use of nlcom see: 
* https://journals.sagepub.com/doi/pdf/10.1177/1536867X1101100208

/*
logit /*Y*/ AbuseSexT2 /* X1 to X7 */ c.PosParentScoreT1T2##i.GenderT1 c.MonitParentScoreT1T2##i.GenderT1 i.FoodSecureT1T2##i.GenderT1 i.NecessitiesShortBINT1T2##i.GenderT1 i.SchoolFreeT1T2##i.GenderT1 i.SchoolMealsT1T2##i.GenderT1 /* T1 control */ i.AbuseSexT1 /* Controls */ c.AgeT1 i.RuralT1 i.InformalT1 i.MaternalOrphanT1 i.PaternalOrphanT1 c.HHsizeT1 i.HIVstatusT1 i.ProvinceT1 , or baselevels
margins i.GenderT1#i.FoodSecureT1T2 , at( PosParentScoreT1T2 = ( 24.57 32 ) MonitParentScoreT1T2 = ( 19.54 24 ) ) post

* Prevalence difference:
lincom ( _b[ 4._at#0.GenderT1#1.FoodSecureT1T2 ] - _b[ 1._at#0.GenderT1#0.FoodSecureT1T2 ] ) * 100

* Prevalence ratio:
nlcom ( ratio1: _b[ 4._at#0.GenderT1#1.FoodSecureT1T2 ] / _b[ 1._at#0.GenderT1#0.FoodSecureT1T2 ] ) , post
test ratio1 = 1
test ratio1 = 0
*/
