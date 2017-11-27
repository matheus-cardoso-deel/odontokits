class KitType < ApplicationRecord
    has_many :kits
    validates :type_name, presence: true, length: { in: 1..40 }
end
