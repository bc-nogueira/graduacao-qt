module HistoricosHelper
  def disciplinas_para_select(selected = nil)
    disc_ordenadas = Disciplina.all.sort_by(&:nome)
    disciplinas = disc_ordenadas.map { |d| [d.nome_com_codigo, d.id] }
    options_for_select(disciplinas, selected)
  end

  def periodos_para_select(selected = nil)
    periodos = %w[20151 20152 20161 20162 20171 20172 20181 20182]
    options_for_select(periodos, selected)
  end
end
