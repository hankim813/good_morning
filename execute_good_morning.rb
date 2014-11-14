require_relative 'controllers/view_controllers'
require_relative 'controllers/forecast_controller'
require_relative 'ar_todos/todo'

# ::SCRIPT::

# SETUP
TerminalController.system_clear # Clears terminal screen.
RenderMessageFor.start

2.times { puts }

RenderMessageFor.morning_greet("Han")

for i in 0..2
  puts
  sleep 0.4
end

RenderMessageFor.system_setup
ForecastFor.setup

sleep 1
puts
puts

RenderMessageFor.load(1) # Being setting up music library...
sleep 0.5
RenderMessageFor.load(2)
sleep 0.5
RenderMessageFor.load(3)
puts
puts

MorningMusic.create # Parsing music directory...

RenderMessageFor.completed # Done!

sleep 2

TerminalController.system_clear
RenderMessageFor.start

RenderMessageFor.seed
RenderMessageFor.loading

for i in 0..2
  puts
  sleep 0.5
end


MorningMusic.seed_playlist # Populating playlist...

RenderMessageFor.loading

RenderMessageFor.completed # Done! Ready to play music

sleep 2

TerminalController.system_clear

MorningMusic.set_current_track

RenderMessageFor.start

ForecastFor.weekly

puts
puts

RenderMessageFor.track_playing(MorningMusic.current_track.name, MorningMusic.current_track.artist)

MorningMusic.play

3.times { puts }

TerminalController.preserve_session

