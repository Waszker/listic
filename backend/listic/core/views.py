from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import AllowAny


@api_view(['GET'])
@authentication_classes([]) # No authentication required for this view
@permission_classes([AllowAny]) # Allow anyone to access
def health_check(request):
    """Returns a simple health check response."""
    return Response({"status": "ok"})
