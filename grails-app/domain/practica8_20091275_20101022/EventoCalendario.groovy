package practica8_20091275_20101022

import grails.rest.Resource
import org.springframework.format.annotation.DateTimeFormat



@Resource(uri = "/calendario", formats = ["html"] )
class EventoCalendario {
    String description // description of the event
    Date startDate // event start date
    Date endDate // event end date
    Boolean allDay // is all day event?
    String usuario
    //static belongsTo = [usuario:User]

    static EventoCalendario create(User user, boolean flush = false) {
        def instance = new EventoCalendario(user: user)
        instance.save(flush: flush, insert: true)
        instance
    }
    static constraints = {

        startDate blank: false
        description blank:false
        usuario blank:true
        endDate validator: { value, season ->
            return value && value > season.startDate
        }

    }
}
