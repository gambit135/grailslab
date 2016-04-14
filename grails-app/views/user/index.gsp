<%@ page import="lab.User" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "user.list.label"/></title>
    <g:set var="entityName" value="Usuario" />
    <!--Render page tasks head -->
  </head>
  <body>

     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-users" class="content scaffold-list" role="main">
      <h1><g:message code = "user.list.label"/></h1>
      <h2>Usuarios: ${session?.users}</h2>
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>
            <g:sortableColumn property="name" title="${message(code: 'user.label', default: 'Nombre de Usuario')}" />
          </tr>
        </thead>
        <tbody>
          <g:each in="${users}" status="i" var="user">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">           
              <td>
                <g:link action="show" id="${user.id}">
                  ${fieldValue(bean: user, field: "name")}
                </g:link>
              </td>         
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${userInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>