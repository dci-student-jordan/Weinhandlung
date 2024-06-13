from django.urls import path

app_name = 'accounts'

from .views import LoginView, SignUpView, UpdateView, logout_view
urlpatterns = [
    path('login/', LoginView.as_view(), name='login'),
    path('signup/', SignUpView.as_view(), name='signup'),
    path('update/<int:pk>/', UpdateView.as_view(), name='update'),
    path('logout/', logout_view, name='logout'),
]