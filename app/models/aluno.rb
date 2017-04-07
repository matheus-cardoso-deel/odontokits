class Aluno < ApplicationRecord
  has_many :kits, dependent: :destroy
  has_many :feeds, :through => :kits
  dragonfly_accessor :image
  before_save { self.email = email.downcase }
  
  validates(:nome, presence: true, length: { maximum: 50 }) #try removing the parenthesis, it's magic!
  validates(:matricula, presence: true, length: { is: 10 }) #try removing the parenthesis, it's magic!
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
