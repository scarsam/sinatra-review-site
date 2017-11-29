class AddColumnToReviews < ActiveRecord::Migration[5.1]
  def change
    create_ta :reviews, :category, :string
  end
end
