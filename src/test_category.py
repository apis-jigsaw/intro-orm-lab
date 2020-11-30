from db_utilities import *
from category import Category
from orm import *
import pytest

@pytest.fixture()
def build_category():
    drop_all_tables(test_conn, test_cursor)
    category = Category()
    category.name = 'Taco Places'
    save(category, test_conn, test_cursor)

    yield

    drop_all_tables(test_conn, test_cursor)

@pytest.fixture()
def clean_tables():
    drop_all_tables(test_conn, test_cursor)
    yield

    drop_all_tables(test_conn, test_cursor)

def test_save_category(clean_tables):
    pass

def test_mass_assignment():
    pass

