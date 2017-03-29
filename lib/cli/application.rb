class Application

  def run
    Adapters::GoogleBooks.set_default_items
    puts "Welcome to my app!"
    puts "please enter a search term!"
    query = gets.strip
  end

end
