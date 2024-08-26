from django import forms
from main.models.usuario import Usuario

class Usuario(forms.ModelForm):
    class Meta:
        model = Usuario
        fields = ['usu_rut', 'usu_nombres', 'usu_apepat', 'usu_apemat', 'usu_direccion', 'usu_telefono', 'usu_mail']
