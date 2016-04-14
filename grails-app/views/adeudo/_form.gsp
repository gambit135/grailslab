<%@ page import="lab.Adeudo" %>
<!-- Información del préstamo -->
<fieldset class="form">
	<!-- Aval del préstamo -->
	<div class = "fieldcontain">
		<label for="aval">
			Aval		
		</label>
		${adeudoInstance?.tuplaMaterial?.prestamo?.aval?.alumno}<br/><br/>
		<label>
		</label>
		${adeudoInstance?.tuplaMaterial?.prestamo?.aval?.instanciaMateria}<br/><br/>
	</div>

	<!-- Material en deuda -->
	<div class = "fieldcontain">
		<label for="aval">
			Material en deuda		
		</label>
		${adeudoInstance?.tuplaMaterial?.material}<br/><br/>		
	</div>
</fieldset>


<!--Concepto y descripción -->
<fieldset class="form">
	<div class="fieldcontain ${hasErrors(bean: adeudoInstance, field: 'concepto', 'error')} ">
		<label for="concepto">
			<g:message code="adeudo.concepto.label" default="Concepto" />		
		</label>
		<g:textField name="concepto" value="${adeudoInstance?.concepto}"/>
	</div>

	<div class="fieldcontain ${hasErrors(bean: adeudoInstance, field: 'descripcion', 'error')} ">
		<label for="descripcion">
			<g:message code="adeudo.descripcion.label" default="Descripcion" />
		</label>
		<g:textField name="descripcion" value="${adeudoInstance?.descripcion}"/>
	</div>
</fieldset>

<fieldset class="form">
	<div class="fieldcontain ${hasErrors(bean: adeudoInstance, field: 'saldado', 'error')} ">
		<label for="saldado">
			<g:message code="adeudo.saldado.label" default="Saldado" />
		</label>
		<g:checkBox name="saldado" value="${adeudoInstance?.saldado}" />
	</div>
</fieldset>
