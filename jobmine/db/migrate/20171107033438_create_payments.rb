class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :card_num
      t.string :card_holder_name

      t.timestamps
    end
  end
end
