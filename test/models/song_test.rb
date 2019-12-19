require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    setup do
      @user = users(:one)
    end
  test 'should not save empty note' do
    song = Song.new

    song.save
    refute.song.valid?
  end

  test 'should save valid song' do
    song = Song.new

    song.title = 'My Song'
    song.description = 'My song is very special.'
    song.user = @user

    song.save
    assert song.valid?
  end

  test 'should not save duplicate song title' do
    song1 = Song.new
    song1.title = 'My Song'
    song1.description = 'My song is very special.'
    song1.user = @user
    song1.save
    assert song1.valid?

    song2 = Song.new
    song2.title = 'My Song'
    song2.description = 'My song is very special.'
    song1.user = @user
    song2.save
    assert song2.valid?
  end

end
