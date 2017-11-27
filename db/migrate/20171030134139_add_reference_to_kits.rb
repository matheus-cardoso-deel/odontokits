class AddReferenceToKits < ActiveRecord::Migration[5.0]
  def change
    add_reference :kits, :kit_type, foreign_key: true
  end
end
