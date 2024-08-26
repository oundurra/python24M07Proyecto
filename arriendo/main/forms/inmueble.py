from django import forms
from main.models.inmueble import Inmueble

class Inmueble(forms.ModelForm):
    class Meta:
        model = Inmueble
        fields = ['inm_id'
                  , 'inm_nombre'
                  , 'inm_descripcion'
                  , 'inm_m2construidos'
                  , 'inm_m2total'
                  , 'inm_num_estacionamientos'
                  , 'inm_num_habitaciones'
                  , 'inm_num_banos'
                  , 'inm_direccion'
                  , 'inm_precio'              
                  ]
