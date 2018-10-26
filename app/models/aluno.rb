class Aluno < ApplicationRecord
  has_many :historicos

  def calcula_cr
    ch_total = 0
    ch_nota_total = 0
    historicos.each do |historico|
      next unless historico.aprovado?
      ch_total = ch_total + historico.ch
      ch_nota_total = ch_nota_total + (historico.nota_final * historico.ch)
    end
    ch_nota_total/ch_total
  end
end
