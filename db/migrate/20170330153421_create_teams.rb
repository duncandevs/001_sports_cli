class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.text :name
      t.text :city
      t.integer :wins
      t.integer :losses
      t.float :win_pct
      t.integer :league_ranking
      t.integer :total_pts
      t.float :ppg # points_per_game
      t.float :fg_pct
      t.float :fg_pct_3pt
      t.integer :reb
      t.float :rpg # reb per game
      t.integer :off_reb
      t.float :orpg # off reb per game
      t.integer :ast
      t.float :apg # assists per game
      t.integer :to # turnovers
      t.float :topg # turnovers_per_game
      t.integer :stl
      t.float :spg # steals per game
    end
  end
end
