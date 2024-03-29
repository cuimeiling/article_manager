from django.contrib import admin
from models import account, Article, Styles
# Register your models here.
class ArticleAdmin(admin.ModelAdmin):
    list_display = ('Title',"update_time",'create_time','style','keywords1','keywords2','keywords3')

class StylesAdmin(admin.ModelAdmin):
    list_display = ('ID','name','parent')
    def display(Styles):     
        display_list = []       
        for style in Styles:         
            display_list.append(style.name)           
            children = style.children.all()         
            if len(children) > 0:             
                display_list.append(StylesAdmin.display(style.children.all()))               
        return display_list
    
    
    
    
admin.site.register(Article,ArticleAdmin)
admin.site.register(Styles,StylesAdmin)
admin.site.register(account)