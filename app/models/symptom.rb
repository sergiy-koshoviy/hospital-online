# == Schema Information
#
# Table name: symptoms
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  diseases_category_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class Symptom < ActiveRecord::Base
  has_and_belongs_to_many :medical_histories
end
