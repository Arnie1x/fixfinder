from rest_framework.serializers import ModelSerializer
from .models import *

class TechnicianSerializer(ModelSerializer):
    class Meta:
        model = Technician
        fields = '__all__'

class OrderSerializer(ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'

class MessageSerializer(ModelSerializer):
    class Meta:
        model = Message
        fields = '__all__'