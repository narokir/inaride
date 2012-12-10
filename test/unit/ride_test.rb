# == Schema Information
#
# Table name: rides
#
#  id          :integer          not null, primary key
#  origin      :string(255)
#  destination :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string(255)
#  latitude    :float
#  longitude   :float
#  gmaps       :boolean
#  date        :datetime
#  price       :integer
#  seats       :integer
#  time        :time
#  notes       :text
#

require 'test_helper'

class RideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
