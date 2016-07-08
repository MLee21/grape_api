require 'json'

class FileManager

  def self.file_reader(file)
    File.read(File.expand_path(file)).each_line.map { |line| JSON.parse(line) }
  end

  def self.file_writer(file, params)
    File.open(File.expand_path(file), "a+"){ |f| f.write("\n" + params) }
  end

end
