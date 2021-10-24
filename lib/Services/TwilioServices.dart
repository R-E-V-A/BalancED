import 'package:resolvers/Constants/Tokens.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioService
{
  TwilioFlutter twilioFlutter;
  void setAccount(){
    twilioFlutter = TwilioFlutter(accountSid: "ACeec0281d6cb2373ccff9c36c7a7ae706", authToken: twilioToken, twilioNumber: "3344633032");
  }
  void verifyPhoneNumber(){

  }
  void sendSms()async{
    await twilioFlutter.sendSMS(toNumber: "919840954938", messageBody: "Hey There Anush,expense added successfully");
  }
}