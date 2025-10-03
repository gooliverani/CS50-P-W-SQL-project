import os
import qrcode

img = qrcode.make("https://www.linkedin.com/in/vladimir-vukojicic-137128308")

img.save("qr.png", "PNG")
