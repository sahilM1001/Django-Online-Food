from django.urls import path
from . import views

urlpatterns=[
    path('', views.loginPage, name='Login'),
    path('signup', views.signupPage, name='SignUp'),
    
]