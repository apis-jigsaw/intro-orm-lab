from orm import *
class Category:
    __table__ = 'categories'
    columns = ['id', 'name']

    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)

