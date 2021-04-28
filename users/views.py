
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.template import loader
# Create your views here.

import mysql.connector as mcdb
conn = mcdb.connect(host="localhost", user="root", passwd="", database='onlinefooddeliverysystem')
print('Successfully connected to database')
cur = conn.cursor()

#User Page Views START HERE
def userHomePageView(request):
    return render(request, 'users/userMaster.html')

def UserhomeMGTPageView(request):
    return render(request, 'users/index.html')    

def userCartPageView(request):
    return render(request, 'users/cart.html')

def userCheckoutPageView(request):
    return render(request, 'users/checkout.html')

def userAboutUsPageView(request):
    return render(request, 'users/about-us.html')

def userMenuGridPageView(request):
    cur.execute("SELECT * FROM `tbl_food_items`")
    data = cur.fetchall()
    cur.execute("SELECT * FROM `tbl_category`")
    data1 = cur.fetchall()
    print(list(data))
    return render(request, 'users/menu-grid.html', {'foodItems': data,'category': data1})

def userMenuGridPageView1(request,id):
    cur.execute("SELECT * FROM `tbl_food_items` where  f_category_id = '{}'".format(id))
    data = cur.fetchall()
    cur.execute("SELECT * FROM `tbl_category`")
    data1 = cur.fetchall()
    print(list(data))
    return render(request, 'users/menu-grid.html', {'foodItems': data,'category': data1})


def addtocartprocess(request,id):
    print(id)
    pid = request.POST['pid']
    qty = request.POST['qty']
    price = request.POST['price']
    cartid = "1"
    cur.execute("INSERT INTO `cart_tbl`(`user_id`,`product_id`,`product_qty`,`price`) VALUES ('{}','{}','{}','{}')".format(cartid,pid,qty,price))
    conn.commit()
    return redirect(cartview)


def cartview(request):
    cur.execute('''SELECT
    cart_tbl.cart_id
    , tbl_food_items.f_name
    , cart_tbl.product_qty
    , cart_tbl.price
    , cart_tbl.product_id
    , cart_tbl.cart_id
    , tbl_food_items.f_image
FROM
    tbl_food_items
    INNER JOIN cart_tbl 
        ON (tbl_food_items.f_id = cart_tbl.product_id)''')
    db_data = cur.fetchall()
    #return list(data)
    print(list(db_data))
    return render(request, 'users/cart.html', {'mydata': db_data})  


def cartdelete(request,id):
    #id = request.GET['id']
    #id = User.objects.get(id=id)
    print(id)
    cur.execute("delete from `cart_tbl` where `cart_id` = {}".format(id))
    conn.commit()
    return redirect(cartview) 


def usercontactPageView(request):
    return render(request, 'users/contact.html')

def userservicePageView(request):
    return render(request, 'users/service.html')

def usergalleryPageView(request):
    return render(request, 'users/gallery.html')
#User Page Views END HERE

