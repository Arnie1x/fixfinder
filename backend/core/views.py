from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import generics
from django.contrib.auth.models import User

from .serializers import *
from .migrations import *

# Create your views here.

class TechnicianList(generics.ListCreateAPIView):
    queryset = Technician.objects.all()
    serializer_class = TechnicianSerializer
    
class TechnicianDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Technician.objects.all()
    serializer_class = TechnicianSerializer

@api_view()
def get_object(request):
        return Response(Technician.objects.filter(user=request.user))

class UserDetail(generics.ListCreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    
class OrderList(generics.ListCreateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

class OrderListFromUser(generics.ListCreateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    
    def get_queryset(self):
        print(self.kwargs)
        # return Order.objects.filter(user=User.objects.filter(id=self.kwargs["user_1"]))
        return Order.objects.all().filter(user=User.objects.get(id=self.kwargs["user_1"]), technician=Technician.objects.get(user=self.kwargs["user_2"]))

class OrderDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer