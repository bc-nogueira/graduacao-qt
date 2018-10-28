class HistoricosController < ApplicationController
  def new
    @historico = Historico.new
    @historico.aluno = Aluno.find(params[:aluno_id])
  end

  def create
    @historico = Historico.new(historico_params)
    redirect_to aluno_path(@historico.aluno_id) and return if @historico.save
    render :new
  end

  private

  def historico_params
    params.require(:historico).permit(:aluno_id, :disciplina_id, :anosemestre,
                                      :nota, :notavs, :frequencia)
  end
end
