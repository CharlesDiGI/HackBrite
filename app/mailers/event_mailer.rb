class EventMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def new_event_email(event)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @event = event 
    @admin = event.admin_id 
    @user = User.find(@admin)
    puts "*" *30
    puts @event.inspect
    puts "*" *30
    puts @admin.inspect
    puts "*" *30
    puts @user.email
    puts "*" *30

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Nouvel évènement bien créé !') 
  end

end
