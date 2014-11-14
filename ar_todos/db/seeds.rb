require 'faker'

module ListSeeder
  def self.seed(number)
    puts "Seeding Lists...."
    number.times { List.create(name: Faker::Hacker.adjective + " " + Faker::Hacker.abbreviation)}
    puts "Done!"
  end
end

module TaskSeeder
  def self.seed(number)
    puts "Seeding Tasks....."
    number.times { Task.create(description: Faker::Hacker.say_something_smart, finished: false, list_id: rand(1..3))}
    puts "Done!"
  end
end



ListSeeder.seed(3)
TaskSeeder.seed(15)
