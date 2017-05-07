Book.destroy_all


Book.create!(title: "Fondation", price: Money.new(12_00))
Book.create!(title: "Fondation et Empire", price: Money.new(12_50))
Book.create!(title: "Seconde Fondation", price: Money.new(9_00))
