class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.references :rateable, polymorphic: true
      t.references :user

      t.timestamps
    end
  end
end
