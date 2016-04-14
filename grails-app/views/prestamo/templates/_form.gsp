<%@ page import="lab.Prestamo" %>
<%@ page import="lab.InstanciaMateria" %>

<g:hiddenField  id="sesion" name="sesion.id" value="${session?.sesion?.id}" />

<!--Inscripcion aval -->
<!-- Seleccionar Instancia  materia -->
<div class="fieldcontain">
	<label for="instanciaMateria">
		Materia	
	</label>
	<g:select name="instanciaMateria.id" from="${lab.InstanciaMateria.list()}" optionKey="id"
                noSelection="['':'Materia']"
                onchange="${remoteFunction (
                        controller: 'inscripcion',
                        action: 'cargarAlumnosParaInstanciaMateria',
                        params: '\'instanciaMateria.id=\' + this.value',
                        update: 'aval'
                )}" />
</div>

<div class="fieldcontain">
	<label for="aval">
		Aval
	</label>
	<select id= "aval" name = "aval">
		<option>Alumno</option>
	</select>
</div>
