class EventMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def new_event_email(event)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @event = event 
    @admin = event.admin

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://hackbrite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Nouvel évènement bien créé !') 
  end

end
