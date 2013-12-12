SimpleCaptcha.setup do |sc|
  sc.image_size = '150x30'
  sc.length = 6
  sc.image_style = 'random'
  
  #sc.add_image_style('mycaptha', [
   #   "-background '#F4F7F8'",
    #  "-fill '#86818B'",
     # "-border 1",
      #"-bordercolor '#E0E2E3'"])
end