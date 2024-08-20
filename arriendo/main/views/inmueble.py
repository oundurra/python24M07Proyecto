from django.shortcuts import render
from main.models.inmueble import Inmueble
from django.contrib.auth.decorators import login_required
 
@login_required
def list(request):
    inmuebles = Inmueble.objects.all()
    return render(request,'inmueble/list.html',{"inmuebles":inmuebles})