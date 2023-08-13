# Pattern for using celery tasks on a django project

`tasks.py`:

```python
from celery import shared_task
from django.apps import apps


@shared_task(
    autoretry_for=(Exception,),
    retry_backoff=True,
    retry_kwargs={"max_retries": 5},
)
def {model_name}_{method_name}_task({model_name}_id: int):
    """Async task for calling `method_name` on `model_name` instance"""

    instance = apps.get_model("{app_label}.{model_name}").objects.get(
        pk={model_name}_id
    )
    instance.{method_name}()
```


`models.py`:

```python

class MyModel(models.Model):
    ...

    def {method_name}(self):
        """Do some logic"""
        ...

    def async_{method_name}(self):
        {model_name}_{method_name}_task.delay(self.pk)

```