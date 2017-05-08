# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Matheus Admin",
             email: "its.matheus3@gmail.com",
             password:              "123123",
             password_confirmation: "123123",
             admin: true)
             
Aluno.create!(nome: "Matheus Campos Cardoso",
              email: "its.matheus3@gmail.com",
              matricula: "2012939548",
              password: "123456",
              password_confirmation: "123456")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

99.times do |n|
  nome  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  matricula = Faker::Number.number(10)
  Aluno.create!(nome:  nome,
               email: email,
               matricula: matricula,
               password: "123456",
               password_confirmation: "123456")
end

alunos = Aluno.order(:created_at).take(6)
3.times do |n|
  nome = "Item #{n+1}"
  alunos.each { |aluno| 
  if aluno.nome != "Matheus Campos Cardoso"
    qr_code_img = RQRCode::QRCode.new(nome, :size => 4, :level => :h ).to_img.
    resize(150, 150)
    aluno.kits.create!(nome: nome, image: qr_code_img.to_string)
    aluno.kits.first.feeds.create!(tipo: "Entrada")
    aluno.kits.first.feeds.create!(tipo: "Saída")
  end
  }
end

aluno_matheus = Aluno.find_by(email: 'its.matheus3@gmail.com')
qr_code_img = RQRCode::QRCode.new("Caixa de aparelhos", :size => 4, :level => :h ).to_img.
resize(150, 150)
aluno_matheus.kits.create!(nome: "Caixa de aparelhos", image: qr_code_img.to_string)
qr_code_img = RQRCode::QRCode.new("Kit de clareamento", :size => 4, :level => :h ).to_img.
resize(150, 150)
aluno_matheus.kits.create!(nome: "Kit de clareamento", image: qr_code_img.to_string)
qr_code_img = RQRCode::QRCode.new("Kit de esterelização", :size => 4, :level => :h ).to_img.
resize(150, 150)
aluno_matheus.kits.create!(nome: "Kit de esterelização", image: qr_code_img.to_string)
qr_code_img = RQRCode::QRCode.new("Kit Higiênico", :size => 4, :level => :h ).to_img.
resize(150, 150)
aluno_matheus.kits.create!(nome: "Kit Higiênico", image: qr_code_img.to_string)

aluno_matheus.kits.first.feeds.create!(tipo: "Entrada")
aluno_matheus.kits.first.feeds.create!(tipo: "Saída")
aluno_matheus.kits.first.feeds.create!(tipo: "Entrada")
aluno_matheus.kits.first.feeds.create!(tipo: "Saída")

