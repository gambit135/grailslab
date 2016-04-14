<%@ page import="lab.Material" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Lista de Materiales"/></title>
    <g:set var="entityName" value="Material" />
    <!--Render page tasks head -->
  </head>
  <body>

     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-materiales" class="content scaffold-list" role="main">
      <h1><g:message code = "Lista de Materiales"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>
            <g:sortableColumn property="nombre" title="${message(code: 'Nombre' )}" />
            <g:sortableColumn property="tipoMaterial" title="${message(code: 'Tipo de Material' )}" />
            <g:sortableColumn property="codigo" title="${message(code: 'Código' )}" />
            <g:sortableColumn property="estado" title="${message(code: 'Estado' )}" />                
        </thead>
        <tbody>
          <g:each in="${materiales}" status="i" var="material">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <td>
                <g:link action="show" id="${material.id}">
                  ${fieldValue(bean: material, field: "nombre")}
                </g:link>
              </td> 
              <td>
                <g:link action="show" id="${material.id}">
                  ${material?.tipoMaterial.toString()}
                </g:link>
              </td> 
              <td>
                <g:link action="show" id="${material.id}">
                 ${fieldValue(bean: material, field: "codigo")}
                </g:link>
              </td> 
              <td>                
                  ${material?.estado?.toString()}        
              </td>              
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${materialInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>