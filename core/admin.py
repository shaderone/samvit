from django.contrib import admin

from django.contrib.auth.models import User, Group
# Register your models here.
from .models import Teachers, Reservation, Colleges

# admin.site.unregister(User)
# admin.site.unregister(Group)


admin.site.register(Teachers)
admin.site.register(Reservation)
admin.site.register(Colleges)