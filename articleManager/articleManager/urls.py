from django.conf.urls import include, url
from django.contrib import admin
from loginORreg.views import login, regist, home, forget, changePassword, logout
from accounts.views import accountHOME, upload_filey, show_all, ADDrergist, upload_files, add, delete,biaoji,\
                    fy_detail, fs_detail, book, xiugai, xinjian,uploadImg,docupload,show_root,bianji,site,\
                    download, xiazai
urlpatterns = [
    url(r'^$', home),
    url(r'^login/$', login),
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
]