from django.contrib.auth.models import User
from rest_framework import serializers
from .models import Note


class UserSerializer(serializers.HyperlinkedModelSerializer):
    '''Serializer to map the Model instance into JSON format.'''
    class Meta:
        '''Map this serializer to a model and their fields'''
        model = User
        fields = ['url', 'username', 'email', 'is_staff']


class NoteSerializer(serializers.ModelSerializer):
    '''Serializer to map the Model instance into JSON format.'''
    class Meta:
        '''Meta class to map serializer's fields with the model fields.'''
        model = Note
        fields = ['title', 'content', 'date_created', 'date_modified']
