require_all 'lib'
require 'pry'


class MusicLibraryController

include Findable
extend Findable

  attr_accessor :path


def initialize(path = './db/mp3s')
@path = path
@library = MusicImporter.new(@path)
@library.import
end

def call
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
  puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
  puts "To play a song, enter 'play song'."
  puts "To quit, type 'exit'."

  until @input == 'exit'
      puts "What would you like to do?"
        @input = gets.chomp
      #  @new.send @input.gsub("'","").to_sym
    end

end

def library
  @library
end

#def name_sort(arr)
#arr.sort{|a, b| a.name <=> b.name}
#end

def list_songs
name_sort(Song.all).each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
end

def list_artists
#  list = Artist.all
name_sort(Artist.all).each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
end

def list_genres
name_sort(Genre.all).each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
end

def list_songs_by_artist

puts "Please enter the name of an artist:"
artist = Artist.find_by_name(gets.chomp)
  if Artist.all.include?(artist) == true
    name_sort(artist.songs).each_with_index { |song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}" }
  end
end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  genre = Genre.find_by_name(gets.chomp)
    if Genre.all.include?(genre) == true

    name_sort(genre.songs).each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}" }

    end
end

def play_song
puts "Which song number would you like to play?"
#input = gets.chomp
num = gets.chomp.to_i - 1
arr = []
#list = name_sort(Song.all)

name_sort(Song.all).each { |song| arr << song }
if num >= 0 && num <= arr.last.index
choice = arr[num]
puts "Playing #{choice.name} by #{choice.artist.name}"
#binding.pry
#  if Song.all.include?(song) == true
#    puts "Playing #{song.name} by #{song.artist.name}"
#  end
end
end

end
