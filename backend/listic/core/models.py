import uuid
from django.db import models

# Base model with UUID primary key
class BaseModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

# Placeholder for future models
# class YourModel(BaseModel):
#     name = models.CharField(max_length=100)
#     # ... other fields
