from rest_framework import serializers
from .models import Lookup

class LookupSerializer(serializers.Serializer):
    footprint = serializers.SerializerMethodField()

    class Meta:
        model = Lookup
        fields = ('key','value','footprint')

    def get_footprint(self,obj):
        
        starting_value = float(self.context['request'].query_params.get('starting_value',0))

        footprint = starting_value + (obj.value* 4)

        return footprint