<g:applyLayout name="plantillaBootstrap">
    <content tag="header">
       Iniciar sesión
    </content>

    <content tag="content">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
    <g:form action="authenticate" method="post" class="form-horizontal" >
            <div class="form-group">
                <label for="nombreusuario" class="col-sm-2 control-label">Nombre de Usuario</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="nombreusuario" name="nombreusuario"  placeholder="Nombre de Usuario">
                </div>
            </div>
            <div class="form-group">
                <label for="contrasena" class="col-sm-2 control-label">Contraseña</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Contraseña">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-6">
                    <g:link controller="Usuario" action='create' class="btn btn-info"><i class="fa fa-users"></i> Registrar Cuenta </g:link>
                    <button type="submit" class="btn btn-success"><i class="fa fa-sign-in"></i> Iniciar Sesión</button>
                </div>
            </div>
        </g:form>
    </content>

    <content tag="sidebar">
    </content>


</g:applyLayout>
