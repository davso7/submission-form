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
end
