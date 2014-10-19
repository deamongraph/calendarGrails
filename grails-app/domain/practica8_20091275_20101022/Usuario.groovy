package practica8_20091275_20101022

class Usuario {
    //transient springSecurityService
    String nombreusuario
    String contrasena
    String email
    String nombres
    int tiempo
    static belongsTo = EventoCalendario
    // static transients = ['springSecurityService']
    static constraints = {
        nombreusuario blank: false, unique:true
        contrasena blank: false, password:true
        nombres blank: true
        email email: true, blank: false, unique: true
        tiempo blank: false, min: 0
    }

}
