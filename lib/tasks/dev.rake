namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    puts "Cadastrando os tipos de contato..."

    kinds = %w(Amigo comrercial conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos de Contato cadastrados com sucesso!"

    puts "Cadastrando os contatos..."
    #################
    100.times do |i|
      Contact.create!(
        name:Faker::Name.name,
        email:Faker::Internet.email,
        birthdate:Faker::Date.between(from: 35.days.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )

      end
    puts "Contatos cadastrados com sucesso!"

    puts "Cadastrando os telefones..."

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        contact.phones.create!(
          number:Faker::PhoneNumber.cell_phone
        )
        contact.save!
      end
    end
    puts "Telefones cadastrados com sucesso!"

  end
end
