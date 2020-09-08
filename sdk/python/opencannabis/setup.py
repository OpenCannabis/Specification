#!/usr/bin/env python

from setuptools import setup, find_packages

setup(
  name='opencannabis',
  version='1.0.0',
  description='OpenCannabis SDK for Python',
  author='Sam Gammon',
  author_email='sam.g@cookies.co',
  url='https://github.com/OpenCannabis/Python',
  packages=find_packages(
    exclude=[
        "*.tests",
        "*.tests.*",
        "tests.*",
        "tests",
        "*.pytests",
        "*.pytests.*",
        "pytests.*",
        "pytests",
        "gust",
        "gust*",
        "gust.*"
    ]
  ),
  classifiers=[
    "Development Status :: 4 - Beta",
    "Intended Audience :: Developers",
    "License :: OSI Approved :: MIT License",
    "Operating System :: POSIX",
    "Programming Language :: Python :: 2",
    "Programming Language :: Python :: 2.6",
    "Programming Language :: Python :: 2.7",
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: 3.6",
    "Programming Language :: Python :: 3.7",
    "Programming Language :: Python :: 3.8",
  ],
  requires=[
    'protobuf',
    'colorlog',
    'gust'
  ],
  install_requires=[
    'protobuf>=3.13.0',
    'colorlog>=4.2.1',
    'gust>=1.0.2'
  ],
)
