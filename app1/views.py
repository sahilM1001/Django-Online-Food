from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.template import loader

##import mysql.connector as mcdb
##conn = mcdb.connect(host="localhost", user="root", passwd="", database="onlinefooddeliverysystem")
##print("successfully connected to db")

##cur = conn.cursor()
# Create your views here.

import mysql.connector as mcdb
conn = mcdb.connect(host="localhost", user="root", passwd="", database='onlinefooddeliverysystem')
print('Successfully connected to database')
cur = conn.cursor()

#Admin Page Views START HERE
def adminhomePageView(request):
    return render(request, 'admin/user.html')

def adminUserMGTPageView(request):
    cur.execute("SELECT * FROM `tbl_user`")

    data = cur.fetchall()
    print(list(data))

    return render(request, 'admin/user.html', {'users' : data})

def adminUserAddView(request):
    return render(request, 'admin/addUser.html')

def adminOrderMGTPageView(request):
    cur.execute("SELECT * FROM `tbl_order_details`")

    data = cur.fetchall()
    print(list(data))

    return render(request, 'admin/order.html', {'orders': data})

def adminFeedbackMGTPageView(request):

    ##cur.execute("SELECT * FROM ` tbl_feedbacks`")

    ##data = cur.fetchall()
    ##print(list(data))
    
    return render(request, 'admin/feedback.html')

def feedbacklisting(request):
    cur.execute("SELECT * FROM `tbl_feedbacks`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'admin/feedback.html', {'feedback': data})


def adminLogout(request):
    return render(request, 'admin/logout.html')
def orderlisting(request):
    cur.execute("SELECT * FROM `tbl_order_details`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))

    cur.execute("SELECT COUNT(`d_id`) FROM `tbl_delivery` WHERE `d_status` LIKE 'Preparing'")
    processing = cur.fetchone()

    cur.execute("SELECT COUNT(`d_id`) FROM `tbl_delivery` WHERE `d_status` LIKE 'Picked Up'")
    out = cur.fetchone()

    cur.execute("SELECT COUNT(`d_id`) FROM `tbl_delivery` WHERE `d_status` LIKE 'Delivered'")
    deliver = cur.fetchone()

    cur.execute("SELECT COUNT(`o_id`) FROM `tbl_order_master`")
    total = cur.fetchone()

    #total = admin + user + restaurant
    return render(request, 'admin/order.html', {'orderDetails': data, 'ordersProcessing': processing[0], 'outDel': out[0], 'totalOrders': total[0], 'delivered': deliver[0]})

def userlisting(request):
    cur.execute("SELECT * FROM `tbl_user`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))

    cur.execute("SELECT COUNT(`u_id`) FROM `tbl_user`")
    total = cur.fetchone()

    cur.execute("SELECT COUNT(`u_id`) FROM `tbl_user` WHERE `type_id` = 1")
    admin = cur.fetchone()

    cur.execute("SELECT COUNT(`u_id`) FROM `tbl_user` WHERE `type_id` = 3")
    user = cur.fetchone()

    cur.execute("SELECT COUNT(`u_id`) FROM `tbl_user` WHERE `type_id` = 2")
    restaurant = cur.fetchone()


    return render(request, 'admin/user.html', {'userDetails': data, 'userCount': user[0], 'resCount': restaurant[0], 'adminCount': admin[0], 'totalUser': total[0]})

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

    return render(request, 'admin/food.html', {'food': data, 'NorthIndian': punjabi[0], 'chineseFood': chinese[0], 'totalItem': total[0], 'southIndian': south[0]})
#Admin Page Views END HERE

