<%@ page import="lab.Estado" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Lista de Estados de Material"/></title>
    <g:set var="entityName" value="Estado" />
    <!--Render page tasks head -->
  </head>
  <body>
     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-estados" class="content scaffold-list" role="main">
      <h1><g:message code = "Lista de Estados de Material"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>

            <g:sortableColumn property="nombre" title="${message(code: 'Nombre', default: 'Estado')}" />
            
            
          </tr>          
          
        </thead>
        <tbody>
          <g:each in="${estados}" status="i" var="estado">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <td>
                 <g:link action="show" id="${estado.id}">
                    ${fieldValue(bean: estado, field: "nombre")}
                 </g:link>
              </td>  
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${estadoInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>