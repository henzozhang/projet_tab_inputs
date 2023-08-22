/* Spécifiez le chemin du répertoire */
%let chemin_repertoire = "Chemin_vers_le_repertoire";

/* Liste les fichiers dans le répertoire */
filename dirlist "&chemin_repertoire";
data file_list;
   infile dirlist truncover;
   input filename $256.;
   datalines4;
run;

/* Obtient les métadonnées pour chaque fichier */
data file_info;
   set file_list;

   /* Nom du fichier */
   nom = filename;

   /* Date de création */
   dcrea = datepart(dcreate(filename));

   /* Date d'aujourd'hui */
   dajd = today();

   /* Calcul de la différence en jours */
   decart = dajd - dcrea;
run;

/* Affiche le dataframe */
proc print data=file_info;
run;
