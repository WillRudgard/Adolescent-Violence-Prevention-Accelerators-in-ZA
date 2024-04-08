********************************************************************************
//*Title: Main analysis with multiple outcomes---------------------------------*
//*Author: WER-----------------------------------------------------------------*
//*Date: 24/07/2020------------------------------------------------------------*
********************************************************************************

use "C:\Users\william.rudgard\OneDrive - Nexus365\Analysis - INSPIRE Acc\03_Data\20210608 Plos Medicine INSPIRE dta Formatted.dta"


/// Multivariate analysis-----------------------------------------------------**

* Multivariate path model with gender interaction and all six abuse outcomes

gsem ///
/*This regresses outcome on hypothesised protective factors*/ ///
( AbSx_i2 <- c.PosP_c12##i.Sex_i1 c.MonP_c12##i.Sex_i1 i.Food_i12##i.Sex_i1 i.Pov_i12##i.Sex_i1 i.ScFr_i12##i.Sex_i1 i.ScMe_i12##i.Sex_i1 , family( binomial) link(logit) ) ///
( TS_i2 <- c.PosP_c12##i.Sex_i1 c.MonP_c12##i.Sex_i1 i.Food_i12##i.Sex_i1 i.Pov_i12##i.Sex_i1 i.ScFr_i12##i.Sex_i1 i.ScMe_i12##i.Sex_i1 , family( binomial) link(logit) ) ///
( AbPhy_i2 <- c.PosP_c12##i.Sex_i1 c.MonP_c12##i.Sex_i1 i.Food_i12##i.Sex_i1 i.Pov_i12##i.Sex_i1 i.ScFr_i12##i.Sex_i1 i.ScMe_i12##i.Sex_i1 , family( binomial) link(logit) ) ///
( AbEmo_i2 <- c.PosP_c12##i.Sex_i1 c.MonP_c12##i.Sex_i1 i.Food_i12##i.Sex_i1 i.Pov_i12##i.Sex_i1 i.ScFr_i12##i.Sex_i1 i.ScMe_i12##i.Sex_i1 , family( binomial) link(logit) ) /// 
( ViPerp_i2 <- c.PosP_c12##i.Sex_i1 c.MonP_c12##i.Sex_i1 i.Food_i12##i.Sex_i1 i.Pov_i12##i.Sex_i1 i.ScFr_i12##i.Sex_i1 i.ScMe_i12##i.Sex_i1 , family( binomial) link(logit) ) /// 
( ViVict_i2 <- c.PosP_c12##i.Sex_i1 c.MonP_c12##i.Sex_i1 i.Food_i12##i.Sex_i1 i.Pov_i12##i.Sex_i1 i.ScFr_i12##i.Sex_i1 i.ScMe_i12##i.Sex_i1 , family( binomial) link(logit) ) /// 
/*This is controlling for T1, viz. Outc2 on Outc1*/ ///
( AbSx_i2 <- i.AbSx_i1 , family( binomial ) link( logit ) ) /// 
( AbPhy_i2 <- i.AbPhy_i1 , family( binomial ) link( logit ) ) ///
( AbEmo_i2 <- i.AbEmo_i1 , family( binomial ) link( logit ) ) ///
( ViPerp_i2 <- i.ViPerp_i1 , family( binomial ) link( logit ) ) ///
/*All outcomes on all covariates*/ ///
( AbSx_i2 TS_i2 AbPhy_i2 AbEmo_i2 ViPerp_i2 ViVict_i2 <- c.Age_c1 i.Rural_i1 i.House_i1 i.MOrp_i1 i.POrp_i1 c.HHsiz_c1 i.HIV_i1 i.Prov_i1 , family( binomial) link(logit) ) ///
, ///
nocapslatent 

* Display exponentiated coefficients
estat eform AbSx_i2 TS_i2 AbPhy_i2 AbEmo_i2 ViPerp_i2 ViVict_i2

/// Estimate adjusted prevalence of violence outcomes-------------------------**

* Check average and maximum level of positive parenting
summ PosP_c12

* Check average and maximum level of parental monitoring and supervision
summ MonP_c12

* Use the margins command to evaluate the adjusted prevalence of violence
* outcomes according to different combinations of positive parenting, parental 
* monitoring and supervision, and food at home.
margins i.Sex_i1 , at( Food_i12 = ( 0 1 ) PosP_c12 = ( 24.57 32 ) MonP_c12 = ( 19.54 24 ) ) post
matrix rC2 = [ r(table) ] * 100

///End-------------------------------------------------------------------------*
