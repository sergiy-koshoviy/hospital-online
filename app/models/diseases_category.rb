# == Schema Information
#
# Table name: diseases_categories
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  doctors_category_id :string(255)
#

class DiseasesCategory < ActiveRecord::Base
    belongs_to :doctors_categories
end
