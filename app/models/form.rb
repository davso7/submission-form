# == Schema Information
#
# Table name: forms
#
#  id          :integer          not null, primary key
#  nombre      :string
#  apellidos   :string
#  cedula      :integer
#  email       :string
#  telefono    :integer
#  institucion :string
#  cargo       :string
#  profesion   :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Form < ApplicationRecord
  belongs_to :user
end
