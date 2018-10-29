RSpec.describe AlunosController, type: :controller do
  describe 'GET #index' do
    before(:each) { get :index }

    it { expect(response.status).to eq 200 }
    it { is_expected.to render_template :index }
    it { expect(assigns(:alunos)).to be_a ActiveRecord::Relation }
  end

  describe 'GET #show' do
    let(:aluno) { FactoryBot.create :aluno }

    before(:each) { get :show, params: { id: aluno.id } }


    it { expect(response.status).to eq 200 }
    it { is_expected.to render_template :show }
    it { expect(assigns(:aluno)).to eq aluno }
  end
end
