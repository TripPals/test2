class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
