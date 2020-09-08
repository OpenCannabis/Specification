#!/usr/bin/env python

from setuptools import setup, find_packages

setup(
    name='gust',
    version='1.0.2',
    description='Gust shim for Python.',
    author='Sam Gammon',
    author_email='sam.g@cookies.co',
    url='https://github.com/sgammon/GUST',
    packages=["gust", "gust.core"],
    requires=['protobuf'],
    install_requires=['protobuf>=3.13.0']
)
