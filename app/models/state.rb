# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  country_id :integer
#  code       :string(255)
#  url        :string(255)
#  name       :string(255)
#  latitude   :float
#  longitude  :float
#  cities     :integer
#  created_at :datetime
#  updated_at :datetime
#

class State < ActiveRecord::Base
  belongs_to :country

  def self.prepare_list
    State.all.map{|p| [p.name, p.id]}
  end

  def self.states_by_country(country_id)
    State.where(country_id: country_id).map{|state| {name: state.name, id: state.id}}
  end
end
