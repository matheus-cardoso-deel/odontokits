class AddIndexToAlunosEmailsAndMatriculas < ActiveRecord::Migration[5.0]
  def change
        add_index :alunos, :email, unique: true
        add_index :alunos, :matricula, unique: true
  end
end
