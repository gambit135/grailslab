<%@ page import="lab.Sesion" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Lista de Sesiones"/></title>
    <g:set var="entityName" value="Sesión" />
    <!--Render page tasks head -->
  </head>
  <body>

     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-sesions" class="content scaffold-list" role="main">
      <h1><g:message code = "Lista de Sesiones"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>
            <g:sortableColumn property="fecha" title="${message(code: 'fecha.label', default: 'Fecha')}" />
            <g:sortableColumn property="user" title="${message(code: 'user.label', default: 'Usuario')}" />

    
          </tr>          
          
        </thead>
        <tbody>
          <g:each in="${sesiones}" status="i" var="sesion">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">           
              <td>
                <g:link action="show" id="${sesion.id}">
                  <g:formatDate date="${sesion?.fecha}" formatName = "formato.fecha" />
                </g:link>
              </td>  
              <td>
                <g:fieldValue disabled="true" bean= "${sesion?.user}" field="name"/>
              </td>           
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${sesionInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>