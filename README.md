# Cluster

[![CC BY-NC-SA 4.0][cc-shield]][cc]
[![stability-beta](https://img.shields.io/badge/stability-beta-33bbff.svg)](https://github.com/mkenney/software-guides/blob/master/STABILITY-BADGES.md#beta)


Cluster project for university course [Uvod u složeno pretraživanje podataka](http://www.pmf.unizg.hr/math/predmet/uuspp_a), academic year 2020/2021, University of Zagreb, Faculty of Science, Department of Mathematics.


## Kratki opis 
Simultano klasteriranje dokumenata i riječi pomoću modela bipartitnog grafa. U pozadini grupiranja dokumenata je distribucija riječi koje se pojavljuju: dva dokumenta su slična ako se u njima pojavljuju iste/slične riječi. Grupiranje riječi često ide po principu zajedničkog pojavljivanja: dvije riječi su slične ako se zajedno pojavljuju u nekom dokumentu. Budući da su prethodno opisani procesi povezani, proces grupiranja možemo probati provesti simultano. Koristimo model bipartitnog grafa pa se simultano klasteriranje svodi na particioniranje bipartitnog grafa.
Detaljnije o načinu testiranja i rezultatima može se naći u [tekstu](https://github.com/sopetra/cluster/blob/main/Simultano%20klasteriranje%20dokumenata%20i%20rije%C4%8Di.pdf) ili u [sažetku](https://github.com/sopetra/cluster/blob/main/Prezentacija.pdf).

## Pokretanje programa
Testiranje algoritma se postiže pokretanjem `main.m`.


## Licence
  
 [Cluster](https://github.com/sopetra/cluster) © 2021 by [Petra Sočo](https://github.com/sopetra) and [Jelena Zaninović](https://github.com/jelzani) is licensed under [Attribution-NonCommercial-ShareAlike 4.0 International][cc].

[![CC 4.0][cc-image]][cc]


[cc]: https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1
[cc-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg


License can be found under [License](LICENSE).
