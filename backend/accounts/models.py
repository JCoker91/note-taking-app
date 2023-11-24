from django.contrib.auth.models import (
    AbstractUser,
    # AbstractBaseUser,
    # PermissionsMixin
)
from django.db import models
# from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from .managers import CustomUserManager


class CustomUser(AbstractUser):
    '''User Model'''
    username = None
    email = models.EmailField(_('email address'), unique=True)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = []
    objects = CustomUserManager()

    def __str__(self) -> str:
        return str(self.email)

    def __repr__(self) -> str:
        return f"{self.id}: {self.email}"