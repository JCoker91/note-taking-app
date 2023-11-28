# from django.test import TestCase
# # Create your tests here.
import pytest
from nta.models import Note


@pytest.mark.django_db  # give test access to database
def test_note_create():
    '''Tests Note model creation'''
    # Create dummy data
    note = Note.objects.create(title="Test Note", content="Test Content")
    # Assert the dummy data saved as expected
    assert note.title == "Test Note"
    assert note.content == "Test Content"
