class CreateReactivates < ActiveRecord::Migration[5.1]
  def change
    create_table :reactivates do |t|
      t.string :username
      t.text :description

      t.timestamps
    end
  end
end
