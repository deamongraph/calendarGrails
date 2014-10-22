package practica8_20091275_20101022

class User {
    transient springSecurityService
    String username
    String password
    // opcionales
    String email
    String nombres
    int tiempo
    //EventoCalendario calendario
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true
        password blank: false
        nombres blank: true
        email email: true, blank: false, unique: true
        tiempo blank: false, min: 0
       // calendario nullable: true
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role }
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }
}
