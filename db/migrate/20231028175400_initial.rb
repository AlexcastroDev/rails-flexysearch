class Initial < ActiveRecord::Migration[6.1]
  def up
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.integer :year

      t.timestamps
    end

    create_table :actors do |t|
      t.string :name

      t.timestamps
      t.references :movie, index: true, foreign_key: true
    end
  end

  def down
    drop_table :movies
    drop_table :actors
  end
end
