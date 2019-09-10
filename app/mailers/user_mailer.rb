class UserMailer < ApplicationMailer
  default from: 'seminariociap2019@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://ciap-submission-form.herokuapp.com/forms/new?auth_token='
    mail(to: @user.email, subject: 'Inscripciones Seminario CIAP 2019')
  end

  def confirmation_email
    @form = params[:form]
    mail(to: @form.email, subject: 'Confirmación de inscripción al Seminario CIAP 2019')
  end
end
