# Custom DNI field

`fields.py`:

```python
from django.core.exceptions import ValidationError
from django.db.models import CharField


class DNIField(CharField):
    """A field that validates 'DNI' numbers."""

    default_error_messages = {
        "invalid": "This field requires only numbers.",
        "max_digits": "This field requires 7 or 8 digits.",
    }

    def __init__(self, *args, **kwargs):
        kwargs["max_length"] = 10
        super().__init__(*args, **kwargs)

    def clean(self, value, instance):
        """
        Value can be a string either in the
        [X]X.XXX.XXX or [X]XXXXXXX formats.
        """

        value = super().clean(value, instance)
        if not value.isdigit():
            value = value.replace(".", "")
        if not value.isdigit():
            raise ValidationError(
                self.error_messages["invalid"], code="invalid"
            )
        if len(value) not in (7, 8):
            raise ValidationError(
                self.error_messages["max_digits"], code="max_digits"
            )

        return value

```


For using it in DRF:

```python
from django.core.files import File
from rest_framework.serializers import ValidationError

from .fields import DNIField


def validate_dni(dni: str) -> str:
    if not dni.isdigit():
        dni = dni.replace(".", "")
    if not dni.isdigit():
        raise ValidationError(
            DNIField.default_error_messages["invalid"], code="invalid"
        )
    if len(dni) not in (7, 8):
        raise ValidationError(
            DNIField.default_error_messages["max_digits"],
            code="max_digits",
        )

    return dni

```