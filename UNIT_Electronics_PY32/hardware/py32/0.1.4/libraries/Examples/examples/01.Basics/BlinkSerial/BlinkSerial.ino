/*
  Blink con Serial
  
  Este ejemplo combina el parpadeo de un LED con comunicación serial.
  Usa PA0/PA1 para UART y un LED en PB5.
  
  Cuando envías '1' por serial, el LED parpadea.
  
  Hardware:
  - LED en PB5 (o usa un LED externo)
  - Serial: TX=PA0, RX=PA1
  
  Creado por UNIT Electronics, 2025
*/

void setup() {
  // Configurar LED como salida
  pinMode(PB5, OUTPUT);
  
  // Parpadeo inicial (3 veces)
  for (byte i = 0; i < 3; i++) {
    digitalWrite(PB5, HIGH);
    delay(300);
    digitalWrite(PB5, LOW);
    delay(300);
  }
  
  // Inicializar Serial (PA0=TX, PA1=RX)
  Serial.begin(115200);
  Serial.println("Sistema listo");
  Serial.println("Envia '1' para parpadear LED");
}

void loop() {
  if (Serial.available()) {
    char cmd = Serial.read();
    
    if (cmd == '1') {
      // Parpadear LED
      digitalWrite(PB5, HIGH);
      Serial.println("LED ON");
      delay(500);
      digitalWrite(PB5, LOW);
      Serial.println("LED OFF");
    }
    else {
      Serial.print("Recibido: ");
      Serial.println(cmd);
    }
  }
}
