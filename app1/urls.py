from django.urls import path
from . import views

urlpatterns=[
    path('', views.adminhomePageView, name='Admin Home'),
    path('/add-user', views.adminUserAddView, name='ADD User'),
    path('/view-users', views.userlisting, name='User Management'),
    path('/view-orders', views.orderlisting, name='Order Management'),
    path('/view-feedbacks', views.feedbacklisting, name='Feedbacks Management'),

    path('/logout', views.adminLogout, name='Logout')

]