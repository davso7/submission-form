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
    Time.now.in_time_zone('Central America').to_date >= (self.deadline + 1.day) # We sum plus 1 to ensure it expires at 23:59 of the same day
  end

  def human_deadline
    return '' if deadline.nil?
     "#{I18n.t(deadline.strftime('%a'), locale: :es)} #{deadline.strftime('%d')} de #{I18n.t(deadline.strftime('%b'), locale: :es)} del #{deadline.strftime('%Y')}"
  end

  def self.create_users(email_list)
    email_list.each do |email|
      u = User.new(email: email)
      u.save
    end
  end

  def reset_invitation
    self.deadline = nil
    self.invitation_sent = false
    self.save
  end

  def self.send_invitations(deadline = nil)
    if deadline.nil?
      Rails.logger.info('Deadline vacio')
      return false
    end
    users = User.where(invitation_sent: false)
    users.each do |user|
      if user.form.nil? #no tiene form entonces se envia
        user.update_attributes(deadline: deadline, invitation_sent: true)
        UserMailer.with(user: user).welcome_email.deliver_now
        Rails.logger.info "Se envio invitacion para [#{user.email}]"
      else
        Rails.logger.info "Invitacion para [#{user.email}] ya fue enviada"
      end
    end
  end

end
