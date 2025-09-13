class CreateTransactions < ActiveRecord::Migration[8.0]
    def change
        create_table :transactions do |t|
            t.bigint :user_id, null: false
            t.string  :currency_from, limit: 3, null: false
            t.string  :currency_to,   limit: 3, null: false
            t.decimal :value_from, precision: 20, scale: 8, null: false
            t.decimal :value_to,   precision: 20, scale: 8, null: false
            t.decimal :rate, precision: 30, scale: 16, null: false
            t.timestamps
        end
    end
end
