class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
