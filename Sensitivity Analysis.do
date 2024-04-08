********************************************************************************
//*Title: Sensitivity analysis to Account for Correlated Outcomes--------------*
//*Author: WER-----------------------------------------------------------------*
//*Date: 24/07/2020------------------------------------------------------------*
********************************************************************************

/// Multivariate analysis-----------------------------------------------------**

* Summarise mean of positive parenting and child monitoring
summ PosP_c12 , detail
summ MonP_c12 , detail

* I begin by focusing on two outcomes known to be correlated: physical abuse 
* and emotional abuse.

* Check correlations between outcomes 

* Tetrachoric correlation coefficient 
tetrachoric AbSx_i2 TS_i2 AbPhy_i2 AbEmo_i2 ViPerp_i2 ViVict_i2 , pw stats( rho p )

* Run MV probit regression with gender interaction and all six violence outcomes

*---Define interaction terms
generate PosPSex_c12 = PosP_c12 * Sex_i1 
generate MonPSex_c12 = MonP_c12 * Sex_i1 
generate FoodSex_i12 = Food_i12 * Sex_i1 
generate PovSex_i12 = Pov_i12 * Sex_i1
generate ScFrSex_i12 = ScFr_i12 * Sex_i1
generate ScMeSex_i12 = ScMe_i12 * Sex_i1 

*---Run model with prespecified interaction terms
mvprobit ///
/* EQ1 */ ( AbSx_i2 =  /*interaction terms*/ PosPSex_c12 MonPSex_c12 FoodSex_i12 PovSex_i12 ScFrSex_i12 ScMeSex_i12 ///
					   /*main predictors*/ PosP_c12 MonP_c12 Food_i12 Pov_i12 ScFr_i12 ScMe_i12 ///
					   /*outcome at baseline*/ AbSx_i1 ///
					   /*covariates*/ Sex_i1 Age_c1 Rural_i1 House_i1 MOrp_i1 POrp_i1 HHsiz_c1 HIV_i1 Prov_i1 ) ///
/* EQ2 */ ( TS_i2 =    /*interaction terms*/ PosPSex_c12 MonPSex_c12 FoodSex_i12 PovSex_i12 ScFrSex_i12 ScMeSex_i12 ///
                       /*main predictors*/ PosP_c12 MonP_c12 Food_i12 Pov_i12 ScFr_i12 ScMe_i12 ///
					   /*outcome at baseline*/ ///
					   /*covariates*/ Sex_i1 Age_c1 Rural_i1 House_i1 MOrp_i1 POrp_i1 HHsiz_c1 HIV_i1 Prov_i1 ) ///
/* EQ3 */ ( AbPhy_i2 = /*interaction terms*/ PosPSex_c12 MonPSex_c12 FoodSex_i12 PovSex_i12 ScFrSex_i12 ScMeSex_i12 ///
                       /*main predictors*/ PosP_c12 MonP_c12 Food_i12 Pov_i12 ScFr_i12 ScMe_i12 ///
					   /*outcome at baseline*/ AbPhy_i1 ///
					   /*covariates*/ Sex_i1 Age_c1 Rural_i1 House_i1 MOrp_i1 POrp_i1 HHsiz_c1 HIV_i1 Prov_i1 ) ///
/* EQ4 */ ( AbEmo_i2 = /*interaction terms*/ PosPSex_c12 MonPSex_c12 FoodSex_i12 PovSex_i12 ScFrSex_i12 ScMeSex_i12 ///
                       /*main predictors*/ PosP_c12 MonP_c12 Food_i12 Pov_i12 ScFr_i12 ScMe_i12 ///
					   /*outcome at baseline*/ AbEmo_i1 ///
					   /*covariates*/ Sex_i1 Age_c1 Rural_i1 House_i1 MOrp_i1 POrp_i1 HHsiz_c1 HIV_i1 Prov_i1 ) ///
/* EQ5 */ ( ViPerp_i2 = /*interaction terms*/ PosPSex_c12 MonPSex_c12 FoodSex_i12 PovSex_i12 ScFrSex_i12 ScMeSex_i12 ///
                       /*main predictors*/ PosP_c12 MonP_c12 Food_i12 Pov_i12 ScFr_i12 ScMe_i12 ///
					   /*outcome at baseline*/ ViPerp_i1 ///
					   /*covariates*/ Sex_i1 Age_c1 Rural_i1 House_i1 MOrp_i1 POrp_i1 HHsiz_c1 HIV_i1 Prov_i1 ) ///
/* EQ6 */ ( ViVict_i2 = /*interaction terms*/ PosPSex_c12 MonPSex_c12 FoodSex_i12 PovSex_i12 ScFrSex_i12 ScMeSex_i12 ///
                       /*main predictors*/ PosP_c12 MonP_c12 Food_i12 Pov_i12 ScFr_i12 ScMe_i12 ///
					   /*outcome at baseline*/ ///
					   /*covariates*/ Sex_i1 Age_c1 Rural_i1 House_i1 MOrp_i1 POrp_i1 HHsiz_c1 HIV_i1 Prov_i1 ) , ///
draws( 100 ) nolog 

* Save estimation results
estimates save "C:\Users\william.rudgard\OneDrive - Nexus365\Accelerators\INSPIRE\Estimates\20200717 mvprobit 100 draws.ster" , replace

* Store a copy of our identified potential accelerators
* Gender interaction terms for identified potential accelerators
clonevar PosPSexcopy = PosPSex_c12
clonevar MonPSexcopy = MonPSex_c12
clonevar FoodSexcopy = FoodSex_i12
* Gender interaction terms for other potential accelerators
clonevar PovSexcopy = PovSex_i12 
clonevar ScFrSexcopy = ScFrSex_i12
clonevar ScMeSexcopy = ScMeSex_i12
* Identified potential accelerators
clonevar PosPcopy = PosP_c12
clonevar MonPcopy = MonP_c12
clonevar Foodcopy = Food_i12
* Gender
clonevar Sexcopy = Sex_i1

///Predict as if no receipt of potential accelerators

*1* Predict for boys first
replace Sex_i1 = 0 
* Replace all gender interaction terms for identified potential accelerators with 0
foreach var in PosPSex_c12 MonPSex_c12 FoodSex_i12 PovSex_i12 ScFrSex_i12 ScMeSex_i12 {
replace `var' = 0
}
* Replace all identified potential accelerators with "no receipt" values
replace PosP_c12 = 24.51 /*mean value: 24.51*/
replace MonP_c12 = 19.46 /*mean value: 19.46*/
replace Food_i12 = 0
* Calculate marginal probit predicted probability 
mvppred pmarg_noneboys_hat, pmarg
forvalues i=1/6{
sum pmarg_noneboys_hat`i'
}

*2* Predict for girls second
replace Sex_i1 = 1 
* Replace all gender interaction terms for non-significant hypothesised accelerators 
* with the multiple of the observed value of the predictor by 1.
replace PovSex_i12 = Pov_i12 * 1 
replace ScFrSex_i12 = ScFr_i12 * 1 
replace ScMeSex_i12 = ScMe_i12 * 1
* Replace all gender interaction terms for significant hypothesised accelerators 
* with "no receipt" values.
replace PosPSex_c12 = 24.51 /*mean value: 24.51*/
replace MonPSex_c12 = 19.46 /*mean value: 19.46*/
replace FoodSex_i12 = 0
* Replace all identified potential accelerators with "no receipt" values
replace PosP_c12 = 24.51 /*mean value: 24.51*/
replace MonP_c12 = 19.46 /*mean value: 19.46*/
replace Food_i12 = 0
* Calculate marginal probit predicted probability 
mvppred pmarg_nonegirls_hat, pmarg
forvalues i=1/6{
sum pmarg_nonegirls_hat`i'
}

///Predict as if receipt of all potential accelerators

*1* Predict for boys first
replace Sex_i1 = 0 
* Replace all gender interaction terms for identified potential accelerators with 0
foreach var in PosPSex_c12 MonPSex_c12 FoodSex_i12 PovSex_i12 ScFrSex_i12 ScMeSex_i12 {
replace `var' = 0
}
* Replace all identified potential accelerators with "receipt" values
replace PosP_c12 = 32 /*max value: 32*/
replace MonP_c12 = 24 /*max value: 24*/
replace Food_i12 = 1
* Calculate marginal probit predicted probability 
mvppred pmarg_allboys_hat, pmarg
forvalues i=1/6{
sum pmarg_allboys_hat`i'
}

*2* Predict for girls second
replace GenderT1 = 1 
* Replace all gender interaction terms for non-significant hypothesised accelerators 
* with the multiple of the observed value of the predictor by 1.
replace PovSex_i12 = Pov_i12 * 1 
replace ScFrSex_i12 = ScFr_i12 * 1 
replace ScMeSex_i12 = ScMe_i12 * 1
* Replace all gender interaction terms for significant hypothesised accelerators 
* with "receipt" values.
replace PosPSex_c12 = 32 /*max value: 32*/
replace MonPSex_c12 = 24 /*max value: 24*/
replace FoodSex_i12 = 1
* Replace all identified potential accelerators with "receipt" values
replace PosP_c12 = 32 /*max value: 32*/
replace MonP_c12 = 24 /*max value: 24*/
replace Food_i12 = 1
* Calculate marginal probit predicted probability 
mvppred pmarg_allgirls_hat, pmarg
forvalues i=1/6{
sum pmarg_allgirls_hat`i'
}
* Calculate standard error of the linear prediction 
mvppred stdp_allgirls_hat, stdp
forvalues i=1/6{
sum stdp_allgirls_hat`i'
}

* Restore our identified potential accelerators
* Gender interaction terms for identified potential accelerators
replace PosPSex_c12 PosPSexcopy
replace MonPSex_c12 MonPSexcopy
replace FoodSex_i12 FoodSexcopy
* Gender interaction terms for other potential accelerators
replace PovSex_i12 PovSexcopy
replace ScFrSex_i12 ScFrSexcopy
replace ScMeSex_i12 ScMeSexcopy
* Identified potential accelerators
replace PosP_c12 = PosPcopy
replace MonP_c12 = MonPcopy
replace Food_i12 = Foodcopy
* Gender
replace Sex_i1 = Sexcopy

* Drop copies
drop PosPSexcopy MonPSexcopy FoodSexcopy PovSexcopy ScFrSexcopy ScMeSexcopy PosPcopy MonPcopy Foodcopy Sexcopy

///End-------------------------------------------------------------------------*
