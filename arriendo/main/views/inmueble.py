from django.shortcuts import render
from main.forms.inmueble import Inmueble
from main.services.inmueble import getInmuebleAll, getInmuebleByOwner, getInmuebleById
from main.services.usuario import getUsuarioById
from django.contrib.auth.decorators import login_required
 
@login_required
def listInmueble(request):
    usuario = getUsuarioById(request.user.id)
    inmuebles = getInmuebleAll()
    return render(request,'/',{"inmuebles":inmuebles, "usuario":usuario})

@login_required
def listMiInmueble(request):
    usuario = getUsuarioById(request.user.id)
    inmuebles = getInmuebleByOwner(getUsuarioById(request.user.id).usu_rut)
    return render(request,'inmueble/mylist.html',{"inmuebles":inmuebles, "usuario":usuario})

@login_required
def viewInmueble(request, inm_id):
    usuario = getUsuarioById(request.user.id)
    inmueble = getInmuebleById(inm_id)
    form = Inmueble(instance=inmueble)
    return render(request,'inmueble/view.html',{"form":form, "usuario":usuario, "inmueble":inmueble})

@login_required
def editInmueble(request, inm_id):
    usuario = getUsuarioById(request.user.id)
    inmueble = getInmuebleById(inm_id)
    if request.method == 'POST':
        form = Inmueble(request.POST, instance=inmueble)
        if form.is_valid():
            form.save()
            return render(request, "inmueble/view.html", {"form": form, "inmueble":inmueble, "usuario": usuario})
    else:
        form = Inmueble(instance=inmueble)
    return render(request, 'inmueble/view.html', {'form': form, "inmueble":inmueble, "usuario": usuario})

@login_required
def addInmueble(request):
    usuario = getUsuarioById(request.user.id)
    if request.method == 'POST':
        form = Inmueble(request.POST)
        if form.is_valid():
            form.save()
            inmueble = form.instance
            return render(request, "inmueble/view.html", {"form": form, "inmueble":inmueble, "usuario": usuario})
    else:
        form = Inmueble()
        return render(request, 'inmueble/add.html', {'form': form})