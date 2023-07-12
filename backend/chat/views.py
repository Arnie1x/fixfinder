from django.shortcuts import render
from rest_framework import generics

from .serializers import *
from .migrations import *

# Create your views here.
from django.shortcuts import render, redirect

def chatPage(request, chat_name, pk):
    context = {
        "chat_name" : chat_name,
        "pk" : pk
    }
    return render(request, "chat_page.html", context)

class ChatList(generics.ListCreateAPIView):
    queryset = Chat.objects.all()
    serializer_class = ChatSerializer

class ChatDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Chat.objects.all()
    serializer_class = ChatSerializer
    
class MessageList(generics.ListCreateAPIView):
    queryset = Message.objects.all()
    serializer_class = MessageSerializer

class MessageDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Message.objects.all()
    serializer_class = MessageSerializer
