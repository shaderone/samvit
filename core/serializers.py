from dataclasses import field
from rest_framework.serializers import ModelSerializer

from .models import Teachers, Test

class TeacherSerializer(ModelSerializer):

    class Meta:
        model = Teachers
        fields = ['id', 'name', 'e_id', 'phone_number', 'is_verified']


class TestSerialiser(ModelSerializer):

    class Meta:
        model = Test
        field = ['id', 'name', 'phone', 'passw']