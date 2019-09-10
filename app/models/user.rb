# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  auth_token :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_secure_token :auth_token
  has_one :form

  def self.create_users(email_list)
    email_list.each do |email|
      u = User.new(email: email)
      u.save
    end
  end

  def self.send_invitations
    users = User.all
    users.each do |user|
      if user.form.nil? #no tiene invitacion entonces se envia
        UserMailer.with(user: user).welcome_email.deliver_now
        puts "Se envio invitacion para [#{user.email}]"
      else
        puts "Invitacion para [#{user.email}] ya fue enviada"
      end
    end
  end

end
