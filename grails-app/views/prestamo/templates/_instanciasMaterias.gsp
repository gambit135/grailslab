<!-- This template renders a drop down after InstanciaMateria is selected -->

<select name="instanciaMateria" id="instanciaMateria">
	<g:each in = "${instancias}">
		<option value = "${it?.id}"
		<g:if test = "${params?.materia == it?.id}">
			selected = "selected"
		</g:if>
		>${it}</option>
	</g:each>
</select>