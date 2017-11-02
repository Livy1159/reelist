class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :body
      t.references :film
      t.references :user

      t.timestamps
    end
  end
end
