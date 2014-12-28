class Link < Element

  # Campos deste elemento
  field :date, type: Date
  field :title, type: String
  field :headline, type: String
  field :media, type: String
  field :image, type: String
  field :links, type: String

  def self.template
    "link-tmpl"
  end

end
