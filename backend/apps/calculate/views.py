from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Lookup
from .serializers import LookupSerializer

class FootprintCalc(APIView):

    def get(self, request):
        # Get all query parameters as a dictionary
        query_params = request.query_params

        # Create an empty dictionary to store the results
        results = {}

        # Initialize variables to store the calculated values
        city_value = 0
        country_value = 0
 
        if 'country' in query_params.keys():   
            for param_name, param_value in query_params.items():
                try:
                    if param_name == 'country':
                        city_value = Lookup.objects.get(key=param_value).value
                    elif param_name == 'flightclass':
                        flightclass_value = Lookup.objects.get(key=param_value).value
                    elif param_name == 'staytype':
                        staytype_value = Lookup.objects.get(key=param_value).value
                    elif param_name == 'food':
                        food_value = Lookup.objects.get(key=param_value).value
                    elif param_name == 'localtravelmethod':
                        localtravelmethod_value = Lookup.objects.get(key=param_value).value
                    elif param_name == 'days':
                        days_value = int(param_value)

                    results[param_name] = f'Key "{param_name}" found'

                except Lookup.DoesNotExist:
                    results[param_name] = f'Key "{param_name}" not found'

            total_value = (country_value * flightclass_value) + ((staytype_value + food_value + (localtravelmethod_value*22))*days_value)

            results['total_value'] = total_value

            return Response(results, status=status.HTTP_200_OK)
        
        elif 'city' in query_params.keys():
            for param_name, param_value in query_params.items():
                try:
                    if param_name == 'city':
                        city_value = Lookup.objects.get(key=param_value).value
                    elif param_name == 'modeoftravel':
                        modeoftravel_value = Lookup.objects.get(key=param_value).value
                    elif param_name == 'staytype':
                        staytype_value = Lookup.objects.get(key=param_value).value
                    elif param_name == 'food':
                        food_value = Lookup.objects.get(key=param_value).value
                    elif param_name == 'localtravelmethod':
                        localtravelmethod_value = Lookup.objects.get(key=param_value).value
                    elif param_name == 'days':
                        days_value = int(param_value)

                    results[param_name] = f'Key "{param_name}" found'

                except Lookup.DoesNotExist:
                    results[param_name] = f'Key "{param_name}" not found'

            total_value = (city_value * modeoftravel_value) + ((staytype_value + food_value + (localtravelmethod_value*22))*days_value)

            results['total_value'] = total_value

            return Response(results, status=status.HTTP_200_OK)
    
        else:
            Response("Parameters not found")
