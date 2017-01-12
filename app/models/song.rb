class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  ## setter ##
  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end
  ## getter ##
  def genre_name
     self.try(:genre).try(:name)  #self.genre.name if self.genre!=nil
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
   self.artist = artist
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def note_contents=(notes)
    notes.each do |content|
     if content.strip != ''
      # self.notes << Note.new(song_id: self.id, content: content)
       self.notes.build(content: content)
     end
    end
  end

  def note_contents
    # self.notes.map(&:content)
      self.notes.map do |note|
        note.content
      end
  end
end
