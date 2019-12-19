class AddUserToSongs < ActiveRecord::Migration[5.2]
  def up
    add_reference :songs, :user, index: true
    Song.reset_column_information
    user = User.first

    Song.all.each do |song|
        song.user_id = user.id
        song.save!
    end

    change_column_null :songs, :user_id, false
    add_foreign_key :songs, :users
  end

  def down
    remove_foreign_key :songs, :users
    remove_reference :songs, :user, index: true
  end
end
