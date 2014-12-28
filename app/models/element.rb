class Element
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  # Campos de uso geral e obrigatório
  field :featured, type: Boolean, default: false
  field :homepage, type: Boolean, default: false

  private

    def host
      "https://googledrive.com/host/0B4MkiRPnlC9uNnhYaXN6WDNpakE/"
    end
end