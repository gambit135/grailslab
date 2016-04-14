<%@ page import="lab.Prestamo" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Lista de Préstamos"/></title>
    <g:set var="entityName" value="Prestamo" />
    <!--Render page tasks head -->
  </head>
  <body>

     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-prestamos" class="content scaffold-list" role="main">
      <h1><g:message code = "Lista de Préstamos" default = "Lista de Préstamos en Curso"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>
            <!--Materia -->
            <g:sortableColumn property="aval.instanciaMateria.materia.nombre" title="${message(code: 'prestamo.materia.label', default: 'Materia' )}" />
            <!-- <th><g:message code = "prestamo.materia.label"/></th> -->
            
            <!-- Aval Boleta-->
            <g:sortableColumn property="aval.alumno.boleta" title="${message(code: 'prestamo.aval.label', default: 'Boleta' )}" />

            <!-- Aval Apellido Paterno-->
            <g:sortableColumn property="aval.alumno.apPat" title="${message(code: 'prestamo.aval.label', default: 'Apellido Paterno' )}" />

            <!-- Aval Apellido Materno-->
            <g:sortableColumn property="aval.alumno.apMat" title="${message(code: 'prestamo.aval.label', default: 'Apellido Materno' )}" />

            <!-- Aval nombre-->
            <g:sortableColumn property="aval.alumno.nombre" title="${message(code: 'prestamo.aval.label', default: 'Nombre' )}" />
            
            <!-- Sesion.user -->
            <g:sortableColumn property="sesion" title="${message(code: 'Sesión' )}" />

            <!-- Equipo -->
            <!--<th><g:message code = "Equipo"/></th>-->

        </thead>
        <tbody>
          <g:each in="${prestamos}" status="i" var="prestamo">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

              <!-- Materia -->
               <td>
                  ${fieldValue(bean: prestamo?.aval?.instanciaMateria?.materia, field: "nombre")}
              </td>

              <!-- Aval Boleta-->
              <td>
                <g:link action="show" id="${prestamo.id}">
                  ${fieldValue(bean: prestamo?.aval.alumno, field: "boleta")} 
                </g:link>         
              </td>

              <!-- Aval Apellido Paterno-->
              <td>
                <g:link action="show" id="${prestamo.id}">
                  ${fieldValue(bean: prestamo?.aval.alumno, field: "apPat")} 
                </g:link>
              </td>
              
              <!-- Aval Apellido Materno-->
              <td>
                <g:link action="show" id="${prestamo.id}">
                  ${fieldValue(bean: prestamo?.aval.alumno, field: "apMat")} 
                </g:link>
              </td>

              <!-- Aval Apellido Nombre-->
              <td>
                <g:link action="show" id="${prestamo.id}">
                  ${fieldValue(bean: prestamo?.aval.alumno, field: "nombre")} 
                </g:link>
              </td>

              <!-- Sesión -->
              <td>
                  <g:formatDate date="${prestamo?.sesion?.fecha}" formatName = "formato.fecha" />                
              </td>

              <!-- Equipo -->
              <!--
              <td>
                <g:if test = "${prestamo?.inscripciones}"> 
                  <ul>
                  <g:each in="${prestamo?.inscripciones}">
                    <li>${fieldValue(bean: it?.alumno, field: "boleta")} ${fieldValue(bean: it?.alumno, field: "apPat")} ${fieldValue(bean: it?.alumno, field: "apMat")} ${fieldValue(bean: it?.alumno, field: "nombre")}</li>
                  </g:each>
                  </ul>                
              </g:if>
              </td>
              -->
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${prestamoInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>