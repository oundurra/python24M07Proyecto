from django.shortcuts import render
from main.models.inmueble import Inmueble

def list(request):
    inmuebles = Inmueble.objects.all()
    return render(request,'inmueble/list.html',{"inmuebles":inmuebles})