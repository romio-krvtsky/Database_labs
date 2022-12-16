from django import forms


class AddServiceForm(forms.Form):
    title = forms.CharField(max_length=100)
    price = forms.IntegerField()
    duration = forms.IntegerField()

class DeleteServiceForm(forms.Form):
    number = forms.IntegerField()