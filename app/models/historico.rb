class Historico < ApplicationRecord
  belongs_to :aluno
  belongs_to :disciplina

  validates :nota, presence: true

  def aprovado?
    return false unless frequencia
    return true if nota >= 6
    return false if nota < 4
    notavs >= 6
  end

  def nota_final
    return nota if nota >= 6 || nota < 4
    nota_vs = notavs.nil? ? 0 : notavs
    return (nota + nota_vs)/2 if nota_vs < 6
    nota_vs
  end
end
