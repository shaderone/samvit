from django.urls import path 

from .views import TeacherView, PhoneNumberVerification, PhoneNumberOtp, TestView

urlpatterns = [
    path('create-teacher/', TeacherView.as_view(), name='create-teacher'),
    path('phone-verification/', PhoneNumberVerification.as_view(), name='phone-verification'),
    path('phone-otp/',PhoneNumberOtp.as_view(), name='phone-otp'),
    path('test/', TestView.as_view(), name="test")
]