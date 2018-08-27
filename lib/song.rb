require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

  #empty class variable array to store all instantiated Song objects in
  @@songs = []

  #instantiate an instance of Song and stores it in the class variable array
  def initialize
    @@songs << self
  end

  #class methods to find all songs containing the specified name
  def self.find_by_name(name)
    @@songs.detect{|a| a.name == name}
  end

  #sets the song's artist to the artist specified
  def artist=(artist)
    @artist = artist
  end

  #clears out the class variable array of all instantiated Song objects
  def self.reset_all
    @@songs.clear
  end

  #changes the name to all lowercase and subs all white space for '-'
  def to_param
    name.downcase.gsub(' ', '-')
  end

  #provides a count of all Song objects instantiated
  def self.count
    self.all.count
  end

  #returns a list of all Song objects that have been instantiated
  def self.all
    @@songs
  end
end
