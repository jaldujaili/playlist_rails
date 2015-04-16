class Playlist < ActiveRecord::Base
  has_many :songs
  has_many :artists
  has_many :albums, through: :artists
end
