class Mensaje {
  String cuerpo;
  String fechaEnvio;
  String emisor;

  Mensaje(String cuerpo,String emisor) {
    this.cuerpo = cuerpo;
    this.fechaEnvio =  DateTime.now().toString();
    this.emisor = emisor;
  }
  String toString() {
    return cuerpo +
        " fue enviada el " +
        fechaEnvio +
        " por el profesor " +
        emisor +
        ".";
  }
}