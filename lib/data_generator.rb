require 'yaml'
class DataGenerator
  def generate
    data = []
    1_000.times do
      data << [rand(1..5), rand(1..5)]
    end
    data = data.to_yaml
    File.open('1000.txt', 'w') do |file|
      file.write data
    end
  end
end

new_generator = DataGenerator.new
new_generator.generate
