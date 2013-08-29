  User.create(email: "root", password: "root")
  puts "========= Seeding ========="

  Category.create(name: "Ruby on Rails", slug: "ruby-on-rails" )
  Category.create(name: "jQuery", slug: "jquery")
  Category.create(name: "CSS", slug: "css")
  Category.create(name: "Enviroment", slug: "enviroment")
  Category.create(name: "Iniciantes", slug: "iniciantes")
  Category.create(name: "Git", slug: "git")
  Category.create(name: "Banco de Dados", slug: "banco-de-dados")
  Category.create(name: "Desenvolvimento Ágil", slug: "agile")