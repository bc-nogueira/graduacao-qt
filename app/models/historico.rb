class Historico < ApplicationRecord
  belongs_to :aluno
  belongs_to :disciplina

  def aprovado?
    return false unless frequencia
    return true if nota >= 6
    return false if nota < 4
    notavs >= 6
  end

  def nota_final
    return nota if nota >= 6
    return (nota + notavs)/2 if notavs < 6
    notavs
  end
end
