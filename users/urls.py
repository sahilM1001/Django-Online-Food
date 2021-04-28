from django.urls import path
from . import views

urlpatterns=[
    path('', views.UserhomeMGTPageView, name='Home'),
    path('/index', views.UserhomeMGTPageView, name='index'),
    path('/cart', views.userCartPageView, name='cart'),
    path('/about', views.userAboutUsPageView, name='About-Us'),
    path('/checkout', views.userCheckoutPageView, name='checkout'),
    path('/menu', views.userMenuGridPageView, name='menu-grid'),
    path('/menufilter/<int:id>', views.userMenuGridPageView1, name='menufilter'),
    path('/add-to-cart/<int:id>', views.addtocartprocess,name='addtocartprocess'),
    path('cart', views.cartview,name='cartview'),
    path('/cart-remove/<int:id>', views.cartdelete,name='productdetails'),
    path('/contact', views.usercontactPageView, name='contact'),
    path('/service', views.userservicePageView, name='service'),
    path('/gallery', views.usergalleryPageView, name='gallery'),

]