class CreateKits < ActiveRecord::Migration[5.0]
  def change
    create_table :kits do |t|
      t.string :nome
      t.string :image_uid
      t.references :aluno, foreign_key: true

      t.timestamps
    end
    add_index :kits, [:aluno_id, :created_at]
  end
end
