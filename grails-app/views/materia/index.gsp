<%@ page import="lab.Materia" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Catálogo de Materias"/></title>
    <g:set var="entityName" value="Materia" />
    <!--Render page tasks head -->
  </head>
  <body>

     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-materias" class="content scaffold-list" role="main">
      <h1><g:message code = "Catálogo de Materias"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>

            <g:sortableColumn property="nombre" title="${message(code: 'Nombre de Materia', default: 'Materia')}" />
          
            <g:sortableColumn property="nivel" title="${message(code: 'Nivel', default: 'Nivel')}" />
          
        </thead>
        <tbody>
          <g:each in="${materias}" status="i" var="materia">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <td>
                 <g:link action="show" id="${materia.id}">
                  ${fieldValue(bean: materia, field: "nombre")}
                 </g:link>
              </td>
              <td>
                ${fieldValue(bean: materia, field: "nivel")}
              </td>                 
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${materiaInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>