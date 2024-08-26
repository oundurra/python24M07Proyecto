from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from main.services.inmueble import getInmuebleAll
from main.services.usuario import getUsuarioById
 
@login_required
def index(request):
    usuario = getUsuarioById(request.user.id)
    inmuebles = getInmuebleAll()

    return render(request,'index.html',{"usuario":usuario, "inmuebles":inmuebles})