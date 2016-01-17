# == Schema Information
#
# Table name: medical_histories
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  diseases_category_id :integer
#  description          :text
#  created_at           :datetime
#  updated_at           :datetime
#

class MedicalHistory < ActiveRecord::Base

  validates_presence_of :user_id, :diseases_category_id

  belongs_to :user
  belongs_to :diseases_category

  has_and_belongs_to_many :symptoms
end
