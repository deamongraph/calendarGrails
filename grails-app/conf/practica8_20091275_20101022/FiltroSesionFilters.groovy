package practica8_20091275_20101022

class FiltroSesionFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
               /* if (!session.usuario && !controllerName.equals("Usuario") && !actionName.equals("login")
                        && !actionName.equals("authenticate")
                ) {
                    redirect(controller: "Usuario", action: 'login')
                    return false
                }*/
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
