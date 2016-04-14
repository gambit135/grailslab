<%@ page import="lab.Profesor" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Nombre"/></title>
    <g:set var="entityName" value="Profesor" />
    <!--Render page tasks head -->
  </head>
  <body>

     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-profesors" class="content scaffold-list" role="main">
      <h1><g:message code = "Lista de Profesores"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>

            <g:sortableColumn property="apPat" title="${message(code: 'Apellido Paterno', default: 'Apellido Paterno')}" />
          
            <g:sortableColumn property="apMat" title="${message(code: 'Apellido Materno', default: 'Apellido Materno')}" />
         
            <g:sortableColumn property="nombre" title="${message(code: 'Nombre', default: 'Nombre')}" />
          </tr>          
          
        </thead>
        <tbody>
          <g:each in="${profesores}" status="i" var="profesor">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <td>
                 <g:link action="show" id="${profesor.id}">
                  ${fieldValue(bean: profesor, field: "apPat")}
                 </g:link>
              </td>
              <td>
                ${fieldValue(bean: profesor, field: "apMat")}
              </td>
              <td>
                ${fieldValue(bean: profesor, field: "nombre")}
              </td>         
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${profesorInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>