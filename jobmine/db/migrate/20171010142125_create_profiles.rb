class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :address
      t.string :phone_num
      t.string :gender

      t.timestamps
    end
  end
end
