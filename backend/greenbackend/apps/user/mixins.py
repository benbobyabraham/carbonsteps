from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
import datetime
from .models import User

class CustomLoginRequiredMixin(APIView):

    def dispatch(self, request, *args, **kwargs):
        if 'Authorization' not in request.headers:
            return Response({'error': 'Please set Auth-Token.'}, status=status.HTTP_401_UNAUTHORIZED)

        auth_header = request.headers['Authorization']
        if not auth_header.startswith('Bearer '):
            return Response({'error': 'Invalid authorization header format.'}, status=status.HTTP_401_UNAUTHORIZED)

        token = auth_header[7:]  # Remove 'Bearer ' to get the actual token
        now = datetime.datetime.now()
        try:
            login_user = User.objects.get(token=token, token_expires_at__gt=now)
        except User.DoesNotExist:
            return Response({'error': 'The token is invalid or expired.'}, status=status.HTTP_401_UNAUTHORIZED)

        request.login_user = login_user
        return super().dispatch(request, *args, **kwargs)