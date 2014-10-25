package practica8_20091275_20101022

import grails.plugin.mail.MailService

import java.lang.reflect.Array


class SendmailJob {

    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }
    def mailService
    def listaMailed = []

    def execute() {
        // execute job


        Date now = new Date()
        List<User> usuarios = User.findAll();
        //print(usuarios.tiempo)
        //for (User usr : usuarios) {

      // la fecha de ahora + el tiempo del usurio
        //print(now)
       // println(EventoCalendario.findAllByStartDateGreaterThanEqualsAndUsuario(now,us))
        def eventos = EventoCalendario.findAllByStartDateGreaterThan(now) // esto trae todos los eventos que son mayores a la fecha actual

        for(EventoCalendario evento:eventos)
        {
         now.setMinutes(now.minutes +evento.preaviso) // actualizar el tiempo NOW = fecha actual + tiempo evento
        if(!evento.notificado && evento.startDate<now) {
            String mail = User.findByUsername(evento.usuario).email
            evento.notificado = true
            String cuerpo = 'Evento: '+evento.description+'Comienza el: '+evento.startDate+' Termina el: '+evento.endDate
            println("enviado \n")
            println(mail+"\n"+cuerpo)
            if (mail) {

            mailService.sendMail {
                to mail
                subject "Usted tiene un nuevo evento"
                body cuerpo
            }
             }
        }

        }
        println("1:")




/*
            for(user in listaUsuario){
                def email_user = User.findByUsername(user).email
                listEmailUsers[key] = email_user
                println(email_user)
                if(!listaMailed.contains(email_user)){

                listaMailed.add(email_user)
                }

            }
*/

        // }


    }
}
