class Venue():
    __table__ = 'venues'
    columns = ['foursquare_id', 'name', 'price',
            'rating', 'likes', 'menu_url']

    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)



