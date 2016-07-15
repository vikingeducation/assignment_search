# benchmarker.rb

class Benchmarker

  def benchmark
    begin_time = Time.now
    1000.times { yield }
    end_time = Time.now
    puts "Time taken is #{end_time - begin_time}."
  end
end
