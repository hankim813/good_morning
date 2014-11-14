module RenderMsg
  def self.add(task)
    if Task.count < 3
      puts "Adding \"#{task}\" to your to-do list..."
      puts "Added!"
      sleep 1
    else
      puts "CANNOT ADD TASK! Please finish your existing tasks you lazy fool!"
      sleep 1
    end
  end

  def self.delete(task)
    puts "Deleting the task: \"#{task.description}\"..."
    puts "Deleted."
    sleep 1
  end

  def self.display(task, index)
    puts "#{index}. \"#{task.description}\""
    puts
  end
end
