# == Schema Information
#
# Table name: maps
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  origin      :string(255)
#  destination :string(255)
#  longitude   :float
#  latitude    :float
#  waypoint_1  :string(255)
#  gmaps       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class MapTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
