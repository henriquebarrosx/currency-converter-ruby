class AddIndexToTransactionsUserId < ActiveRecord::Migration[8.0]
    def change
        add_index :transactions, :user_id
    end
end
