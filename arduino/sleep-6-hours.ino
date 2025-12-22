// **** INCLUDES *****
#include "LowPower.h"

int x=0;

void setup()
{
  // No setup is required for this library
  Serial.begin(4800);
  Serial.println("starting");
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(4, INPUT); // Set high-z on pin 4
}

void loop() 
{
  // Enter idle state for 8 s with the rest of peripherals turned off
  // Each microcontroller comes with different number of peripherals
  // Comment off line of code where necessary

  // ATmega328P, ATmega168
  LowPower.idle(SLEEP_8S, ADC_OFF, TIMER2_OFF, TIMER1_OFF, TIMER0_OFF, SPI_OFF, USART0_OFF, TWI_OFF);
  //LowPower.idle(SLEEP_1S, ADC_OFF);

  delay(100);
  // Delay for 6 hours ((6 * 60 * 60) / 8) = 2700
  if (x++ == 2700){
    Serial.print("now");
    digitalWrite(LED_BUILTIN, HIGH);
    pinMode(4, OUTPUT); // Set low-z on pin 4
    digitalWrite(4, LOW);
    delay(200);
    digitalWrite(4, HIGH);
    pinMode(4, INPUT); // Set high-z on pin 4
    x=0;
  } else {
    Serial.print("naw");
    digitalWrite(LED_BUILTIN, LOW);
  }
    // ATmega32U4
  //LowPower.idle(SLEEP_8S, ADC_OFF, TIMER4_OFF, TIMER3_OFF, TIMER1_OFF, 
  //		  TIMER0_OFF, SPI_OFF, USART1_OFF, TWI_OFF, USB_OFF);

  // ATmega2560
  //LowPower.idle(SLEEP_8S, ADC_OFF, TIMER5_OFF, TIMER4_OFF, TIMER3_OFF, 
  //		  TIMER2_OFF, TIMER1_OFF, TIMER0_OFF, SPI_OFF, USART3_OFF, 
  //		  USART2_OFF, USART1_OFF, USART0_OFF, TWI_OFF);

  // ATmega256RFR2
  //LowPower.idle(SLEEP_8S, ADC_OFF, TIMER5_OFF, TIMER4_OFF, TIMER3_OFF, 
  //      TIMER2_OFF, TIMER1_OFF, TIMER0_OFF, SPI_OFF,
  //      USART1_OFF, USART0_OFF, TWI_OFF);

  // Do something here
  // Example: Read sensor, data logging, data transmission.
}


