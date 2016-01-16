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

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
