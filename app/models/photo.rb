class Photo < Element

  # Campos do tipo foto
  field :link, type: String
  field :author, type: String
  field :description, type: String
  field :date, type: String
  field :download_link, type: String
  field :basename, type: String
  field :likes, type: Integer, default: 0
  field :album_slug, type: String

  belongs_to :album, primary_key: :slug, foreign_key: :album_slug

  def full
    host + "albuns/full/#{self.album_slug}/#{self.basename}"
  end

  def thumb
    host + "albuns/thumbs/#{self.album_slug}/#{self.basename}"
  end

  def self.template
    "gallery-image-tmpl"
  end

end
