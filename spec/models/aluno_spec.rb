require 'rails_helper'

RSpec.describe Aluno, type: :model do
  describe 'Methods' do
    describe '#calcula_cr' do
      subject { aluno.calcula_cr }

      let(:aluno) { FactoryBot.build :aluno }

      let!(:historico1) do
        FactoryBot.create :hist_aprovado, nota: 8, aluno: aluno
      end
      let!(:historico2) do
        FactoryBot.create :hist_aprovado, nota: 6, aluno: aluno
      end

      it { is_expected.to eq 7.0 }
    end
  end
end
