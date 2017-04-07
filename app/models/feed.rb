class Feed < ApplicationRecord
  belongs_to :kit
  default_scope -> { order(created_at: :desc) }
  
  def texto
    if tipo.downcase == "entrada"
      "Entrada"
    else
      "Saída"
    end
  end
  
end
