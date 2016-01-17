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

require 'test_helper'

class MedicalHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
