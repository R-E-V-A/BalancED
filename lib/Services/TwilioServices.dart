import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioService
{
  TwilioFlutter twilioFlutter;
  void setAccount(){
    twilioFlutter = TwilioFlutter(accountSid: "ACeec0281d6cb2373ccff9c36c7a7ae706", authToken: "4ad3d69be49dd065cf8d325a027e665b", twilioNumber: "3344633032");
  }
  void verifyPhoneNumber(){

  }
  void sendSms()async{
    await twilioFlutter.sendSMS(toNumber: "919840954938", messageBody: "Hey There Anush,expense added successfully");
  }
  void sendWhatsApp() async{
    await twilioFlutter.sendWhatsApp(toNumber: '919967762521', messageBody: 'Welcome to BalancED');
  }
}