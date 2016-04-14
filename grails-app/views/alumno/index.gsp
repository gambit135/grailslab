<%@ page import="lab.Alumno" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Lista de Alumnos"/></title>
    <g:set var="entityName" value="Alumno" />
    <!--Render page tasks head -->
  </head>
  <body>

     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-alumnos" class="content scaffold-list" role="main">
      <h1><g:message code = "Lista de Alumnos"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>
            <g:sortableColumn property="boleta" title="${message(code: 'boleta.label', default: 'Boleta')}" />

            <g:sortableColumn property="apPat" title="${message(code: 'apPat.label', default: 'Apellido Paterno')}" />
          
            <g:sortableColumn property="apMat" title="${message(code: 'apMat.label', default: 'Apellido Materno')}" />
         
            <g:sortableColumn property="nombre" title="${message(code: 'nombre.label', default: 'Nombre')}" />
          </tr>          
          
        </thead>
        <tbody>
          <g:each in="${alumnos}" status="i" var="alumno">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">           
              <td>
                <g:link action="show" id="${alumno.id}">
                  ${fieldValue(bean: alumno, field: "boleta")}
                </g:link>
              </td>
              <td>
                ${fieldValue(bean: alumno, field: "apPat")}
              </td>
              <td>
                ${fieldValue(bean: alumno, field: "apMat")}
              </td>
              <td>
                ${fieldValue(bean: alumno, field: "nombre")}
              </td>         
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${alumnoInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>