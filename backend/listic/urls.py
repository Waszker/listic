"""
URL configuration for listic project.
"""
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('listic.core.urls')), # Include core app URLs
]
