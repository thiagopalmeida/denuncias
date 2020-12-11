# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Apagando dados anteriores..."
Category.destroy_all
Complaint.destroy_all
User.destroy_all
puts "Dados apagados!"
new_user_id = 0

require 'csv'
require 'json'
require 'open-uri'


file =File.open('./db/categories_utf8.csv')
csv_options = { col_sep: ',', quote_char: "'", headers: :first_row }

puts ""
puts "-======= Adicionando Categorias... =======-"

CSV.foreach(file, csv_options) do |row|
  c = Category.create!(
    title: "#{row[0]}",
    sector: "#{row[2]}"
    )
  puts "Categoria #{c.title} foi adicionada"
end

puts ""
puts "-======= Criando usuários... =======-"

20.times do
  u = User.create!(
      name: Faker::Name.name_with_middle,
      email: Faker::Internet.email,
      cpf: Faker::CPF.pretty,
      phone: Faker::PhoneNumber.cell_phone,
      role: 2,
      password: '123456'
      )
  puts "Usuário #{u.name} criado com CPF #{u.cpf}"
end

func = ["Millena Wiese", "Ana Paula Pontello", "Thiago Almeida"]
n = 0
3.times do
  u = User.create!(
      name: func[n],
      email: Faker::Internet.email,
      cpf: Faker::CPF.pretty,
      phone: Faker::PhoneNumber.cell_phone,
      role: 1,
      password: '123456'
      )
  n += 1
  puts "Servidor #{u.name} criado com CPF #{u.cpf}"
end

puts ""
puts "-======= Criando denúncias... =======-"

20.times do
  new_user_id += 1
  custom_type = [true, false].sample
  custom_type ? cust = Category.where(sector: "Aduana").sample : cust = Category.where(sector: "Tributo Interno").sample
  url = 'https://baconipsum.com/api/?type=all-meat&paras=2&start-with-lorem=1'
  text = JSON.parse(open(url).read)
  desc = text.join
  admin = User.where(role: 1).sample

  d = Complaint.create!(
    user_id: new_user_id,
    custom: custom_type,
    ni_comp: Faker::CNPJ.pretty,
    know_ni: [true, false].sample,
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    with_attach: false,
    year_comp: (2015..2020).to_a.sample,
    keep: %w[sim não talvez].sample,
    description: desc,
    status: %w[recebido encaminhado finalizado].sample,
    admin_user: admin.id,
    rating: (1..5).to_a.sample,
    ua: ['Primeira Região Fiscal', 'Segunda Região Fiscal', 'Terceira Região Fiscal', 'Quarta Região Fiscal'].sample,
    comment: Faker::ChuckNorris.fact
    )

  puts "-- Denúncia #{d.id} criada. --"

  num_category = (1..3).to_a.sample
  num_category.times do
    cat = ComplaintCategory.create!(
      complaint_id: d.id,
      category_id: cust.id
      )
    puts "*** Categoria #{cat.id} adicionada ***"
  end

end

puts "-======= Denúncias criadas! =======-"
