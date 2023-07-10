from django.conf import settings
from django.db import models

# Create your models here.
class Technician(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    description = models.TextField()
    # tags = 
    location = models.CharField(max_length=50)
    services = models.TextField()
    updated_at = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.name
    
    class Meta:
        ordering = ['-created_at']
        
class Order(models.Model):
    technician = models.ForeignKey(Technician, on_delete=models.PROTECT)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    class State(models.TextChoices):
        PENDING = 'pending', 'Pending'
        ACCEPTED = 'accepted', 'Accepted'
        REJECTED ='rejected', 'Rejected'
    
    state = models.CharField(
        max_length=10,
        choices=State.choices,
        default=State.PENDING
    )
    
class Message(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT)
    technician = models.ForeignKey(Technician, on_delete=models.PROTECT)
    body = models.TextField()
    updated_at = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.body
    
    class Meta:
        ordering = ['-id']
    
    