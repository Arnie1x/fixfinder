from django.shortcuts import render
from rest_framework import generics
from django.shortcuts import get_object_or_404
from django.contrib.auth.models import User

from core import models as core
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
    
    def get_queryset(self):
        # self.technician = get_object_or_404(core.Technician, pk = self.kwargs["pk"])
        # print("User - %s" % User.objects.get(technician__pk=self.technician).pk)
        # return Chat.objects.filter(user_1=self.request.user.pk) | Chat.objects.filter(user_2=self.request.user.pk)
        return Chat.objects.filter(user_1=1) | Chat.objects.filter(user_2=1)

class ChatDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Chat.objects.all()
    serializer_class = ChatSerializer
    
    def get_queryset(self):
        return Chat.objects.filter(id=self.kwargs["chat"])
    
class MessageList(generics.ListCreateAPIView):
    queryset = Message.objects.all()
    serializer_class = MessageSerializer
    
    def get_queryset(self):
        # self.chat_name = get_object_or_404(Chat, name = self.kwargs["chat"])
        return Message.objects.filter(chat=Chat.objects.get(id=self.kwargs["chat"]))

class MessageDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Message.objects.all()
    serializer_class = MessageSerializer
    
    def get_queryset(self):
        return Message.objects.filter(id=self.kwargs["message"])
