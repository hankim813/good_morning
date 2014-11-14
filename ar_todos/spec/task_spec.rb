require 'spec_helper'
# require_relative '../app/models/task'

# describe Task "testing the task creation" do
#   before(:all) do
#     raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
#   end

#   it "has a Task table" do
#     expect(ActiveRecord::Base.connection.table_exist?(:tasks)).to be_truthy
#   end

#   it "has the right columns and types" do
#     expected = {
#       integer: ["id"],
#       string: ["description"],
#       datetime: ["created_at", "updated_at"]
#     }
#     ActiveRecord::Base.connection.columns(:tasks).each do |col|
#       expect(expected[col.type]).to include(col.name)
#     end
#   end
# end
