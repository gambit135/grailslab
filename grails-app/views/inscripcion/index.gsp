<%@ page import="lab.Inscripcion" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Lista de Inscripciones"/></title>
    <g:set var="entityName" value="Inscripcion" />
    <!--Render page tasks head -->
  </head>
  <body>

     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-inscripcions" class="content scaffold-list" role="main">
      <h1><g:message code = "Lista de Inscripciones"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>

            <g:sortableColumn property="alumno" title="${message(code: 'Alumno' )}" />

            <g:sortableColumn property="instanciaMateria" title="${message(code: 'Materia' )}" />   

            <th>Grupo</th>

        </thead>
        <tbody>
          <g:each in="${inscripciones}" status="i" var="inscripcion">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">              
              <td>
                 <g:link action="show" id="${inscripcion.id}">
                  ${fieldValue(bean: inscripcion.alumno, field: "boleta")}
                  ${fieldValue(bean: inscripcion.alumno, field: "apPat")}
                  ${fieldValue(bean: inscripcion.alumno, field: "apMat")}
                  ${fieldValue(bean: inscripcion.alumno, field: "nombre")}
                 </g:link>
              </td>
              <td>
                 ${fieldValue(bean: inscripcion.instanciaMateria, field: "materia")}
              </td>
              <td>
                 ${fieldValue(bean: inscripcion.instanciaMateria, field: "grupo")}
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${inscripcionInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>