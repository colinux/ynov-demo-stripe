class Order < ApplicationRecord
  belongs_to :book

  monetize :amount_cents

  enum state: [ :pending, :paid, :cancelled ]
end
