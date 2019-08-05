class Image
  def initialize(contents)
    @main = contents
  end

  def output_image
    @main.each {|together| puts together.join('')} 
  end

  def blur(distance = 1)
    distance.times do
      locate
      @location_array.each do |y, x|
        @main[y -1][x] = 1 unless y == 0
        @main[y +1][x] = 1 unless y == @main.count - 1
        @main[y][x +1] = 1 unless x == @main.count
        @main[y][x -1] = 1 unless x == 0
      end
    end
  end

  def locate
    @location_array = []
    @main.each_with_index do |r, y|
      r.each_with_index do |value, x|
        if value == 1
          @location_array << [y, x]
        end
      end
    end
    
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0 ,0, 0 ,0, 0 ,0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0 ,1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0],

])
puts "-----------------"
puts "--Initial Image--"
image.output_image
puts "How many steps shall we blur today?"
input = gets.chomp.to_i
image.blur(input)
puts "--Blurred Image--"
image.output_image
puts "-----------------"
