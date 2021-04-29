from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
# Create your views here.
import mysql.connector as mcdb
conn = mcdb.connect(host="localhost", user="root", passwd="", database='onlinefooddeliverysystem')
print('Successfully connected to database from LOGIN')
cur = conn.cursor()


#login Page Views START HERE
def loginPage(request):
    print("LOGIN PAGE HAS BEEN RENDERED STATICALLY")

    submitbutton= request.POST.get('loginBtn')
    if submitbutton: 
        print("THE SUBMIIIIIIIIIIIIT BUUUTTTTOOOOON WASSS CLICKEEEEDDD")
    else:
        print("SUBMIT NOT CLICKEDDD")
    return render(request, 'login/login.html')

def signupPage(request):
    return render(request, 'login/signup.html')

def login(request):
    print("ENTERRRINNGGG LOGIN RENDER FUNCTION")
    if request.method == 'POST':
        print("REQUEEESSSTTT METHODDDD IS POSTTTTT")
        print(request.POST)
        admin_email = request.POST['email']
        admin_pass = request.POST['password']
        
        cur.execute("SELECT `u_id`, `u_email`, `u_password` FROM `tbl_user` WHERE `u_email` = '{}' AND `u_password` = '{}' AND `type_id` = 3".format(admin_email,admin_pass))
        data = cur.fetchone()

        
        print("ENTERED EMAIL IS : ", admin_email)
        print("ENTERED PASSWORD IS : ", admin_pass)

        print("Fetched data from SQL QUERY: ", data)
        
        if data is not None:
            print("DATA IS NOT NONEEEE")

            if len(data) > 0:
                #Fetch Data
                admin_db_id = data[0]
                admin_db_email = data[1]
                print(admin_db_id)
                print(admin_db_email)
                #Session Create Code
                request.session['admin_id'] = admin_db_id
                request.session['admin_email'] = admin_db_email
                #Session Create Code
                #Cookie Code
                response = redirect(index)
                response.set_cookie('admin_id', admin_db_id)
                response.set_cookie('admin_email', admin_db_email)
                return response
                #Cookie Code
            else:
                messages.error(request,"Invalid Login!")
                return render(request, 'login/signup.html')         
        messages.error(request,"Invalid Login!")
        return render(request, 'login/signup.html')
        
       # return redirect(dashboard) 
    else:
        return render(request, 'login/signup.html') 

def index(request):
    print("INSIDE THE INDEX RENDERING FUNCTION")
    if 'admin_email' in request.COOKIES and request.session.has_key('admin_email'):
        
        admin_emails = request.session['admin_email']
        admin_emailc = request.COOKIES['admin_email']

        print("Session is  " + str(admin_emails))
        print("Cookie is  " + admin_emailc)

        return render(request, 'users/index.html')
    else:
        return redirect('users/index.html')

#login Page Views END HERE

