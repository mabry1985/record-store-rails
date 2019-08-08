class Artist < ApplicationRecord
  has_many :album_artists
  has_many :albums, :through => :album_artists
  has_many :artist_genres
  has_many :genres, :through => :artist_genres
end
