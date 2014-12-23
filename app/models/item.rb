class Item
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :album, primary_key: :slug, foreign_key: :album
end
