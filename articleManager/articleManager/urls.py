"""articleManager URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url, patterns
from django.contrib import admin
from loginORreg.views import login, regist, home, forget, changePassword, logout
from accounts.views import accountHOME, upload_filey, show_all, ADDrergist, upload_files, add, delete,biaoji,\
                    fy_detail, fs_detail, book, xiugai, xinjian,uploadImg,docupload,show_root,bianji,site,\
                    download, xiazai

urlpatterns = patterns('',
    url(r'^$', home),
    url(r'^login/$', login),
    #url(r'^ccc/$',ccc),
    url(r'^logout/$', logout),
    url(r'^regist/$', regist),
    url(r'^forget/$', forget),
    url(r'^change/$', changePassword),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^account/$', accountHOME),
    url(r'^account/add/$', add),
    url(r'^account/adds/$', upload_files),
    url(r'^account/adds/details/$', fs_detail),
    url(r'^account/addy/$', upload_filey),
    url(r'^account/addy/details/$', fy_detail),
    url(r'^account/delete/$', delete),
    url(r'^account/underline/$', biaoji),
    url(r'^account/show_all/$', show_all),
    url(r'^account/setting/$', ADDrergist),
    url(r'^account/book/$', book),
    url(r'^account/xinjian/$', xinjian),
    url(r'^account/xiugai/$', xiugai),
    url(r'^uploadImg/$',uploadImg),
    url(r'^account/docupload/$',docupload),
    url(r'^account/show_root/$',show_root),
    url(r'^account/bianji/$',bianji),
    url(r'^account/site/$',site),
    url(r'^account/download/$',download),
    url(r'^account/xiazai/$',xiazai),
)
