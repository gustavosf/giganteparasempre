class Post
  include Mongoid::Document
  include Mongoid::Timestamps # Inclui e treta os campos created_at e updated_at

  field :title, type: String
  field :subtitle, type: String, default: nil
  field :slug, type: String, default: nil
  field :content, type: String
  field :html, type: String, default: nil
  field :featured, type: Boolean, default: false
  field :homepage, type: Boolean, default: false
  field :user_id, type: Integer
  field :status, type: String, default: 'draft'
  field :tags, type: Array, default: []
  field :views, type: Integer, default: 0
  field :likes, type: Integer, default: 0
  field :published_at, type: DateTime, default: 0
  field :contributors, type: Array, default: []
  field :images, type: Array, default: []
  field :authors, type: Array, default: []

  belongs_to :user

  # Publica um post, gerando um slug, compilando o html e atualizando demais
  # campos como published_at e status
  def publish
    self.status = 'published'
    self.pubilshed_at = DateTime.now
    self.html = Markdown.parse self.content
    self.slug = self.title.parameterize

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    self.html = md.render(self.content)

    save
  end

  def get_html
    if self.html.nil?
      markdown(self.content)
    else
      self.html
    end
  end

  def get_slug
    self.slug or self.title.parameterize
  end

end
