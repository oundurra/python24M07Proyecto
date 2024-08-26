from django.shortcuts import render, HttpResponseRedirect, redirect
from django.contrib.auth.decorators import login_required
from main.forms.usuario import Usuario
from main.services.usuario import getUsuarioByRut, getUsuarioById
 
@login_required
def profile(request):
    if request.method == "POST":
        form = Usuario(request.POST, usuario)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("usuario/edit_profile.html/")
    else:
        usuario = getUsuarioById(request.user.id)
        form = Usuario()
        form.initial['usu_rut'] = usuario.usu_rut
        form.initial['usu_nombres'] = usuario.usu_nombres
        form.initial['usu_apepat'] = usuario.usu_apepat
        form.initial['usu_apemat'] = usuario.usu_apemat
        form.initial['usu_direccion'] = usuario.usu_direccion
        form.initial['usu_telefono'] = usuario.usu_telefono
        form.initial['usu_mail'] = usuario.usu_mail

    return render(request, "usuario/profile.html", {"form": form, "usuario": usuario})

@login_required
def edit(request, usu_rut):
    usuario = getUsuarioByRut(usu_rut)
    if request.method == 'POST':
        form = Usuario(request.POST, instance=usuario)
        if form.is_valid():
            form.save()
            return render(request, "usuario/profile.html", {"form": form, "usuario": usuario})
    else:
        form = Usuario(instance=usuario)
    return render(request, 'usuario/profile.html', {'form': form, "usuario": usuario})


