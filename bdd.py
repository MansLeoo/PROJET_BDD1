# -*- coding: utf-8 -*-
"""
Created on Thu Nov 10 08:21:42 2022

@author: Mans Léo
@version: 2.0

LAST_UPDATE : 26/11/2022
"""

def convert_price(f) : 
    """Fonction permettant de convertir un décimal exprimé 
    avec une virgule en décimal exprimé avec un point"""
    stre = ""
    for i in range(len(f)):
        if(f[i] == ",") :
            stre = stre +"."
        else :
            stre = stre + f[i]
    return stre
def remove_quotation_mark(name : str)  : 
    """Fonction permettant de remplacer 
   les simples guillemets par des espaces """
    new_name = ""
    for i in range (len(name)):
        if name[i] == "'" or name[i] == "’" :
            new_name= new_name + " " 
        else :
            new_name = new_name + name[i]
    return new_name

    
def increment_auto(value : list) :
    #   Fonction permettant d'incrémenter automatiquement les données
    #______________________________________________
    lst_edit = [[]]
    nv = False
    for i in range(len(value)) :
        liste=value[i].rstrip().split(";")
        edit_in = False
        if(nv) :
            for j in range(0,len(lst_edit)) :

                if (liste[5] == lst_edit[j][1] or liste[5] == "") :
                    edit_in = True
        else :
            lst_edit[0] =([0,liste[5]])
            edit_in = True
            nv = True
        if not edit_in :
            lst_edit.append([len(lst_edit),liste[5]])
    #______________________________________________________            
    lst_auteur = [[]]
    liste=value[0].rstrip().split(";")
    lst_auteur[0] =([0,liste[4]])
    lst_auteur.append([len(lst_auteur),liste[9]])
    for i in range(len(value)) :
        liste=value[i].rstrip().split(";")
        dess_in = False
        crea_in = False
        scenariste_in = False
        for j in range(0,len(lst_auteur)) :
            if (liste[4] == lst_auteur[j][1] or liste[4] == "") :
                    dess_in = True
        if not dess_in :
            lst_auteur.append([len(lst_auteur),liste[4]])
        for j in range(0,len(lst_auteur)) :
            
                if (liste[3] == lst_auteur[j][1] or liste[3] == "") :
                    scenariste_in = True
        if not scenariste_in :
            lst_auteur.append([len(lst_auteur),liste[3]])
        for j in range(0,len(lst_auteur)) :
                if (liste[9] == lst_auteur[j][1] or liste[9] == "") :
                    crea_in = True
        if not crea_in :
            lst_auteur.append([len(lst_auteur),liste[9]])
    #___________________________________________________________
    lst_genre = [[]]
    nv = False
    for i in range(len(value)) :
        liste=value[i].rstrip().split(";")
        liste[6] = liste[6].lower()
        genre_in = False
        if(nv) :
            for j in range(0,len(lst_genre)) :
                if (liste[6] == lst_genre[j][1] or liste[6] == "") :
                    genre_in = True
        else :
            lst_genre[0] =([0,liste[6]])
            genre_in = True
            nv = True
        if not genre_in :
            lst_genre.append([len(lst_genre),liste[6]])
    #_____________________________________________________________
    lst_serie = [[]]
    nv = False
    for i in range(len(value)) :
        liste=value[i].rstrip().split(";")
        serie_in = False
        if(nv) :
            for j in range(0,len(lst_serie)) :
                if (liste[8] == lst_serie[j][1] or liste[8] == "") :
                    serie_in = True
        else :
            lst_serie[0] =([0,liste[8]])
            serie_in = True
            nv = True
        if not serie_in :
            lst_serie.append([len(lst_serie),liste[8]])
            
    #__________________________________________________________     
    lst_bd = [[]]
    nv = False
    for i in range(len(value)) :
        liste=value[i].rstrip().split(";")
        bd_in = False
        if(nv) :
            for j in range(0,len(lst_bd)) :
                if (liste[1] == lst_bd[j][1] or liste[1] == "") :
                    bd_in = True
        else :
            lst_bd[0] =([0,liste[1],liste[2],liste[3],liste[4],liste[5],liste[6],liste[7],liste[8],liste[9],liste[10],liste[0]])
            bd_in = True
            nv = True
        if not bd_in :
            lst_bd.append([len(lst_bd),liste[1],liste[2],liste[3],liste[4],liste[5],liste[6],liste[7],liste[8],liste[9],liste[10],liste[0]])
    #__________________________________________________________
    
    return [lst_auteur,lst_edit,lst_genre,lst_serie,lst_bd] 

def find_increment(table,name,flag = "") :
    """Fonction permettant de trouver 
    le numero de name dans la table table si il existe """
    if flag != "auteur" :
        for i in range(len(table)) :
            if table[i][1].lower() == name.lower() :
                return table[i][0]
    else :
        for i in range(len(table)) :   
            if table[i][1] in name :
                return table[i][0]
    return "null"   

    
"""______________________GENERATION DES REQUETES______________________"""

def gen_tab_genre(genres) :
    """Génération d'un fichier texte genre.txt dans 
    lequels sont ecrites les requetes d'insertion de la table genre"""
    fich_genre = open("genre.txt", "w")
    for i in range(len(genres)) :
        requete = "insert into  GENRE values("+str(genres[i][0])+","+"'"+genres[i][1]+"');"
        fich_genre.write(requete+"\n")
    fich_genre.close()
def gen_tab_edit(editeurs) :
    """Génération d'un fichier texte editeurs.txt dans 
    lequels sont ecrites les requetes d'insertion de la table serie"""
    fich_edit = open("editeurs.txt", "w")
    for i in range(len(editeurs)) :
        requete = "insert into  EDITEUR values("+str(editeurs[i][0])+","+"'"+editeurs[i][1]+"');"
        fich_edit.write(requete+"\n")
    fich_edit.close()
def gen_tab_series(series,auteurs,bd) :
    """Génération d'un fichier texte series.txt dans 
    lequels sont ecrites les requetes d'insertion de la table serie"""
    fich_series = open("series.txt", "w")
    for i in range(len(series)) :
        no_crea = str(find_increment(auteurs, bd[i][9],"auteur"))
        requete = "insert into  SERIE values("+str(series[i][0])+","+"'"+series[i][1]+"'"+","+no_crea+");"
        fich_series.write(requete+"\n")
    fich_series.close()
def gen_tab_aut(auteurs)  :
    """Génération d'un fichier texte aut.txt dans 
    lequels sont ecrites les requetes d'insertion de la table auteur"""
    
    fich_aut = open("aut.txt", "w")
    for i in range(len(auteurs)) :
        if auteurs[i][1] == "Bob De Groote"  :   #Gestion d'un cas particulier
            aut = ['bob','De Groote']
        elif auteurs[i][1] == "Le Boucher Timothé" : #Gestion d'un cas particulier
            aut = ['Timothé','Le Boucher' ]
        else :
            aut =auteurs[i][1].rstrip().split(" ")
        if len(aut) == 2 :
            requete = "insert into  AUTEUR values("+str(auteurs[i][0])+","+"'"+aut[0]+"'"+","+"'"+aut[1]+"');"
        else :
            requete = "insert into  AUTEUR values("+str(auteurs[i][0])+","+"'"+aut[0]+"'"+","+"'"+""+"');"
        fich_aut.write(requete +"\n")
    fich_aut.close()

def gen_tab_bd(bd,series,editeurs,genres) :
    """Génération d'un fichier texte bd.txt dans 
    lequels sont ecrites les requetes d'insertion de la table BD"""
    fich_bd = open("bd.txt", "w")
    for i in range(len(bd)) :
        no_edit = str(find_increment(editeurs, bd[i][5]))
        no_scen = str(find_increment(auteurs, bd[i][3],"auteur"))
        no_dess = str(find_increment(auteurs, bd[i][4],"auteur"))
        no_genre = str(find_increment(genres, bd[i][6]))
        requete = "insert into BD values("+str(bd[i][0])+","+"'"+remove_quotation_mark(bd[i][1])+"'"+","+bd[i][2]+","+str(convert_price(bd[i][7]))+","+bd[i][10]+","+no_scen+","+no_dess+","+no_genre+","+no_edit+");"
        fich_bd.write(requete +"\n")
    fich_bd.close()       
def gen_tab_appartient(bd,series)  :
    """Génération d'un fichier texte appartient.txt dans 
    lequels sont ecrites les requetes d'insertion de la table APPARTIENT"""
    fich_appar = open("appartient.txt", "w")
    for i in range(len(bd)):
           no_serie = str(find_increment(series, bd[i][8]))
           requete = "insert into APPARTIENT values("+str(bd[i][0])+","+bd[i][11]+","+no_serie+");"
           fich_appar.write(requete +"\n")
    fich_appar.close() 
def gen_tab_carte(valeurs_carte) :
    """Génération d'un fichier texte carte.txt dans 
    lequels sont ecrites les requetes d'insertion de la table CARTE"""
    fich_carte = open("carte.txt", "w")
    for i in range(len(valeurs_carte)):
            val = valeurs_carte[i].rstrip().split(";")
            requete = "insert into  CARTE values("+str(val[0])+","+"'"+val[2]+"'"+",TO_DATE('"+val[1]+"','DD/MM/YYYY'),"+val[4]+","+"'"+val[3]+"'" +");"
            fich_carte.write(requete +"\n")
    fich_carte.close()       
def gen_tab_achat(valeurs_achat,valeurs_carte) :
    """Génération d'un fichier texte achat.txt dans 
    lequels sont ecrites les requetes d'insertion de la table ACHAT"""
    fich_achat = open("achat.txt", "w")
    nb = 0 
    for i in range(len(valeurs_achat)):
            val = valeurs_achat[i].rstrip().split(";")
            for j in range(len(valeurs_carte)):
                val_carte = valeurs_carte[j].rstrip().split(";")
                if (val_carte[2] == val[1] ) :
                    requete = "insert into  ACHAT values("+str(nb)+",TO_DATE('"+val[0]+"','DD/MM/YYYY'),"+str(0)+","+val_carte[0]+");"
                    fich_achat.write(requete +"\n")
                    nb = nb + 1
    fich_achat.close()
def gen_tab_detail_achat(valeurs_achat,bd):
    """Génération d'un fichier texte det_achat.txt dans 
    lequels sont ecrites les requetes d'insertion de la table DETAIL_ACHAT"""
    fich_det_achat = open("det_achat.txt", "w")
    nb = -1
    lst_val = []
    for i in range(len(valeurs_achat)) :
        val = valeurs_achat[i].rstrip().split(";")
        lst_val.append(val)
    for i in range(len(valeurs_achat)) :
        if lst_val[i][0] != "" :
                nb+=1
        for j in range(len(bd)) :
            if lst_val[i][2] == bd[j][1] :
                requete = "insert into  DETAIL_ACHAT values("+str(nb)+","+str(bd[j][0])+","+str(lst_val[i][3])+");"
                fich_det_achat.write(requete +"\n") 
    fich_det_achat.close()  

    
    
    
    
fichier_bd= open("BD.csv","r")
Descripteurs_bd = fichier_bd.readline()
listeDescripteurs_bd = Descripteurs_bd.rstrip().split(";")
valeurs_bd=fichier_bd.readlines() 
lst_bd = increment_auto(valeurs_bd)

auteurs = lst_bd[0]
editeurs = lst_bd[1]
genres = lst_bd[2]
series = lst_bd[3]
bd = lst_bd[4]
for i in valeurs_bd:
    liste=i.rstrip().split(";")
    
gen_tab_aut(auteurs)
gen_tab_genre(genres)
gen_tab_edit(editeurs)
gen_tab_series(series,auteurs,bd)
gen_tab_bd(bd,series,editeurs,genres)
gen_tab_appartient(bd,series)
fichier_bd.close()


fichier_carte= open("CARTE.csv","r")
Descripteurs_carte = fichier_carte.readline()
listeDescripteurs_carte = Descripteurs_carte.rstrip().split(";")
valeurs_carte=fichier_carte.readlines()
gen_tab_carte(valeurs_carte) ; 
fichier_carte.close();


     
fichier_achat= open("achats.csv","r")
Descripteurs_achat = fichier_achat.readline()
listeDescripteurs_achat = Descripteurs_achat.rstrip().split(";")
valeurs_achat=fichier_achat.readlines()
gen_tab_achat(valeurs_achat,valeurs_carte)

gen_tab_achat(valeurs_achat,valeurs_carte)
gen_tab_detail_achat(valeurs_achat,bd)
fichier_achat.close();















