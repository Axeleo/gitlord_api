class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string :name
      t.integer :exp
      t.string :heroclass
      t.references :user, foreign_key: true
      t.string :items
      t.string :abilites

      t.timestamps
    end
  end
end
