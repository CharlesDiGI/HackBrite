# README

Créé par **Charles Di Giampietro** (**@Charl** sur Slack)

Après le Facebook du pauvre, voilà la version française d'Eventbrite codé par le stagiaire

Mais juste la version back pour l'instant, faut pas déconner

## Step by step pour tester le projet chez oit

Comme d'hab: `git clone` `bundle install` puis `rails db:create db:migrate db:seed`

## Herokuku

Tu peux voir le site en live sur: [Heroku](https://event-brite-by-charl.herokuapp.com/)

De là bas tu peux créer des users, des events, etc. Attention si tu fais un `Heroku run rail db:seed`, à cause de la limite du nombre d'envoi de mails par jour de SendGrid, il se peut que ça bloque et que les mails ne partent plus (et que tu bloque ma clé API aussi mais bon...)

## Que se passe-t-il après le seed?

A chaque création de user, tu lui as envoyé un mail en lui disant un truc du style `bravo champion`

Puis des events ont été créés.

Et enfin des users ont voulu rejoindre ces super events, et tu as envoyé un mail au créateur de l'event (l'admin), en lui disant `bravo Jean-Mimi, un user a rejoint ton event 'barbecue sur les champs jeudi en 8, venez nombreux et ramenez des merguez'`

Tu peux aller vérifier tout ça sur [Yopmail](http://www.yopmail.com) si tu veux. 
Rentre les emails des users dans le champ de recherche. Emails que tu peux retrouver en faisant `rails console` puis un petit `tp User.all` des familles pour pouvoir les afficher.

## Les tests ? Quels tests ?

Lance un petit `rspec` dans ton terminal et tadam

bisous gros :heart:


