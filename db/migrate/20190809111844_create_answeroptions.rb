class CreateAnsweroptions < ActiveRecord::Migration[5.2]
  def change
    create_table :answeroptions do |t|
      t.references :answer, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end
