#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jan 14 10:07:02 2020

@author: utilisateur
"""

# - Nombre d'établissement par secteurs  OK 
# - Nombre d'établissement par arrondissement OK 
# - Nombre d'établissement par secteur + arrondissement OK 
# - Duré de vie (moyenne) 
# - Evolution du nombre d'établissement ces 10 dernières années %
# - Ancienneté des établissement toujours ouverte 
# - Proportion des établissment selon leurs classification (ex : PME ect..)




from sqlalchemy import create_engine
import pandas as pd
import pymysql

engine = create_engine("mysql+pymysql://root:@localhost/opendata")

#Bolean tant que running = True.

#Function wich read sql
#def rd() :
        

#Function wich creat the starting menu
def start() :
    a = "0"
    running = True
    while running == True :
        a = input("\nBienvenue!\n\nTapez 1 pour afficher le nombre d'entreprise par secteur d'activité.\nTapez 2 pour afficher le nombre d'entreprise par arrondissement.\nTapez 3 afficher le nombre d'entreprise en fonction de son arrondissement et de son secteur d'activité.\nTapez 4 pour acceder au quatrième choix.\nTapez 5 pour quitter.\n\n")
        if a == "1" :   
            y = input("Veuillez selectionner un secteur d'activité.\n")
            df = pd.read_sql('SELECT LIB_NAP600 as Secteur, codePostalEtablissement as CP, COUNT(*) as nbr FROM alias_etab_marseille WHERE LIB_NAP600 = "%s" GROUP BY LIB_NAP600,codePostalEtablissement ORDER BY CP' % (y) ,engine)
            print(df)
        elif a == "2" :
            y = input("Veuillez selectionner un arrondissement\n")
            df = pd.read_sql('SELECT LIB_NAP600 as Secteur, codePostalEtablissement as CP, COUNT(*) as nbr FROM alias_etab_marseille WHERE codePostalEtablissement = "%s" GROUP BY LIB_NAP600, codePostalEtablissement ORDER BY Secteur' % (y) ,engine)
            print(df)
        elif a == "3" :
            print("Vous  le troisième choix.\n")
            n = input("Selectionner secteur d'activité.\n")
            y = input("Selectionner un arrondissement.\n")
            df = pd.read_sql('SELECT LIB_NAP600 AS Secteur , codePostalEtablissement AS CP, COUNT(*) as nbr FROM alias_etab_marseille WHERE codePostalEtablissement = "%s" AND LIB_NAP600 = "%s" GROUP BY LIB_NAP600, codePostalEtablissement ORDER BY Secteur' % (y,n),engine)
            print(df)
        elif a == "4" :
            print("vous venez de choisir le quatrième choix.\n")
        elif a == "5" :
            quitter = "Y" or "y" 
            if quitter == "Y" or quitter == "y":
                print("Fermeture")
                running = False
        else :
            start()
           
            
start()
        