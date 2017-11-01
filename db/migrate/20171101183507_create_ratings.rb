class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.integer :rateable_id
      t.string :rateable_type
      t.references :user

      t.timestamps
    end
  end
end
