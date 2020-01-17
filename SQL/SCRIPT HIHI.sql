USE opendata;
SELECT siret , activitePrincipaleEtablissement, LIB_NAP15
FROM etab
INNER join nap1973_1993 ON etab.activitePrincipaleEtablissement = nap1973_1993.NAP600
WHERE codePostalEtablissement LIKE '130%'

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé
FROM etab
INNER join naf1993niveaux ON etab.activitePrincipaleEtablissement = naf1993niveaux.N_700
INNER join naf1993sections ON naf1993niveaux.N_17 = naf1993sections.code
WHERE codePostalEtablissement LIKE '130%'

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé
FROM etab
INNER join naf2003niveaux ON etab.activitePrincipaleEtablissement = naf2003niveaux.N_700
INNER join naf2003sections ON naf2003niveaux.N_17 = naf2003sections.code 
WHERE codePostalEtablissement LIKE '130%'

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé
FROM etab
INNER join naf2008niveaux ON etab.activitePrincipaleEtablissement = naf2008niveaux.NIV5
INNER join naf2008sections ON naf2008niveaux.NIV1 = naf2008sections.code
WHERE codePostalEtablissement LIKE '130%'
; 


----------------------------------------------------------------------------------------------------------------


USE opendata ;
ALTER TABLE etablissement_marseille
ADD INDEX idx_codeAct (activitePrincipaleEtablissement) ;
CREATE TABLE alias_etab_marseille AS 
SELECT siret , activitePrincipaleEtablissement, LIB_NAP15
FROM etablissement_marseille
INNER join nap1973_1993 ON etablissement_marseille.activitePrincipaleEtablissement = nap1973_1993.NAP600

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé
FROM etablissement_marseille
INNER join naf1993niveaux ON etablissement_marseille.activitePrincipaleEtablissement = naf1993niveaux.N_700
INNER join naf1993sections ON naf1993niveaux.N_17 = naf1993sections.code  

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé
FROM etablissement_marseille
INNER join naf2003niveaux ON etablissement_marseille.activitePrincipaleEtablissement = naf2003niveaux.N_700
INNER join naf2003sections ON naf2003niveaux.N_17 = naf2003sections.code  

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé
FROM etablissement_marseille
INNER join naf2008niveaux ON etablissement_marseille.activitePrincipaleEtablissement = naf2008niveaux.NIV5
INNER join naf2008sections ON naf2008niveaux.NIV1 = naf2008sections.code ; 
INNER join naf2008sections ON naf2008niveaux.NIV1 = naf2008sections.code 
; 

