class Playlist < ActiveRecord::Base
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  has_many :artists
  has_many :albums
  belongs_to :user

  validates_presence_of :title

  # def current_playlist
  #   @current_playlist ||= Playlist.where('current = ?', true).first
  # end
end
