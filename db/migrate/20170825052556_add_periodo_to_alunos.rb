class AddPeriodoToAlunos < ActiveRecord::Migration[5.0]
  def change
    add_column :alunos, :periodo, :integer
  end
end
