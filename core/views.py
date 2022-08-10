import random
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView

from .models import Teachers
from .serializers import TeacherSerializer
from .utils import send_otp


class TeacherView(APIView):

    def get(self, request):
        teachers = Teachers.objects.all()
        serializer = TeacherSerializer(teachers, many=True)        
        return Response(serializer.data, status=status.HTTP_200_OK)


class PhoneNumberVerification(APIView):

    def post(self, request):
        phone = request.data['phone']
        teacher = Teachers.objects.filter(phone_number=phone).first()

        if teacher is None:
            return Response("Phone number is not registered. Please contact administrator")
        if teacher.is_verified:
            return Response("User is already registered")
        
        otp = random.randrange(000000, 999999)
        objs = Teachers.objects.all()
        otps = [x.otp for x in objs]
        if otp in otps:
            otp +=1
        teacher.otp = otp
        teacher.save()
        send_otp(otp, phone)
        return Response(otp)


class PhoneNumberOtp(APIView):

    def post(self, request):
        otp = request.data['otp']

        try: 
            teacher = Teachers.objects.get(otp=otp)

            if teacher:
                teacher.is_verified = True
                teacher.save()
                return Response("Success Otp Verified", status=status.HTTP_202_ACCEPTED)
        except Exception as e:
            return Response("Otp is invalid")


