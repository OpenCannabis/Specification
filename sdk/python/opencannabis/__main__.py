# -*- coding: utf-8 -*-

__doc__ = """

  OpenCannabis SDK: Command Line
  ------------------------------
  This module provides a default command line runner. You can access this tool either via
  a generic command line call (i.e. `ocp`), or via the Python run-module command (i.e.
  `python -m ocp`).

"""

import sys


def run_cli(args):
  """ Run the CLI tool. """

  print("Hello, OpenCannabis!")


if __name__ == "__main__": run_cli(sys.argv)
