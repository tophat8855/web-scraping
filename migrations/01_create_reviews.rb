require_relative '../database.rb'

class CreateReviews < ActiveRecord::Migration
  def up
    create_table(:reviews) do |t|
      t.text :text
      t.date :date
      t.string :author
      t.integer :star_count

      t.timestamps
    end
  end

  def down
    drop_table(:reviews)
  end
end

CreateReviews.new.up
