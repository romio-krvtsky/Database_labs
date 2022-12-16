from django.http import HttpRequest, HttpResponseRedirect
from django.shortcuts import render
from django.db import connection
from .forms import AddServiceForm


# Create your views here.

def dictfetchall(cursor):
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]


def index(request):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM services ORDER BY services.price")
    r = dictfetchall(cursor)
    print(connection.queries)
    return render(request, 'barbershop/homepage.html', {'data': r})


def add_service(request):
    form = AddServiceForm(request.POST)
    if form.is_valid():
        title = form.cleaned_data['title']
        price = form.cleaned_data['price']
        duration = form.cleaned_data['duration']

        cursor = connection.cursor()
        cursor.execute(f"INSERT INTO services(title, price, duration) VALUE('{title}', {price}, {duration})")

        return HttpResponseRedirect('/')
    context = {
        'form': form,
    }

    return render(request, 'barbershop/add_service.html', context=context)


def info(request):
    cursor = connection.cursor()
    cursor.execute("SELECT clients.name AS cln, application.time, barber.name AS brb, barbershops.address \
                            FROM application \
                            LEFT JOIN barber ON application.barber_id = barber.id \
                            JOIN clients ON application.client_id = clients.id \
                            JOIN barbershops ON application.barbershop_id = barbershops.id")
    r = dictfetchall(cursor)
    print(r)

    return render(request, 'barbershop/info.html', {'data': r})


def delete_service(request):
    return render(request, 'barbershop/delete_service.html')
