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

  def invitation_expired?
    return false if self.deadline.nil?
    Date.today >= (self.deadline + 1.day) # We sum plus 1 to ensure it expires at 23:59 of the same day
  end

  def self.create_users(email_list)
    email_list.each do |email|
      u = User.new(email: email)
      u.save
    end
  end

  def self.send_invitations(deadline = nil)
    users = User.where(invitation_sent: false)
    users.each do |user|
      if user.form.nil? #no tiene form entonces se envia
        UserMailer.with(user: user).welcome_email.deliver_now
        user.update_attributes(deadline: deadline, invitation_sent: true)
        puts "Se envio invitacion para [#{user.email}]"
      else
        puts "Invitacion para [#{user.email}] ya fue enviada"
      end
    end
  end

end
