package practica8_20091275_20101022

class FiltroSesionFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {/*
               if (!session.user && !controllerName.equals("User") && !actionName.equals("login")
                        && !actionName.equals("authenticate")
                ) {
                    redirect(controller: "User", action: 'login')
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
