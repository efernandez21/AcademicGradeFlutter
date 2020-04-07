class Mensaje {
  String cuerpo;
  String fechaEnvio;
  String emisor;
  
  Mensaje(cuerpo, fechaEnvio, emisor) {
    this.cuerpo = cuerpo;
    this.fechaEnvio = fechaEnvio;
    this.emisor = emisor;
  }
  String toString()
  {
    return cuerpo+" fue enviada el "+fechaEnvio+" por el profesor "+emisor+".";
  }
}