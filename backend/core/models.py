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
        return str(self.pk)
    
    class Meta:
        ordering = ['-created_at']
        
class Order(models.Model):
    technician = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT, related_name='technician_order')
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT)
    amount = models.IntegerField()
    class State(models.TextChoices):
        PENDING = 'pending', 'Pending'
        ACCEPTED = 'accepted', 'Accepted'
        REJECTED ='rejected', 'Rejected'
        COMPLETED ='completed', 'Completed'
    
    state = models.CharField(
        max_length=10,
        choices=State.choices,
        default=State.PENDING
    )
    updated_at = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)
    