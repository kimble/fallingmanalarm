#!/bin/sh
gcc flash.c `pkg-config --libs --cflags libusb-1.0` -o ./lamp
