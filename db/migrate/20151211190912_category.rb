class Category < ActiveRecord::Migration
  def change
  	create_table :category do |t|
  		t.string :title
  	end
  end
end
