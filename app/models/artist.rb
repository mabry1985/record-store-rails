class Artist < ApplicationRecord
  has_many :album_artists
  has_many :albums, :through => :album_artists
end
