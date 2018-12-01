# Welcome to the PiPhone wiki!
Website To Do
* Add demo video
* Add nice picture beneath intro text, maybe additional pictures for a photo album
* Add pinout diagram
* Create links to all the websites and stuff
* Proof-Read (especially make sure the manual makes sense)

## Introduction

PiPhone is a project that adds cellular functionality to a Raspberry Pi Zero W. With this project, users will be able to make and receive calls and texts as well as play FM radio.

This project was created as a project for the Embedded Systems Design course at Georgia Tech by Mason Mahaffey, Oguzhan Yilmaz, and John Bell.

**PICTURE HERE**

## Demonstration Video

## Hardware
### Components
* [Raspberry Pi Zero W](https://www.raspberrypi.org/products/raspberry-pi-zero-w/)
* [Adafruit FONA Modem](https://www.adafruit.com/product/1946)
* 2G GSM SIM Card
* Power Supply
* HDMI Display, keyboard
* 3.5mm headphones with in-line microphone

### Hardware Pin-Out

## Manual
### Phone Calls
**Note:** The phone is compatible with only US numbers
1. First select the "Phone" button in the top left section of the GUI
2. Select the text field immediately beneath the number pad
3. Use the on-screen number pad or your keyboard to type in the 10-digit phone number 
4. Touch or click "Make Call"
5. When the call is done, touch or click "Hang Up"

### Texting
1. Select the "Text" button in the top left section of the GUI
2. Type the 10-digit phone number in the upper text box beneath the number pad
3. Use the lower text box on the screen to type a message
4. Click "Send Text"

### Radio
The radio will automatically scan for available stations when activated. When using the arrow keys to select a station, the available stations will be based on this initial scan.
1. Select the "Radio" button in the top left section of the GUI
2. Select the radio station with the left and right arrow buttons to tune the radio

# Supplemental Notes
## Processing IDE
In order to create a GUI that implemented the touchscreen phone concept that our group desired, we used the Processing IDE with the Interfascia GUI library for this project. Here's how to install Processing and the library:
1. Download the Processing software at `https://processing.org/download/`
2. Open Processing, and select `Sketch -> Import Library... -> Add Library...` and search for Interfascia in the pop up menu. Install Interfascia.
3. You are now ready to download and run the PiPhone code!

## SIM Card Details
The Adafruit FONA modem used in this project requires a 2G SIM card, which can be difficult to obtain. Our group found success using a [Ting](https://ting.com/) SIM card. In principle, any unlocked 2G GSM SIM card should work with the FONA modem, however we have not tested any other SIM's.

## AT Commands
The FONA modem uses AT commands sent over serial in order to place calls, text, or do any other desired function. There is extensive documentation on the available AT commands available [from Adafruit](https://cdn-shop.adafruit.com/product-files/1946/SIM800+Series_AT+Command+Manual_V1.09.pdf).
 

## Future Work
This project is currently a functional phone with radio and texting, but the versatile nature of the raspberry pi would allow for more functionality. Here are some ideas for what this project could be expanded to include in the future:
* Internet Access
* Implement Address Book
