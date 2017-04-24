class Kit < ApplicationRecord
     belongs_to :aluno
     has_many :feeds, dependent: :destroy
     dragonfly_accessor :image
     validates :aluno_id, presence: true
     validates :nome, presence: true, length: { maximum: 50 }
end