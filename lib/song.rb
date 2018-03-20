erequire 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@song_count = 0

  def initialize(name)
      @name = name
      @@song_count += 1
  end

  def self.new_by_filename(filename)
    splice = filename.split(/( - |\.)/)
    new_instance = Song.new(splice[2])
    new_instance.artist = splice[0]
    new_artist = Artist.find_or_create_by_name(new_instance.artist)
    new_artist.add_song(self)
  end


end


# splice = filename.split(/( - |\.)/) #=> ["artist", " - ", "title", " - ", "genre", ".", "mp3"]
