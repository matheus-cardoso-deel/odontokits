class Kit < ApplicationRecord
     belongs_to :aluno
     belongs_to :kit_type
     has_many :feeds, dependent: :destroy
     dragonfly_accessor :image
     validates :aluno_id, presence: true

     def tipo
          if kit_type
               kit_type.type_name
          else
               nome + " - (Cadastre um tipo de caixa para este Kit!)"
          end
     end
end