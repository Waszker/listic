from django.apps import AppConfig


class CoreConfig(AppConfig):
    default_auto_field = 'django.db.models.UUIDField' # Match settings.py
    name = 'listic.core'
