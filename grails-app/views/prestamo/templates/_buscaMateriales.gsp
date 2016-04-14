
<%@ page import="lab.Material" %>
<%@ page import="lab.Estado" %>
<%@ page import="lab.TipoMaterial" %>
<%@ page import="lab.MaterialController" %>
<g:set var = "encontrados" value = "${false}" scope = "request" />

<!-- Barra de búsqueda de tipos de materiales por Código -->
<g:if test = "${params.buscarPor == 'codigo'}" >
	<g:form id="buscaPor" name = "buscaPor" controller = "prestamo" url="[resource:prestamoInstance, action:'buscar']" method="GET">
		<g:hiddenField name="accion" value="registrarTuplasMaterial" />
		<g:hiddenField name="buscarPor" value="codigo" />
		<g:hiddenField name="buscando" value="true" />
		<fieldset class="form">
		<div class="fieldcontain">
			<label for="query">Buscar por Código:</label>
			<g:textField name="criterio" value="${params.criterio}"/>
		</div>
		</fieldset>
		<fieldset>
			<g:if test = "${params.buscando == 'true'}">
				<!-- render index-like table here -->
				<table>
			        <thead>
			        	<tr>
			        		<th>
							Nombre </th>
							<th>Tipo de Material</th>
							<th>Código</th>
							<th>Estado</th>
						</tr>
        			</thead>
        			<tbody>        				
						<g:each in = "${new MaterialController().buscarPorCodigo(params?.criterio)}" var = "material" status = "i">
							<g:set var = "encontrados" value = "${true}" scope = "request" />
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>
									<input type="radio" name="resultados" id = "resultados" value="${material.id}" 
									<g:if test = "${i == 0}">
										<g:set var = "firstChecked" value = "${true}" scope = "request" />
										checked
									</g:if>
									/>
									<g:link action="show" controller = "material" id="${material.id}">
										${fieldValue(bean: material, field: "nombre")}
									</g:link>
								</td> 
								<td>
									${material?.tipoMaterial.toString()}
								</td> 
								<td>
								<g:link action="show" controller = "material" id="${material.id}">
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
			</g:if>
		</fieldset>
	</g:form>	
</g:if>

<!-- Barra de búsqueda de tipos de materiales por Nombre -->
<g:if test = "${params.buscarPor == 'nombre'}" >
	<g:form id="buscaPor" name = "buscaPor" controller = "prestamo" url="[resource:prestamoInstance, action:'buscar']" method="GET">
		<g:hiddenField name="accion" value="registrarTuplasMaterial" />
		<g:hiddenField name="buscarPor" value="nombre" />
		<g:hiddenField name="buscando" value="true" />
		<fieldset class="form">
		<div class="fieldcontain">
			<label for="query">Buscar por Nombre:</label>
			<g:textField name="criterio" value="${params.criterio}"/>
		</div>
		</fieldset>
		<fieldset>
			<g:if test = "${params.buscando == 'true'}">
				<!-- render index-like table here -->
				<table>
			        <thead>
			        	<tr>
			        		<th>
							Nombre </th>
							<th>Tipo de Material</th>
							<th>Código</th>
							<th>Estado</th>
						</tr>
        			</thead>
        			<tbody>        				
						<g:each in = "${new MaterialController().buscarPorNombre(params?.criterio)}" var = "material" status = "i">
							<g:set var = "encontrados" value = "${true}" scope = "request" />
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>
									<input type="radio" name="resultados" id = "resultados" value="${material.id}" 
									<g:if test = "${i == 0}">
										<g:set var = "firstChecked" value = "${true}" scope = "request" />
										checked
									</g:if>
									/>
									<g:link action="show" controller = "material" id="${material.id}">
										${fieldValue(bean: material, field: "nombre")}
									</g:link>
								</td> 
								<td>
									${material?.tipoMaterial.toString()}
								</td> 
								<td>
								<g:link action="show" controller = "material" id="${material.id}">
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
			</g:if>
		</fieldset>
	</g:form>	
</g:if>

<!-- Barra de búsqueda de tipos de materiales por Tipo -->
<g:if test = "${params.buscarPor == 'tipo'}" >
	<g:form id="buscaPor" name = "buscaPor" controller = "prestamo" url="[resource:prestamoInstance, action:'buscar']" method="GET">
		<g:hiddenField name="accion" value="registrarTuplasMaterial" />
		<g:hiddenField name="buscarPor" value="tipo" />
		<g:hiddenField name="buscando" value="true" />
		<fieldset class="form">
		<div class="fieldcontain">
			<label for="query">Buscar por Tipo:</label>
			<g:textField name="criterio" value="${params.criterio}"/>
		</div>
		</fieldset>
		<fieldset>
			<g:if test = "${params.buscando == 'true'}">
				<!-- render index-like table here -->
				<table>
			        <thead>
			        	<tr>
			        		<th>
							Nombre </th>
							<th>Tipo de Material</th>
							<th>Código</th>
							<th>Estado</th>
						</tr>
        			</thead>
        			<tbody>        				
						<g:each in = "${new MaterialController().buscarPorTipo(params?.criterio)}" var = "material" status = "i">
							<g:set var = "encontrados" value = "${true}" scope = "request" />
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>
									<input type="radio" name="resultados" id = "resultados" value="${material.id}"
									<g:if test = "${i == 0}">
										<g:set var = "firstChecked" value = "${true}" scope = "request" />
										checked
									</g:if>
									 />
									<g:link action="show" controller = "material" id="${material.id}">
										${fieldValue(bean: material, field: "nombre")}
									</g:link>
								</td> 
								<td>
									${material?.tipoMaterial.toString()}
								</td> 
								<td>
								<g:link action="show" controller = "material" id="${material.id}">
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
			</g:if>
		</fieldset>
	</g:form>	
</g:if>

<g:if test = "${params.buscarPor != 'manual' && params.buscando == 'true'}" >

	<script>		
		var radios = document.buscaPor.resultados;
		for(var i = 0; i < radios.length; i++) {		
		    radios[i].onclick = function() {
		    	//On Click, change value of hidden field for selected material id
		    	document.getElementById('seleccionRadio').value = radios.value
		    	//alert("SeleccionRadio: " + document.getElementById('seleccionRadio').value)
		    };
		}
	</script>
	

</g:if>