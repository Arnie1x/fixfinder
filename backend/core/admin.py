from django.contrib import admin
from .models import *
# Register your models here.

myModels = [
    Technician, Order
]
admin.site.register(myModels)
