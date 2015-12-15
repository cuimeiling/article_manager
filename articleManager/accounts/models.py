# coding=gbk
from django.db import models
from django import forms
#from django.contrib.auth.models import User
# Create your models here.

class Styles(models.Model):
    name = models.CharField(max_length=30)     
    parent = models.ForeignKey("self", blank=True, null=True, related_name="children")           
    def __unicode__(self):         
        return self.name

class Article(models.Model):
    Title = forms.CharField(max_length=256)
    style = models.ForeignKey(Styles)
    updata = models.DateField(auto_now = True)
    file = forms.FileField()
    keywords = models.CharField(max_length=20)
    power = models.CharField(max_length=20)
    author = models.CharField(max_length=30)   
    