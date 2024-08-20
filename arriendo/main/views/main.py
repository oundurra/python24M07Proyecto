from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from main.models.usuario import Usuario
 
@login_required
def index(request):
    usuario = Usuario.objects.filter(user_id=request.user.id).first()

    return render(request,'index.html',{"usuario":usuario})