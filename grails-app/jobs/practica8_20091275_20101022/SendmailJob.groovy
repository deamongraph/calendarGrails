package practica8_20091275_20101022

import java.lang.reflect.Array


class SendmailJob {
    def key = true
    def listEmailUsers = [:]
    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }
    def listaMailed = []

    def execute() {
        // execute job
        //aqui debo comprobar si para cada usuario registrado se cumple que el (TIEMPO ACTUAL - tiempo puesto)  = /
        //entonces enviar correo
        //println("hola")
        Date now = new Date()
        List<User> usuarios = User.findAll();
        //print(usuarios.tiempo)
        for (User usr : usuarios) {

        now.setMinutes(now.minutes + usr.tiempo) // la fecha de ahora + el tiempo del usurio
        //print(now)
        //println(EventoCalendario.findAllByStartDateGreaterThanEqualsAndUsuario(now,usr.username))
        def listaUsuario = EventoCalendario.findAllByStartDateGreaterThanEqualsAndUsuario(now,usr.username).usuario


            for(user in listaUsuario){
                def email_user = User.findByUsername(user).email
                listEmailUsers[key] = email_user
                println(email_user)
                if(!listaMailed.contains(email_user)){

                listaMailed.add(email_user)
                }

            }


         }


    }
}
