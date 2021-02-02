use GestionCom

--Exemple
create procedure listCommande
@numCom int
as 
select * from LigneCommande
where numCom=@numCom

exec listCommande 10

-- Exer1 :
-- Créer une procédure stockée qui permet de calculer le factoriel
-- d’un nombre.create procedure calculeFactoriel
@nombre int
as
  declare @facturiel int=1;
  while (@nombre>=1)
    begin
       set @facturiel=@facturiel*@nombre
       set @nombre=@nombre-1
	end
  print @facturiel
exec calculeFactoriel 0

-- Exer2 :
-- Créer une procédure stockée qui permet d’ajouter une ligne de
-- commande dans la table lignecommande de la base de donnes GestionCom.
create procedure ajouterLigne 
@numCom int,@numArt int,@qteCommandee int
as
  insert into LigneCommande values(@numCom,@numArt,@qteCommandee)

exec ajouterLigne 9,2,5

-- Exer3 :
-- Créer une procédure stockée qui permet d’ajouter à la table
-- lignecommande une colonne Montant qui affiche le montant
-- de chaque ligne de commande.create procedure afficherAvecMontantas  select numCom,Article.numArt,qteCommandee,'montant'=(puart*qteCommandee) from LigneCommande join Article  on LigneCommande.numArt=LigneCommande.numArtexec afficherAvecMontant-- Exer4:
-- Reprendre l’exercice 3 mais cette fois pour une commande
-- dont le numéro de commande est passé en paramètre..
create procedure afficherAvecMontantAt@numCom intas  select numCom,Article.numArt,qteCommandee,'montant'=(puart*qteCommandee) from LigneCommande join Article  on LigneCommande.numArt=LigneCommande.numArt  where numCom=@numComexec afficherAvecMontantAt 1