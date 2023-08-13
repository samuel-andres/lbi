# Django finite state machine

```py
# type: ignore

from django.db import models
from django_fsm import FSMIntegerField
from django_fsm import transition
from django_fsm_log.models import StateLog
from django.contrib.auth import User
from django_fsm_log.decorators import fsm_log_description


class EntityStateLog(StateLog):
    @property
    def state_label(self):
        return self.get_state_display()

    @property
    def source_state_label(self):
        return self.get_source_state_display()

    class Meta:
        proxy = True


class Entity(models.Model):
    """
    Some description about what this entity is and why
    we define a model for it
    """

    class State(models.IntegerChoices):
        """
        Ennumeration type that defines the various states
        that an entity can goes through
        """

        FIRST_STATE = 1, "First state"
        SECOND_STATE = 2, "Second state"
        THIRD_STATE = 3, "Third state"

    state = FSMIntegerField(default=State.FIRST_STATE, choices=State.choices)
    description = models.TextField()

    created_at = models.DateTimeField(auto_now_add=True)

    @fsm_log_description
    @transition(state, source=[State.FIRST_STATE], target=State.SECOND_STATE)
    def do_something(self, description=None):
        ...

    def can_do_other_thing(self, user):
        return user.role == User.Role.SOME_ROLE

    @fsm_log_description
    @transition(
        state,
        source=[State.SECOND_STATE],
        target=State.THIRD_STATE,
        permission=can_do_other_thing,
    )
    def do_other_thing(self, description=None):
        ...

    @property
    def state_logs(self):
        return EntityStateLog.objects.for_(self)

    @property
    def state_label(self):
        return self.get_state_display()

    def __str__(self) -> str:
        return "%s" % (self.description)

```