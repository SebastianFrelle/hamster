"""Hamster
"""
from pathlib import Path

from setuptools import setup, find_packages

REQ_PATH = './requirements.txt'


def requirements(req_path=REQ_PATH):
    p = Path(req_path)
    if not p.is_file():
        return []

    text = str.strip(p.read_text())
    dependencies = str.split(text, '\n')

    return dependencies


setup(
    name="hamster",
    version="0.1",

    # packages
    packages=find_packages(),

    # requirements
    install_requires=requirements,

    test_suite="tests",

    # Author info
    author="Sebastian Frelle Koch",
    author_email="sebastian.frelle@gmail.com",
    keywords="hamster web links accumulator research",
)
