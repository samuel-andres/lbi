# Helper for calculating a person age on django

* Recomended using USE_TZ=True

```python
from django.utils.timezone import now


def calculate_age(birth_date):
    """
    Return the age of a person based on his birth_date
    using the Julian calendar year
    """

    today = now().date()
    days_from_birth_date = (today - birth_date).days

    return int(days_from_birth_date / 365.25)

```