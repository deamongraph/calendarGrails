package practica8_20091275_20101022
import practica8_20091275_20101022.CalendarioUsuario
class Usuario {
    //transient springSecurityService
    String nombreusuario
    String contrasena
    String email
    String nombres
    int tiempo
   // EventoCalendario calendario = new EventoCalendario();
    //CalendarioUsuario calendario
    static hasOne = [Calendariousuario:CalendarioUsuario]
    // static transients = ['springSecurityService']
    static constraints = {
        nombreusuario blank: false, unique:true
        contrasena blank: false, password:true
        nombres blank: true
        email email: true, blank: false, unique: true
        tiempo blank: false, min: 0

    }

    static mapping = {
        table 'usuario'
    }
}
