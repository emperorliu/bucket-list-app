class CreateCheers < ActiveRecord::Migration
  def change
    create_table :cheers do |t|
      t.boolean :cheer
      t.integer :user_id
      t.string :cheerable_type
      t.integer :cheerable_id
      t.timestamps
    end
  end
end
