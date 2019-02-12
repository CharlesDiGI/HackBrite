class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def new_attendee_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendee = attendance.attendee
    @event = attendance.event
    @admin = @event.admin

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: "Nouvelle inscription sur #{@event.title} !") 
  end

end
