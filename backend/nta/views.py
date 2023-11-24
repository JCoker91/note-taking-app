from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from .models import Note
from .serializers import NoteSerializer


class NoteViewSet(ModelViewSet):
    '''Note viewset'''
    queryset = Note.objects.all()
    serializer_class = NoteSerializer
