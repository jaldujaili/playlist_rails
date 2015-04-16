class Artist < ActiveRecord::Base
  belongs_to :playlist
  has_many :songs
  has_many :albums
end
