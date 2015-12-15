# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User
from storage import ImageStorage
from django.utils import timezone
#from django.contrib.auth.admin import UserAdmin
#import datetime
class comment(models.Model):
    article_id = models.CharField(max_length=42)
    owner = models.CharField(max_length=256)
    owner_favicon = models.CharField(max_length=256)
    text = models.TextField()
    created_time = models.DateTimeField(default=timezone.now)
class Styles(models.Model):
    name = models.CharField(max_length=30)     
    parent = models.ForeignKey("self", blank=True, null=True, related_name="children")           
    def __unicode__(self):         
        return self.name
class Article(models.Model):
    Title = models.CharField(max_length=256)
    style = models.ForeignKey(Styles)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)
    atctype = models.CharField(max_length=30)
    filey = models.FileField(upload_to = './loginORreg/static/file/', storage=ImageStorage(), blank = True)
    text = models.TextField(null=True, default='', blank = True)
    keywords1 = models.CharField(max_length=20, null=True, default='', blank = True)
    keywords2 = models.CharField(max_length=20, null=True, default='', blank = True)
    keywords3 = models.CharField(max_length=20, null=True, default='', blank = True)
    power = models.CharField(max_length=20, blank = True)
    author = models.CharField(max_length=30, null=True, default='未命名',blank = True)   
class account(models.Model):
    user = models.OneToOneField(User, unique = True)
    nichname = models.CharField(max_length=60, null=True, default='',blank = True)
    Favicon = models.TextField(null=True, default='', blank = True)
    articles = models.ManyToManyField(Article, blank = True)
    intristing = models.CharField(max_length=60, null=True, default='',blank = True)
    def __unicode__(self):
        return self.user.username
class link(models.Model):
    ower = models.ManyToManyField(account)
    Title = models.CharField(max_length=256)
    linkto = models.CharField(max_length=528)


