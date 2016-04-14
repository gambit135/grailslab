<!-- This template renders a drop down after Estado is selected -->

<g:select name="comboTiposMaterial" id="comboTiposMaterial" from="${tiposMaterial}"
          optionKey="id"
          noSelection="['':'Tipo']"
                onchange="${remoteFunction (
                        controller: 'material',
                        action: 'cargarMateriales',
                        params:'\'estado.id=\' + document.getElementById(\'estado.id\').value + \'&tipoMaterial.id=\' + this.value',
                        update: 'comboMateriales'
                )}" />