
import practica8_20091275_20101022.EventoCalendario
import practica8_20091275_20101022.User
import practica8_20091275_20101022.Role
import practica8_20091275_20101022.UserRole

class BootStrap {

    def init = { servletContext ->
        //Creando el rol
        def roleAdmin = new Role(authority: "ROLE_ADMIN").save(failOnError: true);
        def roleUsuario = new Role(authority: "ROLE_USUARIO").save(failOnError: true);

        //creando el usuario.
        def admin=new User(username: "admin", password: "admin", accountExpired: false, accountLocked: false, passwordExpired: false,email:"info@host809.com", nombres: "frangel hernandez").save(failOnError: true);
        def usuario=new User(username: "usuario", password: "usuario", accountExpired: false, accountLocked: false, passwordExpired: false,email:"brian@briandiaz.me", nombres: "brian diaz").save(failOnError: true);

        //asignando el usuario.
        UserRole.create(admin, roleAdmin, true);
        UserRole.create(usuario, roleAdmin, true);

       // def calendarioadmin =new CalendarioUsuario()
        /*def admin = new Usuario(nombreusuario:"admin",
                contrasena:"admin",
                nombres:"Administrador",
                email:"info@host809.com",
                 tiempo:10,
                 calendario: new EventoCalendario()
        )
        admin.save()*/
    }
    def destroy = {
    }
}
