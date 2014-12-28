class User
  include Mongoid::Document
  include Mongoid::Timestamps # Inclui e treta os campos created_at e updated_at

  field :email, type: String
  field :password, type: Mongoid::EncryptedString
  field :name, type: String
  field :nick, type: String
  field :photo, type: String
  field :slug, type: String
  field :social, type: Hash
  field :status, type: Integer
  field :last_login, type: DateTime

  # has_many :posts
end
