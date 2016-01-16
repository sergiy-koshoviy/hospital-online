# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  address_line1 :string(255)
#  address_line2 :string(255)
#  city          :string(255)
#  state_id      :string(255)
#  country_id    :string(255)
#  zip_code      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
