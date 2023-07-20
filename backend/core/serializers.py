from rest_framework.serializers import ModelSerializer
from .models import *
from django.contrib.auth.models import User

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'
class TechnicianSerializer(ModelSerializer):
    class Meta:
        model = Technician
        fields = '__all__'

class OrderSerializer(ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'