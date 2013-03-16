class Logger
  def self.write(message)
    File.open("./log.txt", 'a+') do |file|
      file.write("#{Time.now}: ")
      file.write("#{message}\n")
    end
  end
end
