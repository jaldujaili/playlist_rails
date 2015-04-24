class Playlist < ActiveRecord::Base
  has_many :songs
  has_many :artists
  has_many :albums, through: :artists
  belongs_to :user

  validates_presence_of :title
end
