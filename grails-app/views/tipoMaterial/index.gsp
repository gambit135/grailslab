<%@ page import="lab.TipoMaterial" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Lista de Tipos de Materiales"/></title>
    <g:set var="entityName" value="TipoMaterial" />
    <!--Render page tasks head -->
  </head>
  <body>
     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-tipsoMaterial" class="content scaffold-list" role="main">
      <h1><g:message code = "Lista de Tipos de Materiales"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>

            <g:sortableColumn property="tipo" title="${message(code: 'Tipo de Material', default: 'Tipo Material')}" />
            
            
          </tr>          
          
        </thead>
        <tbody>
          <g:each in="${tiposMaterial}" status="i" var="tipoMaterial">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <td>
                 <g:link action="show" id="${tipoMaterial.id}">
                    ${fieldValue(bean: tipoMaterial, field: "tipo")}
                 </g:link>
              </td>  
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${tipoMaterialInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>