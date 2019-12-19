class Song < ApplicationRecord
  belongs_to :user
  has_many :infos, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true

  scope :user_songs, ->(user) { where(['user_id = ?', user.id]) }
end