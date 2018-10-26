require 'rails_helper'

RSpec.describe Historico, type: :model do
  describe 'Methods' do
    describe '#aprovado?' do
      subject { historico.aprovado? }

      context 'Quando histórico for aprovado direto' do
        let(:historico) { FactoryBot.build :hist_aprovado }
        
        it 'Deve retornar true' do
          is_expected.to be_truthy
        end
      end

      context 'Quando histórico for aprovado na VS' do
        let(:historico) { FactoryBot.build :hist_aprov_vs }
        
        it 'Deve retornar true' do
          is_expected.to be_truthy
        end
      end

      context 'Quando histórico for reprovado por frequência' do
        let(:historico) { FactoryBot.build :hist_reprov_freq }

        it 'Deve retornar false' do
          is_expected.to be_falsey
        end
      end

      context 'Quando histórico for reprovado direto' do
        let(:historico) { FactoryBot.build :hist_reprov }

        it 'Deve retornar true' do
          is_expected.to be_falsey
        end
      end

      context 'Quando histórico for reprovado na VS' do
        let(:historico) { FactoryBot.build :hist_reprov_vs }

        it 'Deve retornar true' do
          is_expected.to be_falsey
        end
      end
    end

    describe '#nota_final' do
      subject { historico.nota_final }

      context 'Quando histórico tiver nota maior que 6.0' do
        let(:historico) { FactoryBot.build :historico, nota: 6.5 }

        it 'Deve ter nota final igual a nota' do
          is_expected.to eq 6.5
        end
      end

      context 'Quando histórico tiver nota menor que 4.0' do
        let(:historico) { FactoryBot.build :historico, nota: 3.0 }

        it 'Deve ter nota final igual a nota' do
          is_expected.to eq 3.0
        end
      end

      context 'Quando histórico tiver nota entre 4 e 6 e vs maior que 6' do
        let(:historico) { FactoryBot.build :historico, nota: 5.0, notavs: 7 }

        it 'Deve ter nota final igual a nota VS' do
          is_expected.to eq 7.0
        end
      end

      context 'Quando histórico tiver nota entre 4 e 6 e vs menor que 6' do
        let(:historico) { FactoryBot.build :historico, nota: 5.0, notavs: 3.0 }

        it 'Deve ter nota final igual a média entre nota e nota VS' do
          is_expected.to eq 4.0
        end
      end

      context 'Quando histórico tiver nota entre 4 e 6 e não fizer vs' do
        let(:historico) { FactoryBot.build :historico, nota: 5.0 }

        it 'Deve retornar true' do
          is_expected.to eq 2.5
        end
      end
    end
  end
end
