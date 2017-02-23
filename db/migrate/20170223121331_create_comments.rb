class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :comment_text, null: false
  		t.integer :commentable_id
  		t.string :commentable_type
  		t.references :user, null: false

  		t.timestamps null: false
  	end 
  end
end
