class Disciplina < ApplicationRecord
  has_many :historicos

  def nome_com_codigo
    "#{codigo} - #{nome}"
  end
end
