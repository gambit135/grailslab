
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <div id="header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Laboratorio"/></title>
  </head>
  <body>
    <h1>Panel de control de Laboratorio</h1>
     <h1>Usuario:
          <span id="userName">
            ${session?.user?.name}
          </span>
    </h1>

    <div id="list-tasks" class="content scaffold-list" role="main">
        <div style="margin-top:30px">
      <div style="margin-left:20px">
      <g:if test="${session?.user}">
           <!--Print control panel -->
          <ul>
            <li>
              <g:link controller = "user" action = "index">Usuarios</g:link>
            </li>
            <li>
              <g:link controller ="user" action = "events">Eventos del sistema </g:link>              
            </li>
            <li>
              <g:link controller ="alumno" action = "index">Alumnos</g:link>              
            </li>
            <li>
              <g:link controller ="profesor" action = "index">Profesores</g:link>              
            </li>
            <li>
              <g:link controller ="materia" action = "index">Catálogo de materias</g:link>              
            </li>
            <li>
              <g:link controller ="instanciaMateria" action = "index">Instancias de materias</g:link>              
            </li>
            <li>
              <g:link controller ="inscripcion" action = "index">inscripciones de alumnos a instancias de materias</g:link>            
            </li>
            <li>
              <g:link controller ="periodo" action = "index">Periodos escolares</g:link>
            </li>
            <li>
              <g:link controller ="sesion" action = "index">Sesiones de Préstamo</g:link> 
            </li>
            <li>
              <g:link controller ="prestamo" action = "index">Prestamos por sesión</g:link>               
            </li>
            <li>
              <g:link controller ="material" action = "index">Materiales</g:link>
            </li>
            <li>
              <g:link controller ="estado" action = "index">Estados del material</g:link> 
            </li>
            <li>
              <g:link controller ="tipoMaterial" action = "index">Tipos de material</g:link>    
            </li>
            <li>
              <g:link controller="user" action="logout">Logout</g:link><br>
            </li>
          </ul>   
        </div>
        </div>
        </div>
      </g:if>
      <g:else>
      <div id="loginBox" class="loginBox">
        <g:form
          name="loginForm"
          url="[controller:'user',action:'login']">
          <div>Username:</div>
          <g:textField name="name"
                       value="${fieldValue(bean:loginCmd, field:'name')}">
          </g:textField>
          <div>Password:</div>
          <g:passwordField name="password"></g:passwordField>     
          <br/>
          <input  type="image"
              src="${createLinkTo(dir:'images/entrar', file:'entrar1.gif')}"
              name="loginImage" id="loginImage" border="0"
              onMouseOver="cambia(1);" onMouseOut="cambia(2);" onMouseDown="cambia(3);"></input>
        </g:form>
        <g:renderErrors bean="${loginCmd}"></g:renderErrors>
      </g:else>
    </div>
    <script language = "javascript">
    function cambia(c){
        switch(c){
                case 1:
                        //loginImage is the name att of the image HTML element
                        document.getElementById("loginImage").src = "${createLinkTo(dir:'images/entrar', file:'entrar2.gif')}";
                        break;
                case 2:
                        document.getElementById("loginImage").src = "${createLinkTo(dir:'images/entrar', file:'entrar1.gif')}";
                        break;
                case 3:
                        document.getElementById("loginImage").src = "${createLinkTo(dir:'images/entrar', file:'entrar3.gif')}";
                        break;
        }
    };
    </script>
  </body>
</html>
