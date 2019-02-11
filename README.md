# README

Créé par **Charles Di Giampietro** (**@Charl** sur Slack)

Après le Facebook du pauvre, voilà la version française d'Eventbrite codé par le stagiaire

Mais juste la version back pour l'instant, faut pas déconner

## Step by step pour tester le projet chez oit

Comme d'hab: `git clone` `bundle install` puis `rails db:create db:migrate db:seed`

## Que s'est-il passé ?

A chaque création de user, tu lui as envoyé un mail en lui disant un truc du style `bravo champion`

Puis des events ont été créés.

Et enfin des users ont voulu rejoindre ces super events, et tu as envoyé un mail au créateur de l'event (l'admin), en lui disant `bravo Jean-Mimi, un user a rejoint ton event 'barbecue sur les champs jeudi en 8, venez nombreux et ramenez des merguez'`

Tu peux aller vérifier tout ça sur [Yopmail](www.yopmail.com) si tu veux. 
Rentre les emails des users dans le champ de recherche. Emails que tu peux retrouver en faisant `rails console` puis un petit `tp User.all` des familles pour pouvoir les afficher.

## Les tests ? Quels tests ?

Lance un petit `rspec` dans ton terminal et ensuite croise les doigts

bisous gros :heart:


