class Order < ApplicationRecord
  has_one :book

  monetize :amount_cents

  enum state: [ :pending, :paid, :cancelled ]
end
