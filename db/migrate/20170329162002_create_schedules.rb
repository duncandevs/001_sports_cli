class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :date
      t.string :away_team
      t.string :home_team
      t.string :location
    end
  end
end
