require 'test_helper'

class InfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @song = songs(:one)
  end

  test 'should not save empty info' do
    info = Info.new

    info.save
    refute info.valid?
  end

  test 'should save valid info' do
    info = Info.new

    info.title = 'My Info'
    info.song = @song

    info.save
    assert info.valid?
  end
end
