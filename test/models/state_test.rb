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

require 'test_helper'

class StateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
