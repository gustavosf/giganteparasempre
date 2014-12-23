class Album
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :slug
  index({ slug: 1 }, { unique: true })

  has_many :items, primary_key: :slug, foreign_key: :album_slug

end
