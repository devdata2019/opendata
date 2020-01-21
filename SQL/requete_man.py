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
        a = input("Bienvenue!\n\nTapez 1 pour acceder au premier choix.\nTapez 2 pour acceder au second choix.\nTapez 3 pour acceder au troisième choix.\nTapez 4 pour acceder au quatrième choix.\nTapez 5 pour quitter.\n")
        if a == "1" :   
            print("Vous venez de choisir le premier choix.\n")
            y = input("Selectionner un secteur\n")
            df = pd.read_sql('SELECT COUNT(*) FROM alias_etab_marseille WHERE LIB_NAP600 = "%s"' % (y) ,engine)
            print(df)
        elif a == "2" :
            print("vous venez de choisir le second choix.\n")
            y = input("Selectionner un arrondissement\n")
            df = pd.read_sql('SELECT COUNT(*) FROM alias_etab_marseille WHERE codePostalEtablissement = "%s"' % (y) ,engine)
            print(df)
        elif a == "3" :
            print("vous venez de choisir le troisième choix.\n")
            n = input("Selectionner arrondissement\n")
            y = input("Selectionner un secteur\n")
            df = pd.read_sql('SELECT COUNT(*) FROM alias_etab_marseille WHERE codePostalEtablissement = "%s" AND LIB_NAP600 = "%s"' % (y,n),engine)
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
        