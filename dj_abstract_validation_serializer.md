# Abstract validation serializer

Abstract serializer for async validation endpoints

`serializers.py`:

```python
...

class AbstractValidationSerializer(serializers.Serializer):
    """
    #### Abstract serializer for validation of model fields

    Should: define a validator function implementation

    May: define a uniqueness dictionary

    - `uniqueness`: A dictionary specifying the model and field
      to be used for uniqueness lookup.
        - `model`: The model class to perform the lookup on.
        - `field`: The field of the model to check for uniqueness.

    - `validator`: A function that validates the input value.
      It should raise an Exception if the data is not valid.
    """

    uniqueness: dict = {}

    valid = serializers.SerializerMethodField()
    unique = serializers.SerializerMethodField()

    def get_unique(self, value):
        """
        Fulfill the `unique` serializer field with a boolean
        indicating if the given value is unique or not.
        """

        if not self.uniqueness:
            return None

        model = self.uniqueness.get("model")
        field = self.uniqueness.get("field")

        assert model, "The uniqueness dict should have a model"
        assert field, "The uniqueness dict should have a field"

        try:
            model.objects.get(**{field: value})

        except model.DoesNotExist:
            return True

        return False

    def get_valid(self, value):
        """
        Fulfill the `valid` serializer field with a boolean
        indicating if the given value is valid or not.
        """

        try:
            self.validator(value)

        except Exception:
            return False

        return True

```

## Example of usage:

`serializers.py`:

```python
...
class PersonDniValidationSerializer(AbstractValidationSerializer):
    """Serializer for person dni validation"""

    uniqueness = dict(model=Person, field="dni")

    def validator(self, value):
        return validate_dni(value)
```