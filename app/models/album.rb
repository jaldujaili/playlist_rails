class Album < ActiveRecord::Base
  belongs_to :artist
  belongs_to :playlist
  has_many :songs
end
