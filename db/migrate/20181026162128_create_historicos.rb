class CreateHistoricos < ActiveRecord::Migration[5.2]
  def change
    create_table :historicos do |t|
      t.references :aluno, foreign_key: true
      t.references :disciplina, foreign_key: true
      t.float :nota
      t.float :notavs
      t.integer :anosemestre
      t.boolean :frequencia
      t.integer :ch

      t.timestamps
    end
  end
end
