class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.belongs_to :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
