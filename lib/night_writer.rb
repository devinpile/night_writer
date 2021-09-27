require './lib/braille_generator'

class NightWriter
  attr_reader :input_file_path,
              :output_file_path

  def initialize()
    @input_file_path = ARGV[0]
    @output_file_path = ARGV[1]
  end

  def read_message
    File.open(input_file_path).read
  end

  def convert_text
    letters = BrailleGenerator.breakdown(read_message)
    braille_40_at_a_time(letters)
  end

  def braille_40_at_a_time(letters)
    require "pry"; binding.pry
    while letters.length > 0
      text = letters.shift(5)
      Format.tobraille(text)
    end
  end

  def read_and_convert_message
    message = convert_text
    File.open(output_file_path, "w") do |file|
      file.write(message)
    end
    puts "Created #{@output_file_path} containing #{(read_message.size) -1} characters"
  end
end

NightWriter.new.read_and_convert_message






#   def read_and_write(file_path)
#     message = ARGV
#     File.open(file_path, 'a+') do |file|
#       file.write(message)
#     end
#   end

# NightWriter.new.read_and_write(input_file_path)
