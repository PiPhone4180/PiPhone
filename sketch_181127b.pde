import processing.serial.*;

import interfascia.*;

GUIController c;
IFRadioController rc;
IFButton reset, radioUp, radioDown, getTexts, text, call, hangup, answer, one, two, three, four, five, six, seven, eight, nine, zero, backspace, pound;
IFRadioButton b1, b2, b3, b4;
String phoneNumber;
IFTextField t,textBox,radioChannel,textInfo,textMessage;
boolean isInternetOn, inCall, gettingTexts, gettingChannels, isRadioOn, sendingText;
Serial myPort;
StringList information, texts, channelList;
int ten, i, index, curr;

void setup() {
  size(600, 600);
  background(200);
  printArray(Serial.list());
  
  gettingChannels = false;
  isRadioOn = false;
  sendingText = false;
  isInternetOn = false;
  
  i = 0;
  ten = 10;
  index = -1;
  curr = 0;
  
  information = new StringList();
  texts = new StringList();
  channelList = new StringList();
  
  myPort = new Serial(this, Serial.list()[0], 115200);
  myPort.bufferUntil(ten);
  
  phoneNumber = "";
  inCall = false;
  
  c = new GUIController(this);
  
  t = new IFTextField("Text Field", 40, 300, 250);
  c.add(t);
  
  textBox = new IFTextField("Text Box", 40, 330, 150);
  textBox.setSize(250,150);
  c.add(textBox);
  
  radioChannel = new IFTextField("Radio Channel Selection", 445, 30, 150);
  c.add(radioChannel);
  
  rc = new IFRadioController("Mode Selector");
  rc.addActionListener(this);
  
  b1 = new IFRadioButton("Phone", 20, 20, rc);
  b2 = new IFRadioButton("Text", 20, 40, rc);
  b3 = new IFRadioButton("Radio", 20, 60, rc);
  b4 = new IFRadioButton("Internet", 20, 80, rc);
  
  reset = new IFButton ("Reset Serial",20,100,60,60);
  one = new IFButton ("1", 100, 35, 60, 60);
  two = new IFButton ("2", 170, 35, 60, 60);
  three = new IFButton ("3", 240, 35, 60, 60);
  four = new IFButton ("4", 100, 100, 60, 60);
  five= new IFButton ("5", 170, 100, 60, 60);
  six= new IFButton ("6", 240, 100, 60, 60);
  seven= new IFButton ("7", 100, 165, 60, 60);
  eight= new IFButton ("8", 170, 165, 60, 60);
  nine= new IFButton ("9", 240, 165, 60, 60);
  zero= new IFButton ("0", 170, 230, 60, 60);
  backspace = new IFButton ("Backspace", 100, 230, 60, 60);
  pound= new IFButton ("#", 240, 230, 60, 60);
  
  call = new IFButton ("Make Call", 360, 35, 60, 60);
  hangup = new IFButton ("Hangup Call", 360, 100, 60, 60);
  answer = new IFButton ("Answer Call", 360, 165, 60, 60);
  text = new IFButton ("Send Text", 360, 230, 60, 60);
  getTexts = new IFButton ("Get Texts", 360, 295, 60, 60);
  
  radioUp = new IFButton ("Forward", 490, 100, 60, 60);
  radioDown = new IFButton ("Back", 490, 165, 60, 60);
  
  reset.addActionListener(this);
  one.addActionListener(this);
  two.addActionListener(this);
  three.addActionListener(this);
  four.addActionListener(this);
  five.addActionListener(this);
  six.addActionListener(this);
  seven.addActionListener(this);
  eight.addActionListener(this);
  nine.addActionListener(this);
  zero.addActionListener(this);
  backspace.addActionListener(this);
  pound.addActionListener(this);
  call.addActionListener(this);
  answer.addActionListener(this);
  hangup.addActionListener(this);
  text.addActionListener(this);
  getTexts.addActionListener(this);
  radioUp.addActionListener(this);
  radioDown.addActionListener(this);
  
  c.add(reset);
  c.add(b1);
  c.add(b2);
  c.add(b3);
  c.add(b4);
  c.add(one);
  c.add(two);
  c.add(three);
  c.add(four);
  c.add(five);
  c.add(six);
  c.add(seven);
  c.add(eight);
  c.add(nine);
  c.add(zero);
  c.add(backspace);
  c.add(pound);
  c.add(call);
  c.add(answer);
  c.add(hangup);
  c.add(text);
  c.add(getTexts);
  c.add(radioUp);
  c.add(radioDown);
}

void changeChannel(int change) {
  curr = curr+change;
  if (curr <= -1) {
    curr = channelList.size()-1;
  } else if (curr >= channelList.size()) {
    curr = 0;
  }
  radioChannel.setValue(channelList.get(curr));
  myPort.write("AT+FMFREQ="+radioChannel.getValue()+"\r\n");
}

void changeMessage(int change) {
  index = index+change;
  if (index <= -1) {
    index = texts.size()-1;
  } else if (index >= texts.size()) {
    index = 0;
  }
  t.setValue(information.get(index));
  textBox.setValue(texts.get(index));
}

String getChannel(StringList myList, int index) {
  return myList.get(index);
}

void draw() {
  background(200);
}

void actionPerformed(GUIEvent e) {
  if (e.getSource() == reset){
    myPort.stop();
    myPort = new Serial(this,Serial.list()[0],115200);
    myPort.bufferUntil(ten);
  }
  if (e.getSource() == b4){
     isInternetOn = true;
     launch("/usr/bin/chromium-browser");
     launch("/usr/bin/pon.sh");
     myPort.stop();
   } else if (rc.getSelectedIndex() != 3 & isInternetOn) {
     launch("/usr/bin/poff.sh");
     isInternetOn = false;
   }
  if (e.getSource() == b3){
     gettingChannels = true;
     channelList = new StringList();
     myPort.write("AT+FMOPEN=0\r\n");
     myPort.write("AT+FMSCAN\r\n");
     isRadioOn = true;
   } else if (rc.getSelectedIndex() != 2 & isRadioOn) {
     myPort.write("AT+FMCLOSE\r\n");
     isRadioOn = false;
   }
   if (e.getSource() == b2){
    myPort.write("AT+CMGF=1\r\n"); 
   }
   if(e.getSource() == one){
     t.setValue(t.getValue() + "1");
   }
   else if(e.getSource() == two){
     t.setValue(t.getValue() + "2");
   }
   else if(e.getSource() == three){
     t.setValue(t.getValue() + "3");
   }
   else if(e.getSource() == four){
     t.setValue(t.getValue() + "4");
   }
   else if(e.getSource() == five){
     t.setValue(t.getValue() + "5");
   }
   else if(e.getSource() == six){
     t.setValue(t.getValue() + "6");
   }
   else if(e.getSource() == seven){
     t.setValue(t.getValue() + "7");
   }
   else if(e.getSource() == eight){
     t.setValue(t.getValue() + "8");
   }
   else if(e.getSource() == nine){
     t.setValue(t.getValue() + "9");
   }
   else if(e.getSource() == zero){
     t.setValue(t.getValue() + "0");
   }
   else if(e.getSource() == pound){
     t.setValue(t.getValue() + "#");
   }
   else if(e.getSource() == backspace){
     t.setValue(t.getValue().substring(0,t.getValue().length()-1));
   }
   else if(e.getSource() == call){
     if (rc.getSelectedIndex() == 0){
       if(inCall == false){
         myPort.write("ATD"+t.getValue()+";\r\n");
         call.setLabel("Press Hang Up");
         inCall = true;
       }
     }
   }
   else if(e.getSource() == answer){
     myPort.write("ATA\r\n");
   }
   else if(e.getSource() == hangup){
     myPort.write("ATH\r\n");
     call.setLabel("Make Call");
     inCall = false;
   }
   else if(e.getSource() == text){
     if (rc.getSelectedIndex() == 1){
     myPort.write("AT+CMGS=\""+t.getValue()+"\"\r\n");
     int i = 0;
     while(i < 10000000){
       i = i + 1;
     }
     myPort.write(textBox.getValue());
     myPort.write(26);
     }
   }
   else if(e.getSource() == getTexts) {
     getTexts.setLabel("Getting Texts");
     information = new StringList();
     texts = new StringList();
     gettingTexts = true;
     index = 0;
     myPort.write("AT+CMGL=\"ALL\"\r\n");
   }
   else if (e.getSource() == radioUp) {
    if (rc.getSelectedIndex() == 2){
    changeChannel(1);
    }else if (rc.getSelectedIndex() == 1){
      changeMessage(1);
    }
  } else if (e.getSource() == radioDown) {
    if (rc.getSelectedIndex() == 2){
    changeChannel(-1);
    }else if (rc.getSelectedIndex() == 1){
      changeMessage(-1);
    }
  }
}

void serialEvent(Serial p) {
  String input = p.readString();
  StringList inputList = new StringList();
  inputList.append(input);
  println(inputList);
  if(rc.getSelectedIndex() == 2 & gettingChannels){
  if(input.equals("OK\r\n") & channelList.size()>0){
  channelList.remove(0);
  radioChannel.setValue(channelList.get(0));
  myPort.write("AT+FMFREQ="+radioChannel.getValue()+"\r\n");
  gettingChannels = false;
  }else if (!input.equals("\r\n") & !input.substring(0,2).equals("AT") & !input.equals("ERROR\r\n")){
  channelList.append(input.substring(0,input.length()-2));
  }
  }  
  if(rc.getSelectedIndex() == 1 & gettingTexts){
  if (input.length() > 5){
  if (input.substring(0,5).equals("+CMGL")){
    String q[] = splitTokens(input,",");
    String date = q[4].substring(1,q[4].length()) + " " + q[5].substring(0,q[5].length()-3);
    String number = q[2].substring(3,q[2].length()-1);
    information.append(number + ", " + date);
    index = index + 1;
  } else {
    if (texts.size() == index) {
      texts.set(index,input);
    } else {
    texts.set(index,texts.get(index)+input);
    }
  }
  }
  //int index = inventory.size()-1;
  if(input.equals("OK\r\n") & (information.size()>0)){
  println(information);
  texts.remove(0);
  println(texts);
  gettingTexts = false;
  getTexts.setLabel("Get Texts");
  }
  }
}
