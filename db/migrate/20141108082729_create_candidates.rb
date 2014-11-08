class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :uid
      t.string :nickname
      t.string :image_url

      t.timestamps
    end
  end
end
