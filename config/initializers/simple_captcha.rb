SimpleCaptcha.setup do |sc|
  sc.image_size = '150x30'
  sc.length = 6
  sc.image_style = 'embosed_silver'
  
  #sc.add_image_style('mycaptha', [
   #   "-background '#F4F7F8'",
    #  "-fill '#86818B'",
     # "-border 1",
      #"-bordercolor '#E0E2E3'"])
  #options
  #1) simply_blue
  #2) simply_red
  #3) simply_green
  #4) charcoal_grey
  #5) embosed_silver
  #6) all_black
  #7) distorted_black
  #8) almost_invisible
  
end