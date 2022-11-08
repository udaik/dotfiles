#!/bin/bash

# /usr/bin/cvt 1366 768 
/usr/bin/xrandr --newmode "1368x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
/usr/bin/xrandr --addmode VGA1 "1368x768_60.00"
