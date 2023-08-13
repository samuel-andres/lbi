# Setup for django testing environment

`core/tests.py`:

```python
import logging

from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError
from django.db import connections
from django.db.utils import OperationalError
from django.test import TestCase
from rest_framework.test import APIClient, APITestCase
from rest_framework_simplejwt.tokens import AccessToken

User = get_user_model()

class CustomAPIClient(APIClient):
    """
    Subclass of DRF APIClient that provides an easy way to set
    authentication credentials for requests made by the testing client.
    """

    def set_credentials(self, user: User):
        """
        Sets the authentication credentials for the client based on the
        given user instance.
        """
        token = AccessToken.for_user(user)
        self.credentials(HTTP_AUTHORIZATION=f"Bearer {token}")

    def clear_credentials(self):
        """
        Clears the authentication credentials for the client.
        """
        self.force_authenticate(user=None)

class CustomAPITestCase(APITestCase):
    """
    Subclass of DRF APITestCase that uses our own
    APIClient as its default client class.
    """

    client_class = AfyAPIClient

    def setUp(self) -> None:
        logger = logging.getLogger("django.request")
        logger.setLevel(logging.ERROR)

        return super().setUp()

    def tearDown(self) -> None:
        logger = logging.getLogger("django.request")
        logger.setLevel(logging.NOTSET)

        return super().tearDown()


```