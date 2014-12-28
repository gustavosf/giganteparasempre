class Video
  include Mongoid::Document
  include Mongoid::Timestamps # Inclui e treta os campos created_at e updated_at
  include Mongoid::Attributes::Dynamic

  field :uploaded, type: DateTime # Forced type coercion
  field :updated, type: DateTime # Forced type coercion
end
