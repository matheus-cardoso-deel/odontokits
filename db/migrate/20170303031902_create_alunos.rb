class CreateAlunos < ActiveRecord::Migration[5.0]
  def change
    create_table :alunos do |t|
      t.string :image_uid
      t.string :nome

      t.timestamps
    end
  end
end
