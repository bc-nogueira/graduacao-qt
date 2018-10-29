RSpec.describe HistoricosHelper, type: :helper do
  describe '#disciplinas_para_select' do
    let!(:disc) { FactoryBot.create :disciplina }

    subject { helper.disciplinas_para_select }

    it { is_expected.to have_selector(:option, text: disc.nome_com_codigo) }
    it { is_expected.to have_selector(:option, text: disc.id) }
  end

  describe '#periodos_para_select' do
    subject { helper.periodos_para_select }

    it { is_expected.to have_selector(:option, text: '20151') }
  end
end
