require 'rails_helper'

RSpec.feature 'Historico management', :type => :feature do
  let(:aluno) { FactoryBot.create :aluno }
  let!(:disciplina) { FactoryBot.create :disciplina }

  scenario 'Usuário lança nota' do
    visit "/historicos/new?aluno_id=#{aluno.id}"

    expect(page).to have_text("Aluno: #{aluno.nome}")
  end

  scenario 'Usuário lança nota' do
    visit "/historicos/new?aluno_id=#{aluno.id}"

    within('#new_historico') do
      select "#{disciplina.codigo} - #{disciplina.nome}", from: 'historico_disciplina_id'
      sleep 1
      select '20182', from: 'historico_anosemestre'
      sleep 1
      fill_in 'historico_nota', with: '6.0'
      sleep 1
      find(:css, '#historico_frequencia').set(true)
      sleep 1
    end

    click_button 'Salvar'

    sleep 1

    expect(current_path).to eq aluno_path(aluno.id)
    expect(page).to have_text("Matrícula: #{aluno.matricula}")

    within('#historicos') do
      expect(page).to have_content disciplina.nome
    end
  end
end