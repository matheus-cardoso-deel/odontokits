class AddPasswordToAlunos < ActiveRecord::Migration[5.0]
  def change
    add_column :alunos, :password_digest, :string
  end
end
