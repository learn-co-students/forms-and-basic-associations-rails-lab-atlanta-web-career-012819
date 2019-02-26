class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    # byebug
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
    # binding.pry
    notes.each do |n|
      note = Note.find_or_create_by(content: n)
      # self.notes << note if !note.content.empty?
      self.notes << note if note.valid?
    end
  end

  def note_contents
    # binding.pry
    self.notes.collect { |n| n.content }
  end

end
