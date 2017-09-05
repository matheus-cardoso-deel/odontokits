class AddPeriodoToAlunos < ActiveRecord::Migration[5.0]
  def change
    add_column :alunos, :periodo, :string
  end
end
