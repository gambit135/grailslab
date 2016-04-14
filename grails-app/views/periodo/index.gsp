<%@ page import="lab.Periodo" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Lista de Periodos"/></title>
    <g:set var="entityName" value="Periodo" />
    <!--Render page tasks head -->
  </head>
  <body>

     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-periodos" class="content scaffold-list" role="main">
      <h1><g:message code = "Lista de Periodos"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>

            <g:sortableColumn property="periodo" title="${message(code: 'Periodo', default: 'Periodo')}" />         
            
          </tr>          
          
        </thead>
        <tbody>
          <g:each in="${periodos}" status="i" var="periodo">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <td>
                 <g:link action="show" id="${periodo.id}">
                    ${fieldValue(bean: periodo, field: "periodo")}
                 </g:link>
              </td>              
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${periodoInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>