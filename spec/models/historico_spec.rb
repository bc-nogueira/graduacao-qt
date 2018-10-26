require 'rails_helper'

RSpec.describe Historico, type: :model do
  let(:historico) { FactoryBot.build :hist_aprovado }
  describe 'Methods' do
    describe '#aprovado?' do
      subject { historico.aprovado? }

      it { is_expected.to be_truthy }
    end
  end
end
