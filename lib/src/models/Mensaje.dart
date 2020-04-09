class Mensaje {
  String cuerpo;
  String fechaEnvio;
  String emisor;

  Mensaje(cuerpo, emisor) {
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