import practica8_20091275_20101022.Usuario

class BootStrap {

    def init = { servletContext ->

        def admin = new Usuario(nombreusuario:"admin",
                contrasena:"admin",
                nombres:"Administrador",
                email:"info@host809.com",
                 tiempo:10)
        admin.save()
    }
    def destroy = {
    }
}
