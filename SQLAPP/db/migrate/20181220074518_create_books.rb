class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author
      t.references :genre
      t.timestamps
    end
  end
end
