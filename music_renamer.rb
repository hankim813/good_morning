
Dir.chdir("./music")
Dir.glob("*mp3") do |file|
  File.rename(file, file.gsub(/\s/, '-'))
end
Dir.glob("*m4a") do |file|
  File.rename(file, file.gsub(/\s/, '-'))
end
Dir.glob("*mp3") do |file|
  File.rename(file, file.gsub(/\A\d+.-/, ''))
end
Dir.glob("*m4a") do |file|
  File.rename(file, file.gsub(/\A\d+.-/, ''))
end