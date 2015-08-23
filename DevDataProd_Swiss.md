Course Project for Developing Data Products, Coursera
========================================================
author: Hwa Huey Soh
date: 23 Aug 2015

Application
========================================================

Performing linear regression modelling on socio-economic factors in their effect on Fertility rates.

Some of the factors include:

- % of males involved in agriculture as an occupation
- % of draftees receiving highest mark on army examination
- % of draftees receiving education beyond primary school
- % of males identifying as Catholic
- Infant Mortality rate

Data Source
========================================================

This application uses data from the Swiss dataset.

Standardized fertility measure and socio-economic indicators for each of 47 French-speaking provinces of Switzerland at about 1888.

The information about the data can be obtained [here](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/swiss.html).

Usage
========================================================

Use the check boxes on the left panel to choose which factors to compare against fertility rates.

Code and explanation
========================================================

The "Fertility" tab shows a pairwise plot of all factors used with linear models against each other.

Coefficients are calculated using the lm() function in R, eg:




```r
fit <- lm(Fertility ~ Agriculture, swiss)
summary(fit)$coeff
```

```
              Estimate Std. Error   t value     Pr(>|t|)
(Intercept) 60.3043752 4.25125562 14.185074 3.216304e-18
Agriculture  0.1942017 0.07671176  2.531577 1.491720e-02
```

Links and More Information
========================================================

Source code for the project is available on the [GitHub](https://github.com/HwaHueySoh/DataProducts_Proj).

The presentation for the project can be found [here](https://github.com/HwaHueySoh/DataProducts_Proj/blob/master/DevDataProd_Swiss.Rpres).

