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
new_user_id = 3

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
users = [{ name: "Milene Boysinha",
        email: "milca@leeagon.com",
        cpf: Faker::CPF.numeric,
        phone: Faker::PhoneNumber.cell_phone,
        admin: false,
        password: "123456"
    },
    { name: "João Delícia Cremosa",
      email: "jvc@leeagon.com",
      cpf: Faker::CPF.numeric,
      phone: Faker::PhoneNumber.cell_phone,
      admin: false,
      password: "123456"
    },
    { name: "Roberto Berrante",
      email: "rberro@leeagon.com",
      cpf: Faker::CPF.numeric,
      phone: Faker::PhoneNumber.cell_phone,
      admin: false,
      password: "123456"
    },
    { name: "Pedro Nirvana",
      email: "nirvana@leeagon.com",
      cpf: Faker::CPF.numeric,
      phone: Faker::PhoneNumber.cell_phone,
      admin: false,
      password: "123456"
}]

users.each do |user|
  User.create!(user)
end

10.times do
  u = User.create!(
      name: Faker::Name.name_with_middle,
      email: Faker::Internet.email,
      cpf: Faker::CPF.numeric,
      phone: Faker::PhoneNumber.cell_phone,
      admin: false,
      password: '123456'
      )
  puts "Usuário(a) #{u.name} criado(a) com CPF #{u.cpf}"
end

func = ["Millena Wiese", "Ana Paula Pontello", "Thiago Almeida"]
mail = %w[milena@gmail.com ana@gmail.com thiago@gmail.com]
n = 0
3.times do
  u = User.create!(
      name: func[n],
      email: mail[n],
      cpf: Faker::CPF.numeric,
      phone: Faker::PhoneNumber.cell_phone,
      admin: true,
      password: '123456'
      )
  n += 1
  puts "Servidor(a) #{u.name} criado(a) com CPF #{u.cpf}"
end

puts ""
puts "-======= Criando denúncias... =======-"
Complaint.create!(user_id: 1, custom: true,
      ni_comp: "33087156000100", know_ni: true, name: "HUANGXI COMÉRCIO VAREJISTA",
      address: "Rua Olegário Maciel, 133 - Rio de Janeiro", with_attach: true,
      year_comp: 2018 , keep: "sim",
      description: "A empresa ZHUANGXI COMÉRCIO VAREJISTA (CNPJ 33.087.156/0001-00) está realizando importações regulares de produtos subfaturados. São brinquedos, produtos de perfumaria, entre outros que estão sendo compradas de um fornecedor chamado LXIN TRADING com sede na China. O despachante Carlos Miguel, que costuma atuar no Porto de Santos, me ofereceu a possibilidade de comprar dessa suposta empresa da China e explicou que o real pagamento ocorreria por fora, utilizando criptoativos. Disse que ele receberia uma comissão de 10% da negociação e que cuidaria de toda a documentação necessária como invoice, e-mails de negociação e a parte de despacho para o Brasil. Aparentemente outras empresas da região estão adotando a prática e com essa vantagem competitiva ilegal estão dominando o comércio na região. Isso inviabiliza quem paga os impostos em dia! A Receita tem que fazer alguma coisa.",
      status: "recebida", admin_user: User.where(admin: true).sample.id,
      ua:"", comment: "", rating: 70
    )

ComplaintCategory.create!(
                          complaint_id: Complaint.last.id,
                          category_id: Category.find_by_title("FRAUDES NA IMPORTAÇÃO").id)
ComplaintCategory.create!(
                          complaint_id: Complaint.last.id,
                          category_id: Category.find_by_title("SUBFATURAMENTO NA IMPORTAÇÃO").id)

Complaint.create!(user_id: 2, custom: false,
      ni_comp: "",  know_ni: false, name: "Mercado São Pedro",
      address: "General João Marcelino, 52 - Juiz de Fora", with_attach: false,
      year_comp: 2016 , keep: "sim",
      description: "valor pago pelos supostos serviços jurídicos era devolvido pela organização criminosa em espécie para pagamento a beneficiários ainda não identificados. Nessa operação, também teriam participado um lobista de Brasília e o presidente da corretora de seguros. Em fiscalização executada na corretora, auditores da Receita Federal identificaram operações superfaturadas. Os recursos eram destinados à pessoas físicas e jurídicas relacionadas aos dirigentes da corretora fiscalizada. Dentre as pessoas jurídicas relacionadas aos diretores da corretora estão uma empresa patrimonial, uma empresa de intermediação de negócios e dois restaurantes.",
      status: "recebida", admin_user: User.where(admin: true).sample.id,
      ua:"", comment: "", rating: 87
    )

ComplaintCategory.create!(
                          complaint_id: Complaint.last.id,
                          category_id: Category.find_by_title("LAVAGEM DE DINHEIRO").id)
ComplaintCategory.create!(
                          complaint_id: Complaint.last.id,
                          category_id: Category.find_by_title("ENRIQUECIMENTO ILÍCITO").id)


Complaint.create!(user_id: 3, custom: false,
      ni_comp: "33087156000100", know_ni: true, name: "",
      address: "", with_attach: true,
      year_comp: 2012 , keep: "não",
      description: "Indícios de omissão de receitas, variação patrimonial a descoberto, ocultação de patrimônio e lavagem de dinheiro efetuados por essas empresas e pessoas físicas do ramo de entretenimento. A fraude se configura na prestação de informações inverídicas relativas ao real faturamento das empresas e grupos musicais. Os valores não declarados ao fisco seriam convertidos em imóveis, veículos e gastos pessoais dos sócios e familiares das empresas. Os envolvidos poderão responder por crimes contra a ordem tributária, lavagem de dinheiro, associação criminosa, falsidade ideológica e outros crimes",
      status: "recebida", admin_user: User.where(admin: true).sample.id,
      ua:"", comment: "", rating: 69
    )
ComplaintCategory.create!(
                          complaint_id: Complaint.last.id,
                          category_id: Category.find_by_title("LAVAGEM DE DINHEIRO").id)
ComplaintCategory.create!(
                          complaint_id: Complaint.last.id,
                          category_id: Category.find_by_title("ENRIQUECIMENTO ILÍCITO").id)

10.times do
  new_user_id += 1
  custom_type = [true, false].sample
  custom_type ? cust = Category.where(sector: "Aduana").sample : cust = Category.where(sector: "Tributo Interno").sample
  url = 'https://baconipsum.com/api/?type=all-meat&paras=2&start-with-lorem=1'
  text = JSON.parse(open(url).read)
  desc = text.join
  admin = User.where(admin: true).sample

  d = Complaint.create!(
    user_id: new_user_id,
    custom: custom_type,
    ni_comp: Faker::CNPJ.numeric,
    know_ni: [true, false].sample,
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    with_attach: false,
    year_comp: (2015..2020).to_a.sample,
    keep: ["sim", "não", "não sei"].sample,
    description: desc,
    status: %w[recebida encaminhada finalizada].sample,
    admin_user: admin.id,
    rating: (10..75).to_a.sample,
    ua: "",
    comment: ""
    )

  puts "-- Denúncia #{d.id} criada. --"

  num_category = (2..4).to_a.sample
  num_category.times do
    cat = ComplaintCategory.create!(
      complaint_id: d.id,
      category_id: cust.id
      )
    puts "*** Categoria #{cat.id} adicionada ***"
  end

end

puts "-======= Denúncias criadas! =======-"
