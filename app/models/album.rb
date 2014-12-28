class Album < Element

  # Campos deste elemento
  field :slug, type: String
  field :title, type: String
  field :description, type: String
  field :cover, type: String
  field :fb_link, type: String
  field :host, type: String
  field :host_thumbs, type: String

  # index({ slug: 1 }, { unique: true })
  has_many :photos, primary_key: :slug, foreign_key: :album_slug

end
