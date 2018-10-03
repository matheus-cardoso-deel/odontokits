class Aluno < ApplicationRecord
  has_many :kits, dependent: :destroy
  has_many :feeds, :through => :kits
  default_scope -> { order(nome: :asc) }
  before_save { self.email = email.downcase }
  
  validates(:nome, presence: true, length: { maximum: 50 })
  validates :matricula, presence: true, length: { maximum: 12 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?
  validates :periodo, length: { maximum: 20 }
end