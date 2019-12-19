class Info < ApplicationRecord
  belongs_to :song
  validates :title, :song, presence: true

  scope :user_infos, ->(user) { joins(:song).where(['user_id = ?', user.id])}
end
