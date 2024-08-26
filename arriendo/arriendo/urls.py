"""
URL configuration for arriendo project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from main.views import *
from main.views.inmueble import listMiInmueble, viewInmueble, editInmueble, addInmueble
from main.views.usuario import profile, edit

urlpatterns = [
    path("admin/", admin.site.urls),
    path('accounts/', include('django.contrib.auth.urls')),
    path('inmueble/mispropiedades/', listMiInmueble, name='myList'),
    path('usuario/perfil/', profile, name='profile'),
    path('usuario/<str:usu_rut>/edit', edit, name='editProfile'),
    path('inmueble/<int:inm_id>/view', viewInmueble, name='viewInmueble'),
    path('inmueble/<int:inm_id>/edit', editInmueble, name='editInmueble'),
    path('inmueble/add', addInmueble, name='addInmueble'),
    path('', index, name='home'),
]
