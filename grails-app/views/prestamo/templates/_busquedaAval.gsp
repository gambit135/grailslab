
<%@ page import="lab.Inscripcion" %>
<%@ page import="lab.InscripcionController" %>
<%@ page import="lab.Alumno" %>
<%@ page import="lab.Periodo" %>

<g:hiddenField name="accion" value="seleccionarAval" />
<g:hiddenField name="periodo" value="${params?.periodo}" />
<g:hiddenField name="materia" value="${params?.materia}" />
<g:hiddenField name="buscando" value="true" />

<div class="fieldcontain">

	<label for="periodo.id">
		Periodo
	</label>
	<!-- Periodo escolar Combo. onChange for loading instanciasMateriasByPeriodo-->
	<select id ="periodo.id" name = "periodo.id" onchange="${remoteFunction (
	                        controller: 'inscripcion',
	                        action: 'cargarInscripcionesPorPeriodo',
	                        params: '\'periodo.id=\' + this.value',
	                        update: 'instanciaMateria'
	                )}">
		<g:if test = "${params?.periodo}">
			<option value = "0">Periodo</option>
			<g:each in ="${lab.Periodo.list()}">
					<option value = "${it.id}"
						<g:if test="${params.periodo.toInteger() == it.id}">
							selected = "selected"
						</g:if>
					>${it}</option>
			</g:each>
		</g:if>
		<g:else>
	    	<option value = "0">Periodo</option>
	    	<g:each in ="${lab.Periodo.list()}">
	    		<option value = "${it.id}">${it}</option>
	    	</g:each>
		</g:else>
	</select>
	
</div>

<!-- Instancia Materia Combo -->
<div class="fieldcontain">
	<label for="instanciaMateria">
		Materia
	</label>
	<select id= "instanciaMateria" name = "instanciaMateria">
		<g:if test = "${params?.periodo}">
			<option>Instancia Materia</option>
			<g:each in = "${lab.InstanciaMateria.findAllByPeriodo(Periodo.get(params.periodo.toInteger()), [sort: 'periodo'])}">
				<option value = "${it?.id}"
				<g:if test = "${params?.materia.toInteger() == it?.id}">
					selected = "selected"
				</g:if>
				>${it}</option>
			</g:each>
		</g:if>
		<g:else>
			<option>Instancia Materia</option>
		</g:else>
	</select>

</div>

<div class="fieldcontain">
	<label for="criterio">Buscar por Boleta:</label>
	<g:textField name="criterio" value="${params.criterio}"/>
</div>

<script>

	var formu = document.busquedaPor;
	formu.addEventListener(
	    'submit',
	    function() {
	    	//Before submiting the document, send hidden magic
	    	//Set Materia Value
	    	var comboMateria = document.getElementById("instanciaMateria")
	    	var comboPeriodo = document.getElementById("periodo.id")
	    	document.busquedaPor.materia.value = comboMateria.options[comboMateria.selectedIndex].value;
	    	document.busquedaPor.periodo.value = comboPeriodo.options[comboPeriodo.selectedIndex].value;
	    	//alert("olakase")
	    },
	    false
	);
</script>

<!-- Mostrar resultados de la búsqueda -->
<g:if test = "${params.buscando == 'true' && params.criterio && params.materia}">
	<fieldset>
		<table>
		    <thead>
		    	<tr>
			    	<td>
			    		Boleta
			    	</td>
			    	<td>
			    		Alumno
			    	</td>
			    	<td>
			    		Materia
			    	</td>
			    	<td>
			    		Grupo
			    	</td>
			    	<td>
			    		Día de la semana
			    	</td>
			    	<td>
			    		Hora
			    	</td>
		    	</tr>
		    </thead>
		  	<tbody>
		  		<g:each in = "${new InscripcionController().buscarPorBoleta(params.criterio, params.materia)}" var = "inscripcion" status = "i">
		  			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
		  				<td>
		  			 		<input type="radio" name="resultados" value="${inscripcion.id}" />${inscripcion?.alumno?.boleta}
		  				</td><td>
		  			 		${inscripcion?.alumno}
		  				</td>
		  			 	<td>
		  			 		<g:link action="show" controller = "instanciaMateria" id="${inscripcion?.instanciaMateria?.id}">
			                	${inscripcion?.instanciaMateria?.materia}
			                </g:link>
		  			 	</td>
		  			 	<td>${inscripcion?.instanciaMateria?.grupo}
		  			 	</td>
		  			 	<td>
		  			 		<g:message code="ENUM.DiasSemana.${inscripcion?.instanciaMateria?.diaDeLaSemana}" /> 
		  			 	</td>
		  			 	<td>
		  			 		<g:message code="ENUM.horasDeClase.${inscripcion?.instanciaMateria?.hora}" />
		  			 	</td>
		  			</tr>
		  		</g:each>
		  	</tbody>
		 </table>
	<fieldset>
	<script type = "text/javascript">		
		var radios = document.busquedaPor.resultados;
		for(var i = 0; i < radios.length; i++) {	
			var valor = radios[i].value
		    radios[i].onclick = function() {
		    	//On Click, change value of hidden field for selected material id
				alert("Radio: " + radios.value)
		    	document.getElementById('seleccionRadio').value = valor
		    	alert(document.getElementById('seleccionRadio').value)
		    };
		}
	</script>
</g:if>