class Element
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  # Campos de uso geral e obrigatório
  field :_type
  field :featured, type: Boolean, default: false
  field :homepage, type: Boolean, default: false
end