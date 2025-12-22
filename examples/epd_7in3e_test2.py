#!/usr/bin/python3
# -*- coding:utf-8 -*-
import sys
import os
import time
import json
from datetime import datetime
picdir = os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))), 'pic')
libdir = os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))), 'lib')
if os.path.exists(libdir):
    sys.path.append(libdir)

import logging
from waveshare_epd import epd7in3e
import time
from PIL import Image,ImageDraw,ImageFont
import traceback

logging.basicConfig(level=logging.DEBUG)

now = datetime.now()

try:
    logging.info("epd7in3f Demo")

    epd = epd7in3e.EPD()   
    logging.info("init and Clear")
    epd.init()
    epd.Clear()
    font24 = ImageFont.truetype(os.path.join(picdir, 'Font.ttc'), 24)
    font18 = ImageFont.truetype(os.path.join(picdir, 'Font.ttc'), 18)
    font40 = ImageFont.truetype(os.path.join(picdir, 'Font.ttc'), 40)
    
    # read bmp file 
    logging.info("2.read bmp file")
    Himage = Image.open(os.path.join(picdir, 'mynewfile.bmp'))
    epd.display(epd.getbuffer(Himage))
    time.sleep(3)

    Himage = Image.new('1', (epd.height, epd.width), 255)  # 255: clear the frame
    draw = ImageDraw.Draw(Himage)

#    Himage = Image.new('1', (60, 90), 255)  # 255: clear the frame
#    buf = "%s/%s/%s %s:%s" % (now.month, now.day, now.year, now.hour, now.minute)
#    draw.text((10, 10), buf, font = font24, fill = 0)
#    epd.display(epd.getbuffer(Himage))
    
except IOError as e:
    logging.info(e)
    
except KeyboardInterrupt:    
    logging.info("ctrl + c:")
    epd7in3e.epdconfig.module_exit(cleanup=True)
    exit()
