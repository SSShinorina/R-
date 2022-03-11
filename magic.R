install.packages("magick")
img <- magick::image_read('heart.dcm')
print(image_info(img), n = 2)
image_animate(img, fps = 10)


logo <- image_read('rlogo.png') %>% image_scale('50x50')
# Background image
magick::image_read('heart.dcm') %>%
  image_annotate("This is a heart", gravity = 'northeast',
                 color = 'white', size = 20) %>%
  image_composite(logo, offset = '+200+210') %>%
  image_animate(fps = 10)
(denmark <- image_read('Denmark.PNG') %>%
    image_scale('x500'))

quantized <- image_quantize(denmark, 6, colorspace = 'YCbCr')
quantized