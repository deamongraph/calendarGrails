package practica8_20091275_20101022

import grails.rest.Resource
import org.springframework.format.annotation.DateTimeFormat



@Resource(uri = "/calendario", formats = ["html"] )
class EventoCalendario {

    String description // description of the event
    Date startDate // event start date
    Date endDate // event end date
    Boolean allDay // is all day event?


    static constraints = {
        startDate blank: false, unique:true
        description blank:false
        endDate validator: { value, season ->
            return value && value > season.startDate
        }

    }
}
