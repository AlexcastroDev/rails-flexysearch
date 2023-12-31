class AddPhotoColumn < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :image_url
      t.references :actor, index: true, foreign_key: true
      t.timestamps
    end
  end
end
