class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :content
      t.integer :rating
      t.integer :user_id
    end
  end
end
