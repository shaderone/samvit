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
            'fields': ('date', 'number_of_slot', 'time',)
        }),
    )
class TeacherAdmin(admin.ModelAdmin):
    list_display= ('name', 'e_id', 'phone_number')
    fieldsets = (
        (None, {
            'fields': ('name', 'e_id', 'phone_number')
        }),
    )

class CollegeAdmin(admin.ModelAdmin):
    list_display= ('name', 'email', 'no_of_seat', 'created_by', 'reservation')
    fieldsets = (
        (None, {
            'fields': ('name', 'phone_number', 'email', 'no_of_seat', 'created_by', 'reservation')
        }),
    )

admin.site.register(Teachers, TeacherAdmin)
admin.site.register(Reservation, ReservationAdmin)
admin.site.register(Colleges, CollegeAdmin)