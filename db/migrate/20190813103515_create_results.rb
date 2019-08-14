class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :user, foreign_key: true
      t.references :paper, foreign_key: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
