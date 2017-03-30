#sports_teams.rb

class Adapters::SportsTeamStats
  @@url = "https://www.mysportsfeeds.com/api/feed/sample/pull/nba/2015-2016-regular/overall_team_standings.json?"

  def fetch_team_data
    #returns the raw data hash of schedules
    result = RestClient.get(@@url)
    hash = JSON.parse(result)
  end

  def create_team(val)
    #takes schedule data as input returns new schedule object
    team = Team.new do |t|
      t.name = val["team"]["Name"]
      t.city = val["team"]["City"]
      t.wins = val["stats"][""]["#text"]
      t.losses = val["stats"]["Losses"]["#text"]
      t.win_pct = val["stats"]["WinPct"]["#text"]
      t.league_ranking = val["rank"]
      t.total_points = val["stats"]["Pts"]["#text"]
      t.ppg = val["stats"]["PtsPerGame"]["#text"]
      t.fg_pct = val["stats"]["FgPct"]["#text"]
      t.fg_pct_three_pt = val["stats"]["Fg3PtPct"]["#text"]
      t.reb = val["stats"]["Reb"]["#text"]
      t.rpg = val["stats"]["RebPerGame"]["#text"]
      t.off_reb = val["stats"]["OffReb"]["#text"]
      t.orpg = val["stats"]["OffRebPerGame"]["#text"]
      t.ast = val["stats"]["Ast"]["#text"]
      t.apg = val["stats"]["AstPerGame"]["#text"]
      t.to = val["stats"]["Tov"]["#text"]
      t.topg = val["stats"]["TovPerGame"]["#text"]
      t.stl = val["stats"]["Stl"]["#text"]
      t.spg = val["stats"]["StlPerGame"]["#text"]
    end

    team
  end

  def seed_db
    #takes the data returned by the fetch schedule data function, then runs the create_schedule function then creates the db instances
    teams = fetch_team_data["overallteamstandings"]["teamstandingsentry"]
    teams.each do |val|
      t = create_team(val)
      Team.find_or_create_by(t.attributes)
    end
  end

end# /CLASS ENDS HERE

Adapters::SportsTeamStats.new.seed_db


# create Teams

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
      t.float :fg_pct_three_pt
      t.integer :reb
      t.float :rpg # reb per gamera
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
