package practica8_20091275_20101022



class SendmailJob {
    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }

    def execute() {
        // execute job
      //aqui debo comprobar si para cada usuario registrado se cumple que el (TIEMPO ACTUAL - tiempo puesto)  = /
      //entonces enviar correo
        Date now = new Date()

        def results = EventoCalendario.findAll {
            startDate == now
        }
        if(results.contains(now))
            println(now)




    }
}
