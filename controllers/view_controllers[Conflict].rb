# encoding: utf-8

require_relative 'music_controller'
require_relative 'forecast_controller'

module RenderMessageFor
  def self.start
    3.times {puts}
    puts <<-MSG
     ██████╗  ██████╗  ██████╗ ██████╗     ███╗   ███╗ ██████╗ ██████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗
    ██╔════╝ ██╔═══██╗██╔═══██╗██╔══██╗    ████╗ ████║██╔═══██╗██╔══██╗████╗  ██║██║████╗  ██║██╔════╝
    ██║  ███╗██║   ██║██║   ██║██║  ██║    ██╔████╔██║██║   ██║██████╔╝██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
    ██║   ██║██║   ██║██║   ██║██║  ██║    ██║╚██╔╝██║██║   ██║██╔══██╗██║╚██╗██║██║██║╚██╗██║██║   ██║
    ╚██████╔╝╚██████╔╝╚██████╔╝██████╔╝    ██║ ╚═╝ ██║╚██████╔╝██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝
     ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝     ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝

    MSG
    3.times {puts}
  end

  def self.system_setup
    "Loading the sunrise ☀  ☀  ☀".split("").each do |letter|
      print letter
      sleep 0.04
    end
  end

  def self.load(num)
    case num
    when 1
      "Gathering your wake-up music...".split("").each do |letter|
        print letter
        sleep 0.04
      end
    when 2
      " today's weather...".split("").each do |letter|
        print letter
        sleep 0.04
      end
    when 3
      " and your master plan of conquest!".split("").each do |letter|
        print letter
        sleep 0.04
      end
    end
  end

  def self.seed
    "Parsing your music folder....".split("").each do |letter|
      print letter
      sleep 0.04
    end
    puts
    puts
    "Curating playlist....".split("").each do |letter|
      print letter
      sleep 0.04
    end
  end

  def self.completed
    puts "Done!"
  end

  def self.track_playing(title, artist)
    artist.empty? ? (puts "Now playing: \033[1m#{title}\033[0m") : (puts "Now playing: \033[1m#{title}\033[0m by \033[1m#{artist}\033[0m")
    puts
  end

  def self.help(command)
    case command
    when "menu"
      puts <<-MENU
      Enter:
        -\033[1mmusic(m)\033[0m
        -\033[1mtodo-list(l)\033[0m
        -\033[1mexit(x)\033[0m to quit the program.
      MENU
    when "playback-options"
      puts <<-PLAYBACK
      Enter:
        -\033[1mresume(r)\033[0m to resume the current track.
        -\033[1mnext(n)\033[0m to play the next track.
        -\033[1mprev(v)\033[0m to play the previous track.
        -\033[1mpause(p)\033[0m to pause the current track.
        -\033[1mback(b)\033[0m to go to the main menu.
        -\033[1mexit(x)\033[0m to quit the program.
      PLAYBACK
    when "list-options"
    TaskController.list
    puts <<-LIST
    Enter:
      -\033[1madd(a)\033[0m to add a task [only up to 3 tasks!]
      -\033[1mdelete(d) task_num\033[0m to delete last task [default: last task]
    LIST
    end
  end

  def self.morning_greet(name)
    "Good morning, \033[1m#{name}\033[0m".split("").each do |letter|
      print letter
      sleep 0.04
    end
  end

  def self.loading
    puts
    puts
    print "Processing"
    10.times do
      print "."
      sleep 0.1
    end
    puts
    puts
  end

  def self.interface(command)
    RenderMessageFor.start
    ForecastFor.weekly
    RenderMessageFor.track_playing(MorningMusic.current_track.name, MorningMusic.current_track.artist)
    puts
    puts
    RenderMessageFor.help(command)
  end
end

module TerminalController
  include RenderMessageFor
  include MorningMusic

  def self.system_clear
    system('clear')
  end

  def self.get_command
    puts
    command = $stdin.gets.chomp
  end

  def self.preserve_session
    interface_msg ||= "menu"
    while MorningMusic.power_on
      self.system_clear #FIND THE RIGHT PLACE FOR THIS LINE
      RenderMessageFor.interface(interface_msg)

      command = self.get_command.upcase
      command_focus = command.split(" ")

      case command
      when "NEXT" then MorningMusic.next
      when "N" then MorningMusic.next
      when "PREV" then MorningMusic.prev
      when "V" then MorningMusic.prev
      when "PAUSE" then MorningMusic.stop
      when "P" then MorningMusic.stop
      when "RESUME" then MorningMusic.play
      when "R" then MorningMusic.play
      when "EXIT" then MorningMusic.exit
      when "X" then MorningMusic.exit
      when "BACK" then interface_msg = "menu"
      when "B" then interface_msg = "menu"
      when "MUSIC" then interface_msg = "playback-options"
      when "M" then interface_msg = "playback-options"
      when "LIST" then interface_msg = "list-options"
      when "L" then interface_msg = "list-options"
      when "ADD" then TaskController.execute(command_focus[1..-1])
      when "A" then TaskController.execute(command)
      when "DELETE" then TaskController.execute(command)
      when "D" then TaskController.execute(command)
      else puts "I don't understand.. please tell me what to do!\n\n"
        sleep 3
      end
    end
  end
end

