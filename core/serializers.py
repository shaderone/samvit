from dataclasses import field
from rest_framework.serializers import ModelSerializer

from .models import Teachers

class TeacherSerializer(ModelSerializer):

    class Meta:
        model = Teachers
        fields = ['id', 'name', 'e_id', 'phone_number', 'is_verified']