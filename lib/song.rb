require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    x = self.new
    x.name = title
    x
  end

  def self.create_by_name(title)
    x = self.create
    x.name = title
    x
  end

  def self.find_by_name(title)
    result = all.collect do |song|
      if song.name == title
        song
      end
    end
    result.compact[0]
  end

  def self.find_or_create_by_name(title)
    if find_by_name(title) == nil
      create_by_name(title)
    else find_by_name(title)
    end
  end

  def self.alphabetical
    all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    file.slice!(".mp3")
    info = file.split(" - ")
    song = new_by_name(info[1])
    song.artist_name = info[0]
    song
  end

  def self.create_from_filename(file)
    file.slice!(".mp3")
    info = file.split(" - ")
    song = create_by_name(info[1])
    song.artist_name = info[0]
    song
  end

  def self.destroy_all
    @@all = []
  end

end
