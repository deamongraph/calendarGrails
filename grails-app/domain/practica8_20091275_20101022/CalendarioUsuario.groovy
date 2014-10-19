package practica8_20091275_20101022


class CalendarioUsuario {
    String nombre

    Usuario usuario
    EventoCalendario eventos
    static constraints = {
        eventos nullable: true
        usuario nullable: true
    }
}
