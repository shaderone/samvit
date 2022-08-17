from datetime import date
import email
from pyexpat import model
from typing import ChainMap
from xml.dom.minidom import CharacterData
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

    class Meta:
        verbose_name = "Teacher"
        verbose_name_plural = "Teachers"


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
    no_of_seat = models.IntegerField(default=0)
    reservation =  models.ForeignKey(Reservation, on_delete=models.CASCADE, db_column='reservation_id')
    created_by = models.ForeignKey(Teachers, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs) -> None:
        res = self.reservation.number_of_slot - self.no_of_seat
        if res > 0:
            self.reservation.number_of_slot = res
            self.reservation.save()
        else:
            self.reservation.number_of_slot = 0
            self.reservation.save()

        return super().save(args, kwargs)

    class Meta:
        verbose_name="College"
        verbose_name_plural  = "Colleges"



class Test(models.Model):
    name = models.CharField(max_length=255)
    phone = models.CharField(max_length=12)
    passw = models.CharField(max_length=255)

    def __str__(self):
        return self.name