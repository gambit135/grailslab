<!-- This template renders a drop down after TipoMaterial is selected -->

<g:select name="comboMateriales" id="comboMateriales" from="${materiales}"
          noSelection="['':'Material']"optionKey="id"/> 