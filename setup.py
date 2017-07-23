"""Hamster
"""
from setuptools import setup, find_packages

setup(
    name="hamster",
    version="0.1",

    # packages
    packages=find_packages(),

    # requirements
    install_requires=[
        'flask-restful',
    ],

    test_suite="tests",

    # Author info
    author="Sebastian Frelle Koch",
    author_email="sebastian.frelle@gmail.com",
    keywords="hamster web links accumulator research",
)
