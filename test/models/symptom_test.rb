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

require 'test_helper'

class SymptomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
