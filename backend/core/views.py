from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import generics

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
    
class OrderList(generics.ListCreateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

class OrderDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer