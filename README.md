# Welcome to the PiPhone wiki!
Website To Do
* Add demo video
* Add nice picture beneath intro text, maybe additional pictures for a photo album
* Add pinout diagram and other hardware setup instructions
* Proof-Read (especially make sure the manual makes sense)

## Introduction

PiPhone is a project that adds cellular functionality to a Raspberry Pi Zero W. With this project, users will be able to make and receive calls and texts as well as play FM radio and retrieve GPS coordinates.

This project was created as a project for the ECE 4180 Embedded Systems Design course at Georgia Tech by Mason Mahaffey, Oguzhan Yilmaz, and John Bell.

**PICTURE HERE**


## Demonstration Video

## Hardware Setup
### Components
* [Raspberry Pi Zero W](https://www.raspberrypi.org/products/raspberry-pi-zero-w/)
* [Adafruit FONA Modem](https://www.adafruit.com/product/1946)
* [2G GSM SIM Card](https://ting.com/)
* [5V External Power Supply](https://www.sparkfun.com/products/12889)
* [3.7V Li-Ion Battery](https://www.adafruit.com/product/328)
* [Rii Mini Keyboard and Touchpad](http://www.riitek.com/product/k01x.html)
* [Adafruit HDMI Display](https://www.adafruit.com/product/2407)
* [3.5mm headphones with in-line microphone](https://www.amazon.com/Panasonic-Headphones-RP-TCM125-K-Microphone-Controller/dp/B00E4LGVUO/ref=sr_1_3?s=electronics&ie=UTF8&qid=1543703300&sr=1-3&keywords=earbuds+with+mic)
* [Mini HDMI to HDMI cable](https://www.amazon.com/AmazonBasics-High-Speed-Mini-HDMI-HDMI-Cable/dp/B014I8UEGY/ref=sr_1_3_acs_sk_pb_1_sl_1?ie=UTF8&qid=1544495925&sr=8-3-acs&keywords=mini+hdmi+to+hdmi+cable)

### Hardware Pin-Out
Raspberry Pi | FONA | 3.7V Battery | 3.5mm Mic/Headphone | HDMI Display | Mouse/Keyboard
--- | --- | --- | --- | --- | ---
3V3| Vio | -- | -- | -- | --
GND | GND | -- | -- | -- | --
TX | RX | -- | -- | -- | --
RX | TX | -- | -- | -- | --
GND | Key | -- | -- | -- | --
-- | Bat | (+) | -- | -- | --
GND | -- | (-) | -- | -- | --
-- | 3.5mm | -- | 3.5mm  | -- | --
Mini HDMI| --| -- | -- | HDMI input | --
USB input| -- | -- | -- | -- | USB Dongle

## Manual
### Phone Calls
**Note:** The phone is only compatible with US numbers
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

### Internet
The final functionality that we have implemented with our Pi Phone is the ability to activate the data on the SIM card to allow for internet access on the Pi. This process was the most complicated part of the project, and there is additional documentation on how to set up this functionality in the supplemental notes below.
1. To activate the internet, first select the internet option from the button list in the top left of the screen. Two windows will pop up.
2. For the "pon.sh" file pop-up, click "Execute in Terminal". For the "Chromium Browser" pop-up, click "Execute" in the window. Wait until the code opens the Chromium browser
3. Use the Chromium browser as you normally would
4. When finished with the internet, exit the browser and return to the phone display. Select phone mode from the top left button list.
5. Click "Execute in Terminal" when the "poff.sh" window appears.
6. As a final step, click the "reset serial" button in the top left of the GUI. This step is necessary because the internet closes the serial connection and we need to reopen it.

# Supplemental Notes
## Processing IDE
In order to create a GUI that implemented the touchscreen phone concept that our group desired, we used the Processing IDE with the Interfascia GUI library for this project. Here's how to install Processing and the library:
1. Download the Processing software at `https://processing.org/download/`
2. Open Processing, and select `Sketch -> Import Library... -> Add Library...` and search for Interfascia in the pop up menu. Install Interfascia.
3. You are now ready to download and run the PiPhone code!

## Internet Functionality
In addition to the Processing code used for the GUI and serial commands, the internet required more use of the Linux terminal along with additional libraries. To add the libraries, follow [this tutorial](https://learn.adafruit.com/fona-tethering-to-raspberry-pi-or-beaglebone-black). Note that depending on your Pi, you may need to alter which serial port you use based on the tutorial. For our project on the Pi Zero W, we needed to use dev/serial0 rather than dev/ttyAMA0.

For the terminal commands, we created shell (.sh) files that are opened by the Processing program in order to include internet with this phone. These files are provided here on the Github and must be in the same directory as the Processing program in order to work.

## SIM Card Details
The Adafruit FONA modem used in this project requires a 2G SIM card, which can be difficult to obtain. Our group found success using a [Ting](https://ting.com/) SIM card. In principle, any unlocked 2G GSM SIM card should work with the FONA modem, however we have not tested any other SIM's.

## AT Commands
The FONA modem uses AT commands sent over serial in order to place calls, text, or do any other desired function. There is extensive documentation on the available AT commands available from Adafruit.

AT Command Manual: [AT_Command.pdf](https://cdn-shop.adafruit.com/product-files/1946/SIM800+Series_AT+Command+Manual_V1.09.pdf)
 

## Future Work
This project is currently a functional phone with radio and texting, but the versatile nature of the raspberry pi would allow for more functionality. Here are some ideas for what this project could be expanded to include in the future:
* Implement Address Book
* Add status indicators such as signal quality or battery life
* Construct a case to create a phone appearance
