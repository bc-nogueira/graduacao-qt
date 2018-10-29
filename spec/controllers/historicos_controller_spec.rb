RSpec.describe HistoricosController, type: :controller do
  let(:aluno) { FactoryBot.create :aluno }
  let(:disciplina) { FactoryBot.create :disciplina }

  describe 'GET #new' do
    before(:each) { get :new, params: { aluno_id: aluno.id } }

    it { expect(response.status).to eq 200 }
    it { is_expected.to render_template :new }

    it 'Deve atribuir a variável corretamente' do
      expect(assigns(:historico))
          .to be_a_new Historico
    end
  end

  describe 'POST #create' do
    subject do
      post :create, params: { historico: params }
    end

    let(:params_validos) do
      { aluno_id: aluno.id, disciplina_id: disciplina.id, anosemestre: '20181',
        nota: 7.0, frequencia: true }
    end
    let(:params_invalidos) { { nota: 7.0 } }

    context 'Quando os parâmetros são válidos' do
      let(:params) { params_validos }

      it { expect(response.status).to eq 200 }
      it { is_expected.to redirect_to(aluno_path(aluno.id)) }
      it { expect { subject }.to change(Historico, :count).by(1) }
    end

    context 'Quando os parâmetros são válidos' do
      let(:params) { params_invalidos }

      it { expect(response.status).to eq 200 }
      it { is_expected.to render_template :new }
      it { expect { subject }.to change(Historico, :count).by(0) }
    end
  end
end
