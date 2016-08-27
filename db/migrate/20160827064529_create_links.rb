class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :given_url
      t.string :title
      t.string :slug
      t.integer :clicks

      t.timestamps
    end
  end
end
