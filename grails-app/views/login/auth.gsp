<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Iniciar sesion</title>
    <asset:stylesheet src="principal.css"/>
    <asset:javascript src="principal.js" />

</head>
<body>
<div class="container-fluid">
    <div class="row ">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default ">
                <div class="panel-heading"><g:message code="springSecurity.login.header"/></div>
                <div class="panel-body">

                    <g:if test='${flash.message}'>
                        <p class="text-warning">
                            ${flash.message}
                        </p>
                    </g:if>


                    <form action='${postUrl}' method='POST' id='loginForm' role="form" autocomplete='off'>

                        <div class="form-group">
                            <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                            <input type='text' class="form-control" name='j_username' id='username'/>
                        </div>

                        <div class="form-group">
                            <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                            <input type='password' class="form-control" name='j_password' id='password'/>
                        </div>

                        <div class="checkbox">
                            <label for='remember_me'>
                                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                <g:message code="springSecurity.login.remember.me.label"/>
                            </label>
                        </div>

                        <p>
                            <input class="btn btn-default" type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
                        </p>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<script type='text/javascript'>
    <!--
    (function() {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>

</body>
</html>