namespace :dev do
  desc 'Populate the database'
  task populate: :environment do
    puts '### Iniciando popular do banco ###'
    breno = Aluno.create!(
      nome: 'Breno Nogueira',
      matricula: '216083098'
    )

    prog1 = Disciplina.create!(
      nome: 'Programação 1',
      codigo: 'TCC00100'
    )

    prog2 = Disciplina.create!(
      nome: 'Programação 2',
      codigo: 'TCC00101'
    )

    poo = Disciplina.create!(
      nome: 'POO',
      codigo: 'TCC00102'
    )

    qt = Disciplina.create!(
      nome: 'Qualidade e Teste',
      codigo: 'TCC00103'
    )

    redes1 = Disciplina.create!(
      nome: 'Redes I',
      codigo: 'TCC00104'
    )

    Historico.create!(
      nota: 7.2,
      frequencia: true,
      anosemestre: '20162',
      ch: 60,
      aluno: breno,
      disciplina: prog1
    )

    Historico.create!(
      nota: 5.2,
      notavs: 7,
      frequencia: true,
      anosemestre: '20171',
      ch: 60,
      aluno: breno,
      disciplina: prog2
    )

    Historico.create!(
      nota: 5,
      notavs: 3,
      frequencia: true,
      anosemestre: '20172',
      ch: 60,
      aluno: breno,
      disciplina: poo
    )

    Historico.create!(
      nota: 3,
      frequencia: true,
      anosemestre: '20181',
      ch: 60,
      aluno: breno,
      disciplina: redes1
    )

    Historico.create!(
      nota: 8,
      frequencia: false,
      anosemestre: '20181',
      ch: 60,
      aluno: breno,
      disciplina: qt
    )

    puts '### Banco populado ###'
  end
end
