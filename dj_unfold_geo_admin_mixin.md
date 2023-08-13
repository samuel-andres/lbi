# GIS mixin widget for django unfold

`admin.py`:

```python
from django.contrib.gis.db import models
from django.contrib.gis.forms import OSMWidget

DEFAULT_LNG_LAT = (-63.24016, -32.40751)


class GeoModelAdminMixin:
    """Mixin needed to use gis widgets in unfold model admins"""

    gis_widget = OSMWidget
    gis_widget_kwargs = {
        "attrs": {
            "default_zoom": 12,
            "default_lon": DEFAULT_LNG_LAT[0],
            "default_lat": DEFAULT_LNG_LAT[1],
        },
    }

    def formfield_for_dbfield(self, db_field, request, **kwargs):
        if isinstance(db_field, models.GeometryField) and (
            db_field.dim < 3 or self.gis_widget.supports_3d
        ):
            kwargs["widget"] = self.gis_widget(**self.gis_widget_kwargs)
            return db_field.formfield(**kwargs)
        else:
            return super().formfield_for_dbfield(db_field, request, **kwargs)

```


Example of usage:

```python
class SomeGeoModelNameAdmin(GeoModelAdminMixin, ModelAdmin):
    ...
```