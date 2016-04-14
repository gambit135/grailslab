<%@ page import="lab.InstanciaMateria" %>
<html>
  <head>

    <div id="header">
      <g:render template="/header"/> 
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:message code = "Lista de Instancias de Materias"/></title>
    <g:set var="entityName" value="InstanciaMateria" />
    <!--Render page tasks head -->
  </head>
  <body>

     <!--NAVIGATION PANEL -->    
    <div class="nav" role="navigation">
      <g:render template="templates/navigation/navIndex"/> 
    </div>

    <div id="list-instanciaMaterias" class="content scaffold-list" role="main">
      <h1><g:message code = "Lista de Instancias de Materias"/></h1>
      
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>

            <g:sortableColumn property="grupo" title="${message(code: 'Grupo' )}" />
            <g:sortableColumn property="materia" title="${message(code: 'Materia' )}" />            
            <g:sortableColumn property="diaDeLaSemana" title="${message(code: 'instanciaMateria.diaDeLaSemana.label')}" />
            <g:sortableColumn property="hora" title="${message(code: 'instanciaMateria.hora.label')}" />
          </tr>
        </thead>
        <tbody>
          <g:each in="${instanciaMaterias}" status="i" var="instanciaMateria">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
               <td>
                ${fieldValue(bean: instanciaMateria, field: "grupo")}
              </td> 
              <td>
                 <g:link action="show" id="${instanciaMateria.id}">
                  ${fieldValue(bean: instanciaMateria, field: "materia")}
                 </g:link>
              </td>
              <td>
                <g:message code="ENUM.DiasSemana.${instanciaMateria?.diaDeLaSemana}" /> 
              </td>
              <td>                
                <g:message code="ENUM.horasDeClase.${instanciaMateria?.hora}" />
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${instanciaMateriaInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>