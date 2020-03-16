require 'pry'
#class Artist

#extend Concerns::Findable

#@@all = []

#attr_accessor :name

#def initialize(name)
#@genres = []
#@songs = []
#@name = name
#self.save
#end

#def songs
#@songs
#end

#def add_song(song)
#if songs.none?(song) == true && song.artist == nil
##  notes = Song.new(song, self)
#  @songs << song
#  song.artist = self
#end
#end

#def save
#@@all << self
#end

#def genres
#songs.each do |song|
#  if song.artist == self
#    @genres << song.genre
#  end
#end
#@genres.uniq
#end

#def self.create(name)
#artist = Artist.new(name)
#artist
#end

#def self.all
#@@all.uniq
#end

#def self.destroy_all
#  @@all.clear
#end

#end





class Artist

extend Concerns::Findable
include Findable

@@all = []

attr_accessor :name

def initialize(name)
#@genres = []
@songs = []
@name = name
self.save
end

def songs
  Song.all.each do |song|
    if song.artist == self && @songs.none?(song) == true
      @songs << song
    end
  end
##  @songs.each do |song|if song.genre != nil && # @genres.none?(song.genre)
  ##  @genres << song.genre
   ##end
  ##end
@songs
end

def add_song(song)
if songs.none?(song) == true && song.artist == nil
#  notes = Song.new(song, self)
  @songs << song
  song.artist = self
end
end

def save
@@all << self
end

def genres
  arr = []
##self.songs
self.songs.each do |song|
  if song.genre != nil
    arr << song.genre
  end
end
arr.uniq
#songs.each{|song| @genres << song.genre}
##@genres.uniq
end

def self.create(name)
artist = Artist.new(name)
artist
end

def self.all
@@all.uniq
end

def self.destroy_all
  @@all.clear
end

end
