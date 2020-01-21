#ALTER TABLE hist_etab_marseille
#ADD INDEX idx_changeEtatAdminEtab (changementEtatAdministratifEtablissement);

#ALTER TABLE hist_etab_marseille
#ADD INDEX idx_etatAdminEtab (etatAdministratifEtablissement);

#ALTER TABLE hist_etab_marseille
#ADD INDEX idx_dateFin (dateFin);

#ALTER TABLE hist_etab_marseille
#ADD INDEX idx_dateDebut (dateDebut);

#ALTER TABLE etablissement_marseille
#ADD INDEX idx_dateCrea (dateCreationEtablissement);

#ALTER TABLE etablissement_marseille
#ADD INDEX idx_numSiret (siret);

USE opendata ;

DROP TABLE IF EXISTS date_etab_marseille;

CREATE TABLE date_etab_marseille AS 

SELECT etablissement_marseille.siret , dateCreationEtablissement , hist_etab_marseille.dateFin , hist_etab_marseille.dateDebut , codePostalEtablissement 
FROM etablissement_marseille
INNER JOIN hist_etab_marseille ON etablissement_marseille.siret = hist_etab_marseille.siret
WHERE etablissement_marseille.etatAdministratifEtablissement = 'F'
AND changementEtatAdministratifEtablissement = '1';

DROP TABLE IF EXISTS alias_etab_marseille;

CREATE TABLE alias_etab_marseille AS 

SELECT siret , activitePrincipaleEtablissement, LIB_NAP600 , codePostalEtablissement
FROM etablissement_marseille
INNER join nap1973_1993 ON etablissement_marseille.activitePrincipaleEtablissement = nap1973_1993.NAP600

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé , codePostalEtablissement
FROM etablissement_marseille
INNER join naf1993niveaux ON etablissement_marseille.activitePrincipaleEtablissement = naf1993niveaux.N_700
INNER join naf1993sections ON naf1993niveaux.N_17 = naf1993sections.code  

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé , codePostalEtablissement
FROM etablissement_marseille
INNER join naf2003niveaux ON etablissement_marseille.activitePrincipaleEtablissement = naf2003niveaux.N_700
INNER join naf2003sections ON naf2003niveaux.N_17 = naf2003sections.code  

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé , codePostalEtablissement
FROM etablissement_marseille
INNER join naf2008niveaux ON etablissement_marseille.activitePrincipaleEtablissement = naf2008niveaux.NIV5
INNER join naf2008sections ON naf2008niveaux.NIV1 = naf2008sections.code ; 

--------------------------------------------------------------------------


USE opendata ;

ALTER TABLE etablissement_marseille  

DROP TABLE IF EXISTS alias_etab_marseille;

CREATE TABLE alias_etab_marseille AS 

SELECT siret , activitePrincipaleEtablissement, LIB_NAP600 ,codePostalEtablissement
FROM etablissement_marseille
INNER join nap1973_1993 ON etablissement_marseille.activitePrincipaleEtablissement = nap1973_1993.NAP600

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé ,codePostalEtablissement
FROM etablissement_marseille
INNER join naf1993niveaux ON etablissement_marseille.activitePrincipaleEtablissement = naf1993niveaux.N_700
INNER join naf1993sections ON naf1993niveaux.N_17 = naf1993sections.code  

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé ,codePostalEtablissement
FROM etablissement_marseille
INNER join naf2003niveaux ON etablissement_marseille.activitePrincipaleEtablissement = naf2003niveaux.N_700
INNER join naf2003sections ON naf2003niveaux.N_17 = naf2003sections.code  

UNION

SELECT siret , activitePrincipaleEtablissement, Libellé
FROM etablissement_marseille
INNER join naf2008niveaux ON etablissement_marseille.activitePrincipaleEtablissement = naf2008niveaux.NIV5
INNER join naf2008sections ON naf2008niveaux.NIV1 = naf2008sections.code ; 