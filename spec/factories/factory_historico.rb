FactoryBot.define do
  factory :historico, class: Historico do
    anosemestre { '20181' }
    ch { 60 }

    association :disciplina
  end

  factory :hist_aprovado, parent: :historico do
    nota { 7.0 }
    frequencia { true }
  end

  factory :hist_aprov_vs, parent: :historico do
    nota { 5.0 }
    notavs { 6.0 }
    frequencia { true }
  end

  factory :hist_reprov, parent: :historico do
    nota { 3.0 }
    frequencia { true }
  end

  factory :hist_reprov_freq, parent: :historico do
    nota { 7.0 }
    frequencia { false }
  end

  factory :hist_reprov_vs, parent: :historico do
    nota { 5.0 }
    notavs { 3.0 }
    frequencia { true }
  end
end
