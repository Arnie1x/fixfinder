from django.contrib import admin
from .models import *
# Register your models here.

myModels = [
    Chat, Message
]
admin.site.register(myModels)