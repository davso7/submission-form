class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://ciap-submission-form.herokuapp.com/forms/new?auth_token='
    mail(to: @user.email, subject: 'PRUEBA: Inscripciones Seminario CIAP 2019')
  end
end
