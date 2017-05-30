class Feed < ApplicationRecord
  
  before_save {self.tipo = formatted_tipo}
  belongs_to :kit
  default_scope -> { order(created_at: :desc) }
  
  def formatted_tipo
    if tipo.downcase == "entrada"
      "Entrada"
    else
      "Saída"
    end
  end
  
end
