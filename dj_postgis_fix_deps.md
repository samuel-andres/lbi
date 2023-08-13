# Fix geos and gdal library paths

`settings.py`:

```python
...
# Geodjango deps
GDAL_LIBRARY_PATH = glob("/usr/lib/libgdal.so.*")[0]
GEOS_LIBRARY_PATH = glob("/usr/lib/libgeos_c.so.*")[0]
...
```