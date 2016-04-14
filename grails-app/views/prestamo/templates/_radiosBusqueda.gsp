
<%@ page import="lab.Material" %>
<%@ page import="lab.Estado" %>
<%@ page import="lab.TipoMaterial" %>

<g:hiddenField name="accion" value="registrarTuplasMaterial" />
<g:hiddenField name="criterio" value="${params.buscarPor}" />

<div class="fieldcontain">
	<label for="buscarPor">
		Buscar por
	</label>
	<input type="radio" name="buscarPor" value="codigo"
		<g:if test="${params.buscarPor == 'codigo' || params.buscarPor==null}">
			checked="true"
		</g:if>
	/>Código
	<input type="radio" name="buscarPor" value="nombre"
	<g:if test="${params.buscarPor == 'nombre'}">
		checked="true"
	</g:if>
	/> Nombre
	<input type="radio" name="buscarPor" value="tipo"
	<g:if test="${params.buscarPor == 'tipo'}">
		checked="true"
	</g:if>
	/> Tipo
	<input type="radio" name="buscarPor" value="manual"
	<g:if test="${params.buscarPor == 'manual'}">
		checked="true"
	</g:if>
	/> Manual

</div>

<script>
	var radios = document.busquedaPor.buscarPor;
	var criterio = document.busquedaPor.criterio;
	for(var i = 0; i < radios.length; i++) {		
	    radios[i].onclick = function() {
	    	//On Click, submit form with selected value
	    	document.busquedaPor.submit();
	    };
	}
</script>