RSpec.describe AlunosController, type: :controller do
  describe 'GET #index' do
    context 'Quando não tem aluno selecionado' do
      before(:each) { get :index }

      it { expect(response.status).to eq 200 }
      it { is_expected.to render_template :index }
      it { expect(assigns(:alunos)).to be_a ActiveRecord::Relation }
    end
  end
end
