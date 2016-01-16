# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  url        :string(255)
#  latitude   :float
#  longitude  :float
#  states     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Country < ActiveRecord::Base
  has_many :states

  def self.prepare_list
    list = {}
    Country.where(name: [
                      'United States',
                      'Canada',
                      'United Kingdom',
                      'Australia'
                  ]).order('name DESC').map{|c| list[c.name]=c.id}
    Country.where("\"name\" NOT IN ('United States', 'Canada', 'United Kingdom', 'Australia')").order('name ASC').map{|c| list[c.name]=c.id}
    list
  end
end
