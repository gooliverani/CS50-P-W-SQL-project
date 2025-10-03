from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("<str:name>", views.greet, name="greet"),
    path("goolio", views.goolio, name="goolio"),
    path("brian", views.brian, name="brian")
]
