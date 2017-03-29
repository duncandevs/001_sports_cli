
class Adapters::SportsSchedule
  @@url = "https://www.mysportsfeeds.com/api/feed/sample/pull/nba/2015-2016-regular/full_game_schedule.json?"

  def fetch_schedule_data
    #returns the raw data hash of schedules
    result = RestClient.get(@@url)
    hash = JSON.parse(result)
  end

  def create_schedule(val)
    #takes schedule data as input returns new schedule object
    schedule = Schedule.new do |s|
      s.date = val["date"]
      s.away_team = val["awayTeam"]["Name"]
      s.home_team = val["homeTeam"]["Name"]
      s.location = val["location"]
    end
    schedule
  end

  def seed_db
    #takes the data returned by the fetch schedule data function, then runs the create_schedule function then creates the db instances
    games = fetch_schedule_data["fullgameschedule"]["gameentry"]
    games.each do |val|
      s = create_schedule(val)
      Schedule.find_or_create_by(date: s.date, away_team: s.away_team, home_team: s.home_team, location: s.location)
    end
  end

end# /CLASS ENDS HERE
#Adapters::SportsSchedule.new.seed_db
