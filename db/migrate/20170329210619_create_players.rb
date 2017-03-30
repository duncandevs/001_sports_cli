class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.text :first_name
      t.text :last_name
      t.integer :number
      t.text :pos
      t.integer :total_pts
      t.integer :ppg
      t.integer :ast
      t.integer :apg
      t.integer :reb
      t.integer :rpg
      t.integer :to
      t.integer :topg
      t.integer :mins
      t.integer :mpg
      t.integer :fg # total field goals made
      t.integer :fg_att # total field goals attempted
      t.integer :fg_pct
      t.integer :fg_3pt_att
      t.integer :fg_3pt
      t.integer :fg_3pt_pg
      t.integer :stl
      t.integer :spg
      t.integer :blk
      t.integer :blk_pg
      t.integer :pf
      t.integer :pf_pg
    end
  end
end
