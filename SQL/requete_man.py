#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jan 14 10:07:02 2020

@author: utilisateur
"""

from sqlalchemy import create_engine
import pandas as pd
import pymysql

engine = create_engine("mysql+pymysql://root:@localhost/opendata")

#Bolean tant que running = True.



def start() :
    a = "0"
    running = True
    while running == True :
        a = input("Bienvenue!\n\nTapez 1 pour acceder au premier choix.\nTapez 2 pour acceder au second choix.\nTapez 3 pour acceder au troisième choix.\nTapez 4 pour acceder au quatrième choix.\nTapez 5 pour quitter.")
        if a == "1" :
            print("vous venez de choisir le premier choix")
        elif a == "2" :
            print("vous venez de choisir le second choix")
        elif a == "3" :
            print("vous venez de choisir le troisième choix")
        elif a == "4" :
            print("vous venez de choisir le quatrième choix")
        elif a == "5" :
            quitter = "Y" or "y" 
            if quitter == "Y" or quitter == "y":
                print("Fermeture")
                running = False
        else :
            start()
           
            
start()
        