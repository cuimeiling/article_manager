# -*- coding: utf-8 -*-

from django.shortcuts import render,render_to_response
from loginORreg.models import account,Styles, Article
from django.http import HttpResponseRedirect
from django.contrib.auth.models import User
from django.contrib import auth
from django.template import Context
from django.http import HttpResponse, HttpResponseRedirect
from django.core.exceptions import ObjectDoesNotExist
from win32com import client as wc 
import random
from django import forms
# Create your views here.
def display(Styles):     
    display_list = []       
    for style in Styles:         
        display_list.append(style.name)           
        children = style.children.all()         
        if len(children) > 0:             
            display_list.append(display(style.children.all()))               
    return display_list
def accountHOME(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    else:
        u = User.objects.get(id=request.user.id).account
        a = u.articles.all()
        try:
            print a.order_by('-update_time')[0].Title
            name  = a.order_by('-update_time')[0].filey
            name = str(name)[11:]
            b = a.order_by('-update_time')[0]
            print name,b.id
        except:
            r = random.choice(['a','b','c','d','e'])
            name = 'static/file/%s.pdf'%r
            b = []
        if "bookname" in request.GET:
            a = Article.objects.filter(Title__icontains=request.GET["bookname"])
            return render_to_response('show.html',{"articles":a})
        return render_to_response('index.html',{'a':b,"name":name})
def add(req):
    return render_to_response('add.html')

class UserForm(forms.Form):
    Title = forms.CharField()
    filey = forms.FileField()
class imageForm(forms.Form):
    Nichname = forms.CharField()
    intersting = forms.CharField()
    image = forms.ImageField()

def ADDrergist(request):
    if request.POST.has_key("tijiao"):
        imf = imageForm(request.POST,request.POST,request.FILES)
        print imf
        if imf.is_valid():
            nichname = imf.cleaned_data['Nichname']
            intersting = imf.cleaned_data['intersting']
            image = imf.cleaned_data['image']
            print image.name()
            a = account()
            a.nichname = nichname
            a.intristing = intersting
            a.Favicon = image
            a.save()
            return HttpResponseRedirect("/account/")
    else:
        imf = imageForm()
    return render_to_response('setting.html',{'imf':imf})
    if "bookname" in request.GET:
        a = Article.objects.filter(Title__icontains=request.GET["bookname"])
        return render_to_response('show.html',{"articles":a})
def upload_filey(request):
    if "bookname" in request.GET:
        a = Article.objects.filter(Title__icontains=request.GET["bookname"])
        return render_to_response('show.html',{"articles":a})
    if request.method == "POST":
        uf = UserForm(request.POST,request.FILES)
        if uf.is_valid():
            Title = uf.cleaned_data['Title']
            filey = uf.cleaned_data['filey']
            atc = Article()
            atc.Title = Title
            atc.filey = filey
            atc.style = Styles.objects.get(ID = '200')
            atc.save()
            u = User.objects.get(id=request.user.id).account
            u.articles.add(atc)
            u.save()
            return HttpResponseRedirect("details/?atc=%s"% atc.id)
    else:
        uf = UserForm()
    return render_to_response('addy.html',{'uf':uf})
def fy_detail(request):
    if "bookname" in request.GET:
        a = Article.objects.filter(Title__icontains=request.GET["bookname"])
        return render_to_response('show.html',{"articles":a})
    if "atc" in request.GET:
        art = Article.objects.get(id = request.GET["atc"])
        if request.POST.has_key("tijiao"):
            art.keywords1 = request.POST["kw1"]
            art.keywords2 = request.POST["kw2"]
            art.keywords3 = request.POST["kw3"]
            art.author = request.POST["author"]
            art.power = '20'
            art.save()
            return HttpResponseRedirect("/account/")
        return render_to_response('addy_detail.html')
def upload_files(request):
    if "bookname" in request.GET:
        a = Article.objects.filter(Title__icontains=request.GET["bookname"])
        return render_to_response('show.html',{"articles":a})
    if request.method == "POST":
        uf = UserForm(request.POST,request.FILES)
        if uf.is_valid():
            Title = uf.cleaned_data['Title']
            filey = uf.cleaned_data['filey']
            atc = Article()
            atc.Title = Title
            atc.filey = filey
            atc.style = Styles.objects.get(ID = '200')
            atc.save()
            u = User.objects.get(id=request.user.id).account
            u.articles.add(atc)
            u.save()
            return HttpResponseRedirect("details/?atc=%s"% atc.id)
    else:
        uf = UserForm()
    return render_to_response('adds.html',{'uf':uf})
def fs_detail(request):
    if "bookname" in request.GET:
        a = Article.objects.filter(Title__icontains=request.GET["bookname"])
        return render_to_response('show.html',{"articles":a})
    if "atc" in request.GET:
        art = Article.objects.get(id = request.GET["atc"])
        if request.POST.has_key("tijiao"):
            art.keywords1 = request.POST["kw1"]
            art.keywords2 = request.POST["kw2"]
            art.keywords3 = request.POST["kw3"]
            art.author = request.POST["author"]
            art.power = '10'
            art.save()
            return HttpResponseRedirect("/account/")
        return render_to_response('adds_detail.html')
    
def biaoji(req):
    if "biaoji_id" in req.GET:
        a = Article.objects.get(id = req.GET["biaoji_id"])
        s = a.power
        s = s[:2]+"1"
        a.power = s
        a.save()
        return HttpResponseRedirect("/account/")
def xiugai(req):
    if "bookname" in req.GET:
        a = Article.objects.filter(Title__icontains=req.GET["bookname"])
        return render_to_response('show.html',{"articles":a})
    if "xiugai" in req.GET:
        a = Article.objects.get(id = req.GET["xiugai"])
        b = Article.objects.filter(id = req.GET["xiugai"])
        print a.Title
        if req.POST.has_key("tijiao"):
            b.update(Title = req.POST["title"])
            b.update(keywords1 = req.POST["kw1"])
            b.update(keywords2 = req.POST["kw2"])
            b.update(keywords3 = req.POST["kw3"])
            b.update(author = req.POST["author"])
            return HttpResponseRedirect("/account/")
        return render_to_response('xiugai.html',{"a":a})
    
def delete(req):
    if "d_id" in req.GET:
        a = Article.objects.filter(id = req.GET["d_id"])
        u = User.objects.get(id=req.user.id).account
        u.articles.remove(a)
        a.delete()
        return HttpResponseRedirect("/account/")
def book(request):
    if "book" in request.GET:
        a = Article.objects.get(id = request.GET["book"])
        a.save()
        return HttpResponseRedirect("/account/")
        
def show_all(req):
    if not req.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    else:
        u = User.objects.get(id=req.user.id).account
        a = u.articles.all()
        try:
            print a.order_by('-update_time')[0].Title
            return render_to_response('show.html',{"articles":a})
        except:
            return render_to_response('error.html',{"error":u"您还没有添加文章，请添加以后查询！"})
        if "bookname" in req.GET:
            a = Article.objects.filter(Title__icontains=req.GET["bookname"])
            return render_to_response('show.html',{"articles":a})


def seach(request):
    if request.POST.has_key("search"):
        if request.POST["bookname"]!="":
            a = Article.objects.filter(Title__icontains=request.POST["bookname"])
            return render_to_response('show.html',{"articles":a})