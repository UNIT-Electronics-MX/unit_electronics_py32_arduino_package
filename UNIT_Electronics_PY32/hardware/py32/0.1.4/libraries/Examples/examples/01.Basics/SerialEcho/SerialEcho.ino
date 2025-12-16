/*
  Serial Echo
  
  Este ejemplo demuestra el uso básico de comunicación UART en el PY32F003.
  La configuración por defecto usa:
  - TX: PA0
  - RX: PA1
  - USART2 a 115200 baudios
  
  El programa hace eco de todos los caracteres recibidos por el puerto serial.
  
  Creado por UNIT Electronics, 2025
  
  Este código es de dominio público.
*/

void setup() {
  // Inicializar comunicación serial
  // PA0 = TX, PA1 = RX automáticamente configurados
  Serial.begin(115200);
  
  // Mensaje de inicio
  Serial.println("=== PY32F003 Serial Echo ===");
  Serial.println("Escribe algo y presiona Enter");
}

void loop() {
  // Si hay datos disponibles en el buffer serial
  if (Serial.available()) {
    // Leer y reenviar el carácter (echo)
    char c = Serial.read();
    Serial.write(c);
  }
}
