require 'rails_helper'

RSpec.describe Disciplina, type: :model do
  describe 'Methods' do
    describe '#nome_com_codigo' do
      subject { disciplina.nome_com_codigo }

      let(:disciplina) { FactoryBot.build :disciplina }

      it { is_expected.to eq "#{disciplina.codigo} - #{disciplina.nome}" }
    end
  end
end
