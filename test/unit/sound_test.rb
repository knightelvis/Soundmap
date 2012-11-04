# == Schema Information
#
# Table name: sounds
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  location    :string(255)
#  path        :string(255)
#  username    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SoundTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
