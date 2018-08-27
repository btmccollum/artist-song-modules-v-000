require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  #sorts through the class array @@artists and returns any instances where the block name matches in a new array
  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  #instantiates a new object of Artist with an empty songs array and stores the object in the class variable array
  def initialize
    @@artists << self
    @songs = []
  end

  #allows use to return an array of all the Artist objects that have been created
  def self.all
    @@artists
  end

  #clears out the class variable array
  def self.reset_all
    self.all.clear
  end

  #returns the number of Artist objects that have been instantiated
  def self.count
    @@artists.count
  end

  #allows user to add a song for the specified Artist object and stores the song, and tells the song that it belongs to this instance of arttist
  def add_song(song)
    @songs << song
    song.artist = self
  end

  #sorts through the provided songs array and creates a new song for each one
  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  #take the name, puts it in all lowercase and subs out all white space for '-'
  def to_param
    name.downcase.gsub(' ', '-')
  end

end
