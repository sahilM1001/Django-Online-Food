from django.shortcuts import render, redirect
from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.template import loader
# Create your views here.

import mysql.connector as mcdb
conn = mcdb.connect(host="localhost", user="root", passwd="", database='onlinefooddeliverysystem')
print('Successfully connected to database')
cur = conn.cursor()

#restaurant Page Views START HERE

def deliverylisting(request):
    cur.execute("SELECT * FROM `tbl_delivery`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'restaurants/delivery.html', {'delivery': data})

def feedbacklisting(request):
    cur.execute("SELECT * FROM `tbl_feedbacks`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'restaurants/feedback.html', {'feedback': data})

def foodlisting(request):
    cur.execute("SELECT * FROM `tbl_food_items`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))

    cur.execute("SELECT COUNT(f_id) FROM `tbl_food_items`")
    total = cur.fetchone()

    cur.execute("SELECT COUNT(`f_id`) FROM `tbl_food_items` WHERE `f_category_id` = 101")
    punjabi = cur.fetchone()

    cur.execute("SELECT COUNT(`f_id`) FROM `tbl_food_items` WHERE `f_category_id` = 102")
    chinese = cur.fetchone()

    cur.execute("SELECT COUNT(`f_id`) FROM `tbl_food_items` WHERE `f_category_id` = 104")
    south = cur.fetchone()

    return render(request, 'restaurants/food.html', {'food': data, 'NorthIndian': punjabi[0], 'chineseFood': chinese[0], 'totalItem': total[0], 'southIndian': south[0]})

def paymentlisting(request):
    cur.execute("SELECT * FROM `tbl_pyt`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'restaurants/pay.html', {'payment': data})

def orderlisting(request):
    cur.execute("SELECT * FROM `tbl_order_details`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'restaurants/order.html', {'order': data})

def foodaddcreate(request):
    cur.execute("SELECT * FROM `tbl_category` ORDER BY `category_id` ASC")
    data = cur.fetchall()

    return render(request, 'restaurants/addfood.html', {'categories': data})   


def foodaddprocess(request):
    if request.method == 'POST':
        print(request.POST)
        foodid = request.POST['txt1']
        foodcategory = request.POST['txt2']
        foodname = request.POST['txt3']
        foodprice = request.POST['txt4']
        cur.execute("INSERT INTO `tbl_food_items`(`f_id`,`f_category_id`,`f_name`,`f_price`) VALUES ('{}','{}','{}','{}')".format(foodid,foodcategory,foodname,foodprice))
        conn.commit()
        return redirect(foodaddcreate) 
    else:
        return redirect(foodaddcreate)

def foodDelete(request,id):
     
    #id = request.GET['id']
    #id = User.objects.get(id=id)
    print(id)
    cur.execute("delete from `tbl_food_items` where `f_id` = {}".format(id))
    conn.commit()
    return redirect(foodlisting) 


def restaurantLogout(request):
    return render(request, 'restaurants/logout.html')

#restaurant Page Views END HERE

