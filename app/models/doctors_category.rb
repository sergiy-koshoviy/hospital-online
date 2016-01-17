# == Schema Information
#
# Table name: doctors_categories
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class DoctorsCategory < ActiveRecord::Base
  has_many :diseases_categories
end
