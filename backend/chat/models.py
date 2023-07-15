from django.db import models
from django.conf import settings

# Create your models here.
class Chat(models.Model):
    user_1 = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT)
    user_2 = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT, related_name="technician_chat")
    updated_at = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering = ['-id']        

class Message(models.Model):
    chat = models.ForeignKey(Chat, on_delete=models.CASCADE)
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT)
    body = models.TextField()
    updated_at = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.body
    
    class Meta:
        ordering = ['-id']
    
    @classmethod
    def create(cls, chat, author, body):
        message = cls(chat = chat, author = author, body = body)
        return message