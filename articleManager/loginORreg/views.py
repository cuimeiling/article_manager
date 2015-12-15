# -*- coding: utf-8 -*-
from django.shortcuts import render, render_to_response
from models import account,Styles
from django.contrib.auth.models import User
from django.contrib import auth
from django.template import Context
from django.http import HttpResponse, HttpResponseRedirect
from django.core.exceptions import ObjectDoesNotExist
from django.core.mail import send_mail, mail_admins
import random
import json
from django.views.decorators.csrf import csrf_exempt

validateNum = "*********"
def forget(request):
    email=''
    passData = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
            'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
            '!', '@', '#', '$', '%', '^', '&', '*', '-', '_', '=',
            '+', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
    if request.POST:
        if request.POST.has_key("valid"):
            email=request.POST['email']
            try:
                u=User.objects.get(email=email) 
            except ObjectDoesNotExist: 
                rtxt="无拥有该邮箱的用户!"
                return HttpResponse(json.dumps({"msg":rtxt}))
            count=0
            R=[]
            while count != 7:
                R.append(random.choice(passData))
                count += 1
            
            validateNum=''.join(R)
            validateNum="aaa"
            send_mail('code back',validateNum, 'article_manager@yean.com',[email], fail_silently=True)
            mail_admins(u'用户注册反馈', u'当前XX用户注册了该网站', fail_silently=True)
        if request.POST.has_key("queding") and request.POST["code"]=="aaa":
            try:
                u=User.objects.get(email=request.POST['email']) 
            except ObjectDoesNotExist: 
                rtxt="无拥有该邮箱的用户!"
                return HttpResponse(json.dumps({"msg":rtxt}))
            else:
                return HttpResponseRedirect('/change/?c_pw=%s'%u.username)
        if request.POST.has_key("queding") and request.POST["code"]!="aaa":
            return HttpResponse(validateNum)
    r = Context({"email":email})
    return render_to_response("forget.html",r)
def home(request):
    return HttpResponseRedirect("/login/")
def changePassword(request):
    f = True
    print u'进入'
    if request.POST.has_key('tijiao'):
        print 'tijiao'
        ps1 = request.POST["pass"]
        ps2 = request.POST["passagain"]
        if len(ps1) != 0 and ps1 != ps2:
            f = False
            return HttpResponse(u"不匹配!")
        elif len(ps1) != 0 and ps1 == ps2:
            print u'匹配'
            u = User.objects.get(username=request.GET["c_pw"])
            u.set_password(request.POST["pass"])
            print u.id,u.username
            
            u.save()
            return HttpResponseRedirect("/login/")
        else:
            return HttpResponse(u"至少有一个密码为空!")
    r = Context({"flage":f})
    return render_to_response("change.html",r)

@csrf_exempt
def ccc(request,):
    rtxt="";
    username=request.POST.get["username"]
    password=request.POST.get["password"]
    u = auth.authenticate(username=username, password=password)
    if u is None:
        rtxt="用户名与密码不匹配！"
    return HttpResponse(json.dumps({"msg":rtxt}))


def login(request):
    username=''
    password=''
    if request.POST:
        if "username" in request.POST:
            username=request.POST["username"]
            password=request.POST["password"]
            u = auth.authenticate(username=username, password=password)
            if u is not None:
                auth.login(request, u)
                return HttpResponseRedirect("/account/")
            else:
                r = Context({"username":username,"password":'' })
                return render_to_response("login.html",r)
    r = Context({"username":username,"password":password})
    return render_to_response("login.html",r)
def logout(request):
    auth.logout(request)
    return HttpResponseRedirect("/login/")
def regist(request):
    user=None
    password1=''
    password2=''
    email=''
    CompareFlag=True
    userexist=True

    if request.POST:
        if request.POST.get('username'):
            user = request.POST.get('username')
            try:
                User.objects.get(username=user)  
            except ObjectDoesNotExist: 
                userexist=False
            
        if request.POST.get('pass'):
            password1= request.POST.get('pass')
        if request.POST.get('passagain'):
            password2= request.POST.get('passagain')
            if password1 != '':
                if password1 != password2:
                    CompareFlag=False
        if request.POST.get('email'):
            email= request.POST.get('email')
            
        if len(user)!=0 and len(password1) != 0 and len(password2) != 0 and len(email) != 0 and userexist==False and CompareFlag==True:
            u = User.objects.create_user(username=user,email=email,password=password1)
            u.save
            a = account()
            a.user = u
            a.nichname = user
            a.intristing = "未知"
            x = str(random.randint(0,9))
            a.Favicon = "/static/image/upload/%s.jpg"%x
            a.save()
            s = Styles()
            s.name = u.username
            s.parent = Styles.objects.get(name = "ROOT")
            s.save()
            return HttpResponseRedirect("/login/")
    r = Context({"user":user,"password1":password1,"password2":password2,"email":email,"f1":userexist})
    return render_to_response("regist.html",r)      
#post = request.POST
 #              user = u,
   #             nichname = post["nichname"],
    #            Favicon = post["Favicon"],
     #           intristing = post["Favicon"],
      #          )
       #     accountN.save()