class Video < Element

  # Campos deste elemento
  field :uploaded, type: DateTime # Forced type coercion
  field :updated, type: DateTime # Forced type coercion

  def self.template
    "video-tmpl"
  end

end
