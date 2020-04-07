class Actividad {
  String descripcion;
  String fechaLimite;
  String asignatura;

  Actividad(descripcion, fechaLimite, asignatura) {
    this.descripcion = descripcion;
    this.fechaLimite = fechaLimite;
    this.asignatura = asignatura;
  }
  String toString() {
    return descripcion + " " + fechaLimite + " " + asignatura;
  }
}