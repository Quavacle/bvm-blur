class Image
  def initialize(contents)
    @mainimage = contents
  end

  def output_image
    @mainimage.each { |together| puts together.join( '')}
  end
end
image = Image.new([
  [0, 0, 0, 0],
  [0 ,1, 0 ,0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
  ])

image.output_image