<%@ page import="lab.Prestamo" %>

<html>
	<head>
		
		<div id="header">
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Prestamo" />

		<!-- PAGE TITLE -->
		<title><g:message code="Asignar alumnos a Préstamo" /></title><meta name="layout" content="main">

	</head>
	<body>
		<!--NAVIGATION PANEL -->    
    	<g:render template="templates/navigation/navCreate"/> 

		<!-- ACTUAL PAGE CONTENT -->

		<div id="edit-prestamo" class="content scaffold-edit" role="main">
			<h1>Agregar Material a Préstamo</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${prestamoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${prestamoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<!--Form with the general data of préstamo -->
			<g:render template = "templates/datosMateriales"/>

			<!--Form with the set of radio inputs for search criteria -->
			<g:form name = "busquedaPor" url="[resource:prestamoInstance, action:'busquedaDeMaterialPor']" method="PUT" >
				<fieldset class="form">					
					<g:render template = "templates/radiosBusqueda" />				
				</fieldset>
			</g:form>			
	
			<!--Form with conditionally displayed search boxes -->					
			<g:render template="templates/buscaMateriales"/>

			<g:form nombre = "formMaterial" id = "formMaterial" url="[resource:prestamoInstance, action:'agregarTuplaMaterial']" method="PUT" >

				<g:hiddenField name="prestamoInstance" value="${prestamoInstance?.id}" />
				<g:hiddenField name="version" value="${prestamoInstance?.version}" />
				<input type="hidden" id = "seleccionRadio" name = "seleccionRadio" value="0"/>
				<fieldset class="form">
					<!--This renders a template for the prestamo fields -->					
					<g:render template="templates/materiales"/>
				</fieldset>

				<!-- submits can be customized via actionSubmit to point to any action you want -->
				<!-- Thus, those are the ones that should be parameterized -->
				
				<fieldset class="buttons">
					<g:actionSubmit class = "delete" action="delete" value="Cancelar" onclick = "return confirm('¿Deseas borrar este préstamo?')" />
					<g:link action="registrarAlumnos" id = "${prestamoInstance.id}">Volver a alumnos </g:link>
					<g:hiddenField name="accion" value="registrarTuplasMaterial" />					

					<g:if test = "${params.buscarPor != 'manual' && params?.criterio}" >
						<g:if test = "${encontrados == true}" >
							<g:actionSubmit class="save" action="atmpr" value="Agregar Material Por Búsqueda" />
						</g:if>						
					</g:if>
					<g:if test = "${params.buscarPor == 'manual'}" >
						<g:actionSubmit class="save" action="agregarTuplaMaterial" value="Agregar Material" />
					</g:if>
					
					<g:link class="create" action="index">Terminar</g:link>
				</fieldset>

			</g:form>
		</div>
		<g:if test = "${firstChecked == true}">
			<script>
				var radios = document.buscaPor.resultados;
				document.getElementById('seleccionRadio').value = radios.value
				//alert("seleccionRadio: " + document.getElementById('seleccionRadio').value)
			</script>
		</g:if>
	</body>	
</html>