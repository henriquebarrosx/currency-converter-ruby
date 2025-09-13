class Transaction < ApplicationRecord
    CURRENCIES = %w[BRL USD EUR JYP].freeze

    validates :user_id, :currency_from, :currency_to, :value_from, :value_to, :rate,
              presence: true

    validates :value_from, :value_to,
              numericality: { greater_than: 0, message: "must to be greater than 0" }

    validates :currency_from, :currency_to,
              inclusion: { in: CURRENCIES, message: "%{value} is not a valid currency" }
end
