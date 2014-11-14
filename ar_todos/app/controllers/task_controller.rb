# Parse ARGV commands and translate them to AR queries.
require_relative 'view_controller'

class TaskController
  def self.execute(command, focus)
    focus = focus.join(" ")
    case command.upcase
    when 'ADD' then self.add(focus)
    when 'A' then self.add(focus)
    when 'DELETE' then self.delete!(focus)
    when 'D' then self.delete!(focus)
    when 'L' then self.list
    when 'LIST' then self.list
    end
  end

  def self.add(focus)
    RenderMsg.add(focus)
    Task.create(description: focus) if Task.count < 3
  end

  def self.delete!(focus)
    true_index = Task.all[focus.to_i - 1].id
    RenderMsg.delete(Task.find(true_index))
    Task.delete(Task.find(true_index))
  end

  def self.list
    puts "\033[1mList of Shit You Must Complete Today\033[0m:"
    puts
    Task.all.each_with_index { |task, index| RenderMsg.display(task, index+1) }
  end
end
