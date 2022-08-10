from datetime import date
import email
from pyexpat import model
from django.db import models

# Create your models here.

class Teachers(models.Model):
    name = models.CharField(max_length=255)
    e_id = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=12)
    otp = models.IntegerField(default=0)
    is_verified = models.BooleanField(default=False)

    def __str__(self) -> str:
        return f"{self.name}"


DATE = (
    ('10:00 AM', '10:00 AM'),
    ('11:00 AM', '11:00 AM'),
    ('12:00 AM', '12:00 AM'),
    ('01:00 PM', '01:00 PM'),
    ('02:00 PM', '02:00 PM'),
    ('03:00 PM', '03:00 PM'),
    ('04:00 PM', '04:00 PM'),
    ('05:00 PM', '05:00 PM'),
)

class Reservation(models.Model):
    date = models.DateField()
    number_of_slot = models.IntegerField(default=0)
    # add time
    time = models.CharField(max_length=10, choices=DATE)

    def __str__(self) -> str:
        return f"{self.date} -> {self.time}"

class Colleges(models.Model):
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    phone = models.CharField(max_length=255)
    email = models.EmailField()
    reservation = models.ForeignKey(Reservation, on_delete=models.CASCADE)
    created_by = models.ForeignKey(Teachers, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
