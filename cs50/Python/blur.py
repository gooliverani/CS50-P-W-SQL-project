from PIL import Image, ImageFilter

before = Image.open("mrt.bmp")
after = before.filter(ImageFilter.BoxBlur(5))
after.save("out.bmp")
