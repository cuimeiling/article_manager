# coding=utf8
from django.shortcuts import redirect, render_to_response
from loginORreg.models import account,Styles, Article,link,comment
from django.http import HttpResponseRedirect
from django.contrib.auth.models import User
from django.contrib import auth
from django.http import HttpResponse, HttpResponseRedirect
import os, time, random
import json
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
    u = User.objects.get(id=request.user.id).account
    if "bookname" in request.GET:
        h = Article.objects.filter(power = "20").exclude(atctype = "other")
        i = u.articles.all().exclude(atctype = "other")
        if request.GET["classid"] == '0':
            a = Article.objects.filter(Title__icontains=request.GET["bookname"])
            b = Article.objects.filter(keywords1__icontains=request.GET["bookname"])
            c = Article.objects.filter(keywords2__icontains=request.GET["bookname"])
            d = Article.objects.filter(keywords3__icontains=request.GET["bookname"])
            e = Article.objects.filter(text__icontains=request.GET["bookname"])
            f = Article.objects.filter(author__icontains=request.GET["bookname"])
            s = Styles.objects.filter(name__icontains=request.GET["bookname"])
            g = Article.objects.filter(style = s)
            a = a|b|c|d|e|f|g
            a = a&(h|i)
            a = a.distinct()
        elif request.GET["classid"] == '1':
            s = Styles.objects.filter(name__icontains=request.GET["bookname"])
            a = Article.objects.filter(style = s)
            a = a&(h|i)
        elif request.GET["classid"] == '2':
            b = Article.objects.filter(keywords1__icontains=request.GET["bookname"])
            c = Article.objects.filter(keywords2__icontains=request.GET["bookname"])
            d = Article.objects.filter(keywords3__icontains=request.GET["bookname"])
            a = b|c|d
            a = a&(h|i)
            a = a.distinct()
        elif request.GET["classid"] == '3':
            a = Article.objects.filter(Title__icontains=request.GET["bookname"])
            a = a&(h|i)
        elif request.GET["classid"] == '4':
            a = Article.objects.filter(author__icontains=request.GET["bookname"])
            a = a&(h|i)
        elif request.GET["classid"] == '5':
            a = Article.objects.filter(text__icontains=request.GET["bookname"])
            a = a&(h|i)
        return render_to_response('show.html',{"articles":a})
    if request.POST.has_key("q"):
        print '!!!!!!!!'
        l = link()
        l.Title = request.POST["title"]
        l.linkto = request.POST["site"]
        l.save()
        l.ower.add(u)
        l.save()
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    else:
        u = User.objects.get(id=request.user.id).account
        e = u.articles.all()
        a = e.order_by('-update_time')
        try:
            print a[0].Title
            if request.POST.has_key("tijiao"):
                com = comment()
                com.article_id = str(a[0].id)
                com.owner = u.nichname
                com.owner_favicon = u.Favicon
                com.text = request.POST["content"]
                com.save()
                return HttpResponseRedirect("/account/")
            if a[0].atctype == "html":
                com = comment.objects.filter(article_id = str(a[0].id))
                return render_to_response('bookHTML.html',{'a':a[0],'title':a[0].Title,'comments':com})
            if a[0].atctype == "pdf" or "other":
                name  = a.order_by('-update_time')[0].filey
                name = str(name)[10:]
                print name
                i=1
                while '.pdf' not in name:
                    name  = a.order_by('-update_time')[i].filey
                    name = str(name)[10:]
                    i+=1
                b = a.order_by('-update_time')[i-1]
                com = comment.objects.filter(article_id = str(b.id))
        except:
            r = random.choice(['a','b','c','d','e'])
            name = '/static/file/%s.pdf'%r
            b = []
            com = []
        return render_to_response('in.html',{'a':b,"name":name,'comments':com})
def bianji(request):
    u = User.objects.get(id=request.user.id)
    if "bookname" in request.GET:
        u = u.account
        a = u.articles.all().filter(Title__icontains=request.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if "bj" in request.GET:
        atc = Article.objects.get(id = request.GET["bj"])
        b = Article.objects.filter(id = request.GET["bj"])
        if request.POST.has_key("tijiao"):
            try:
                post = request.POST
                try:
                    s = Styles.objects.get(name = post["type"])
                    atc.style = s
                except:
                    s = Styles()
                    s.parent = Styles.objects.get(name = 'ROOT')
                    s.name = post["type"]
                    s.save()
                b.update(style = s)
                b.update(text = post["content"])
                b.update(Title = post["title"])
                b.update(keywords1 = post["kw1"])
                b.update(keywords2 = post["kw2"])
                b.update(keywords3 = post["kw3"])
                b.update(author = post["author"])
            except:
                pass
            return HttpResponseRedirect("/account/")
             
        root = Styles.objects.get(name = u.username)
        a = root.children.all()
        return render_to_response('edit.html',{'c':atc,"root":a})
def xinjian(request):
    atc = Article()
    name = ""
    u = User.objects.get(id=request.user.id)
    atc.author = u.account.nichname
    if "bookname" in request.GET:
        u = u.account
        a = u.articles.all().filter(Title__icontains=request.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if request.POST.has_key("tijiao"):
        post = request.POST
        atc.text = post["content"]
        try:
            s = Styles.objects.get(name = post["type"])
            atc.style = s
        except:
            s = Styles()
            s.parent = Styles.objects.get(name = u.username)
            s.name = post["type"]
            s.save()
            atc.style = s
        atc.Title = post["title"]
        atc.atctype = "html"
        atc.keywords1 = post["kw1"]
        atc.keywords2 = post["kw2"]
        atc.keywords3 = post["kw3"]
        atc.author = post["author"]
        if post["optionsRadios"] == '0':
            atc.power = "20"
        else:
            atc.power = "10"
        atc.save()
        u = User.objects.get(id=request.user.id).account
        u.articles.add(atc)
        u.save()
        return HttpResponseRedirect("/account/")
    if request.POST.has_key("queding"):
        s = Styles()
        s.parent = Styles.objects.get(name = 'ROOT')
        name = request.POST["styl"]
        s.name = name
    root = Styles.objects.get(name = u.username)
    a = root.children.all()
    return render_to_response('edit.html',{'c':atc,"root":a})
def show_root(req):
    u = User.objects.get(id=req.user.id)
    if "bookname" in req.GET:
        u = u.account
        a = u.articles.all().filter(Title__icontains=req.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if not req.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    else:
        a = u.account.articles.all()
        root = Styles.objects.get(name = u.username)
        io = []
        for s in root.children.all():
            u = []
            io.append({'text':s.name,'href': '#parent1','tags': "['0']",'nodes':u})
            print io
            for b in Article.objects.filter(style = s):
                if b.atctype != "other":
                    u.append({'text':b.Title,'href':'/account/book/?book=%s'%b.id,'tags': "['0']"})       
                    print u
            if u == []:
                del io[-1]
        return render_to_response('showStyle.html',{"o":json.dumps(io)})
def add(req):
    return render_to_response('add.html')

class UserForm(forms.Form):
    Title = forms.CharField()
    filey = forms.FileField()

def ADDrergist(request):
    u = User.objects.get(id=request.user.id).account
    if "bookname" in request.GET:
        a = u.articles.all().filter(Title__icontains=request.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if request.POST.has_key("tijiao"):
        u.update(nichname = request.POST["Nichname"])
        x = request.POST["content"][10:-10]
        u.update(Favicon = x)
        u.update(intristing = request.POST["intersting"])
        return HttpResponseRedirect("/account/")
    return render_to_response('setting.html')
def upload_filey(request):
    if "bookname" in request.GET:
        u = User.objects.get(id=request.user.id).account
        a = u.articles.all().filter(Title__icontains=request.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if request.method == "POST":
        uf = UserForm(request.POST,request.FILES)
        if uf.is_valid():
            Title = uf.cleaned_data['Title']
            filey = uf.cleaned_data['filey']
            atc = Article()
            atc.Title = Title
            atc.filey = filey
            atc.style = Styles.objects.get(id = 1)
            if 'pdf' in str(filey):
                atc.atctype = "pdf"
            else:
                atc.atctype = "other"
            atc.save()
            atc.text = str(atc.filey)[10:]
            atc.save()
            u = User.objects.get(id=request.user.id).account
            u.articles.add(atc)
            u.save()

            return HttpResponseRedirect("details/?atc=%s"% atc.id)
    else:
        uf = UserForm()
    return render_to_response('addy.html',{'uf':uf})
def fy_detail(request):
    u = User.objects.get(id=request.user.id)
    if "bookname" in request.GET:
        u = u.account
        a = u.articles.all().filter(Title__icontains=request.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if "atc" in request.GET:
        art = Article.objects.get(id = request.GET["atc"])
        if request.POST.has_key("tijiao"):
            art.keywords1 = request.POST["kw1"]
            art.keywords2 = request.POST["kw2"]
            art.keywords3 = request.POST["kw3"]
            art.author = request.POST["author"]
            try:
                s = Styles.objects.get(name = request.POST["type"])
                art.style = s
            except:
                s = Styles()
                s.parent = Styles.objects.get(name = u.username)
                s.name = request.POST["type"]
                s.save()
                art.style = s
            art.power = '20'
            art.save()
            return HttpResponseRedirect("/account/")
        root = Styles.objects.get(name = u.username)
        a = root.children.all()
        return render_to_response('addy_detail.html',{"root":a})
def upload_files(request):
    if "bookname" in request.GET:
        u = User.objects.get(id=request.user.id).account
        a = u.articles.all().filter(Title__icontains=request.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if request.method == "POST":
        uf = UserForm(request.POST,request.FILES)
        if uf.is_valid():
            Title = uf.cleaned_data['Title']
            filey = uf.cleaned_data['filey']
            atc = Article()
            atc.Title = Title
            atc.filey = filey
            atc.style = Styles.objects.get(id = 1)
            if 'pdf' in str(filey):
                atc.atctype = "pdf"
            else:
                atc.atctype = "other"
            atc.save()
            atc.text = str(atc.filey)[10:]
            atc.save()
            u = User.objects.get(id=request.user.id).account
            u.articles.add(atc)
            u.save()
            return HttpResponseRedirect("details/?atc=%s"% atc.id)
    else:
        uf = UserForm()
    return render_to_response('adds.html',{'uf':uf})
def fs_detail(request):
    u = User.objects.get(id=request.user.id)
    if "bookname" in request.GET:
        u = u.account
        a = u.articles.all().filter(Title__icontains=request.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if "atc" in request.GET:
        art = Article.objects.get(id = request.GET["atc"])
        if request.POST.has_key("tijiao"):
            art.keywords1 = request.POST["kw1"]
            art.keywords2 = request.POST["kw2"]
            art.keywords3 = request.POST["kw3"]
            art.author = request.POST["author"]
            try:
                s = Styles.objects.get(name = request.POST["type"])
                art.style = s
            except:
                s = Styles()
                s.parent = Styles.objects.get(name = u.username)
                s.name = request.POST["type"]
                s.save()
                art.style = s
            art.power = '10'
            art.save()
            return HttpResponseRedirect("/account/")
        root = Styles.objects.get(name = u.username)
        a = root.children.all()
        return render_to_response('adds_detail.html',{"root":a})
    
def biaoji(req):
    if "biaoji_id" in req.GET:
        try:
            a = Article.objects.get(id = req.GET["biaoji_id"])
            s = a.power
            s = s[:2]+"1"
            a.power = s
            a.save()
            return HttpResponseRedirect("/account/")
        except:
            return HttpResponseRedirect("/account/")
def xiugai(req):
    u = User.objects.get(id=req.user.id)
    if "bookname" in req.GET:
        u = u.account
        a = u.articles.all().filter(Title__icontains=req.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if "xiugai" in req.GET:

        a = Article.objects.get(id = req.GET["xiugai"])
        b = Article.objects.filter(id = req.GET["xiugai"])
        root = Styles.objects.get(name = "ROOT")
        c = root.children.all()
        
        print a.Title
        if req.POST.has_key("tijiao"):
            try:
                b.update(Title = req.POST["title"])
                b.update(keywords1 = req.POST["kw1"])
                b.update(keywords2 = req.POST["kw2"])
                b.update(keywords3 = req.POST["kw3"])
                b.update(author = req.POST["author"])
                try:
                    s = Styles.objects.get(name = req.POST["type"])
                    b.update(style = s)
                except:
                    s = Styles()
                    s.parent = Styles.objects.get(name = u.username)
                    s.name = req.POST["type"]
                    s.save()
                    b.update(style = s)
                return HttpResponseRedirect("/account/")
            except:
                return HttpResponseRedirect("/account/") 
        return render_to_response('xiugai.html',{"a":a,"root":c})
    
    
def delete(req):
    if "d_id" in req.GET:
        try:
            a = Article.objects.get(id = req.GET["d_id"])
            u = User.objects.get(id=req.user.id).account
            u.articles.remove(a)
            a.delete()
            return HttpResponseRedirect("/account/")
        except:
            return HttpResponseRedirect("/account/")
    if "l_id" in req.GET:
        print "!!"
        try:
            a = link.objects.get(id = req.GET["l_id"])
            print "!"
            a.delete()
            return HttpResponseRedirect("/account/")
        except:
            return HttpResponseRedirect("/account/")
   
def book(request):
    u = User.objects.get(id=request.user.id).account
    if "bookname" in request.GET:
        a = u.articles.all().filter(Title__icontains=request.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if "book" in request.GET:
        if request.POST.has_key("tijiao"):
            com = comment()
            com.article_id = str(request.GET["book"])
            com.owner = u.nichname
            com.owner_favicon = u.Favicon
            com.text = request.POST["content"]
            com.save()
            return HttpResponseRedirect("/account/book/?book=%s"%request.GET["book"])
        a = Article.objects.get(id = request.GET["book"])
        com = comment.objects.filter(article_id = str(a.id))
        if a.atctype == "pdf":
            name  = a.filey
            name = str(name)[10:]
            return render_to_response('book.html',{'a':a,"name":name,'comments':com})
        if a.atctype == "html":
            return render_to_response('bookHTML.html',{'a':a,'title':a.Title,'comments':com})
def show_all(req):
    if "bookname" in req.GET:
        u = User.objects.get(id=req.user.id).account
        a = u.articles.all().filter(Title__icontains=req.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if not req.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    else:
        u = User.objects.get(id=req.user.id).account
        a = u.articles.all().exclude(atctype = "other")
        b = Article.objects.filter(power = "20").exclude(atctype = "other")
        a = b|a
        a = a.distinct()
        try:
            print a.order_by('-update_time')[0].Title
            return render_to_response('show.html',{"articles":a})
        except:
            return render_to_response('error.html',{"error":u"您还没有添加文章，请添加以后查询！"})
def xiazai(req):
    if "bookname" in req.GET:
        u = User.objects.get(id=req.user.id).account
        a = u.articles.all().filter(Title__icontains=req.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if not req.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    else:
        u = User.objects.get(id=req.user.id).account
        a = u.articles.all().filter(atctype = "other")
        b = Article.objects.filter(power = "20").filter(atctype = "other")
        a = b|a
        a = a.distinct()
        try:
            print a.order_by('-update_time')[0].Title
            return render_to_response('xiazai.html',{"articles":a})
        except:
            return render_to_response('error.html',{"error":u"您还没有此类文件，请添加以后查询！"})
def site(req):
    if "bookname" in req.GET:
        u = User.objects.get(id=req.user.id).account
        a = u.articles.all().filter(Title__icontains=req.GET["bookname"]).exclude(atctype = "other")
        return render_to_response('show.html',{"articles":a})
    if not req.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    else:
        u = User.objects.get(id=req.user.id).account
        l = link.objects.filter(ower = u)
        try:
            print l.order_by('Title')[0].Title
            return render_to_response('site.html',{"links":l})
        except:
            return render_to_response('error.html',{"error":u"您还没有链接，请添加以后查询！"})
def docupload(request):
    if request.method == 'POST':
        print '!!!!!!!!!!'
        pic = request.get["pic"]
        s = pic.split('|')
        sr = ''
        for i in range(0,len(s)):
            if s[i].index("http://")>=0:
                try:
                    file_name = time.strftime('%Y%m%d%H%M%S')
                    file_name = file_name + '_%d' % random.randint(0,100)+s[i].split('.')[-1]
                    save_img("loginORreg/static/image/upload/",file_name,s[i])
                    if (i == len(s) - 1):
                        sr += file_name
                    else:
                        sr += file_name + "|"
                    return HttpResponse(json.dumps(sr))
                except Exception,e:
                    dict_tmp = {}
                    dict_tmp["error"] = 1
                    print e
                    return HttpResponse(json.dumps(dict_tmp))
                
        
        
        
def uploadImg(request):
    if request.method == 'POST':
        file_obj = open("log.txt","w+")
        buf = request.FILES.get('imgFile', None)
        print >> file_obj,str(buf)
        file_buff = buf.read()
        try:
            file_name = time.strftime('%Y%m%d%H%M%S')
            file_name = file_name + '_%d' % random.randint(0,100)+".jpg"
            save_file("loginORreg/static/image/upload/", file_name, file_buff)
            dict_tmp = {}
            dict_tmp["error"] = 0
            dict_tmp["url"] = "/static/image/upload/"+file_name
            return HttpResponse(json.dumps(dict_tmp))
        except Exception,e:
            dict_tmp = {}
            dict_tmp["error"] = 1
            print >> file_obj,e
            return HttpResponse(json.dumps(dict_tmp))
#对path进行处理
def mkdir(path):
    # 去除左右两边的空格
    path=path.strip()
    # 去除尾部 \符号
    path=path.rstrip("\\")

    if not os.path.exists(path):
        os.makedirs(path)
    return path
#保存相关的文件
def save_file(path, file_name, data):
    if data == None:
        return

    mkdir(path)
    if(not path.endswith("/")):
        path=path+"/"
    file=open(path+file_name, "wb")
    file.write(data)
    file.flush()
    file.close()
    
def save_img(path,file_name,ypath):
    if ypath == '':
        return
    mkdir(path)
    mkdir(ypath)
    A =open(ypath,'rb')
    B=open(path+file_name,'wb')
    c = A.read()
    B.write(c)
    A.close()
    B.close()
def read_file(filename, buf_size=8192):
  with open(filename, "rb") as f:
      while True:
        content = f.read(buf_size)
        if content:
            yield content
        else:
            break
def download(request):
  filename = "filename"
  response = HttpResponse(read_file(filename))
  return response