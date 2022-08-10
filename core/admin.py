from django.contrib import admin

from django.contrib.auth.models import User, Group
# Register your models here.
from .models import Teachers, Reservation, Colleges

# admin.site.unregister(User)
# admin.site.unregister(Group)
class ReservationAdmin(admin.ModelAdmin):
    list_display = ('date', 'time', 'number_of_slot')
    fieldsets = (
        (None, {
            'fields': ('date', 'number_of_slot', 'time')
        }),
    )

admin.site.register(Teachers)
admin.site.register(Reservation, ReservationAdmin)
admin.site.register(Colleges)