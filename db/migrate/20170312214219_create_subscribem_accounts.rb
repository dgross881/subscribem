class CreateSubscribemAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribem_accounts do |t|
      t.string :name

      t.timestamps
    end
  end
end
