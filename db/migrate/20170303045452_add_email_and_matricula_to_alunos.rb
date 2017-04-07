class AddEmailAndMatriculaToAlunos < ActiveRecord::Migration[5.0]
  def change
    add_column :alunos, :matricula, :string
    add_column :alunos, :email, :string
  end
end
