# -*- coding: utf-8 -*-

""" Tests for basic module load operations. """

import unittest


class ModuleTest(unittest.TestCase):
    """Sanity tests."""

    def test_import_gust(self):
        """Import the core `gust` module."""
        import gust
        self.assertTrue(gust is not None)

    def test_import_opencannabis(self):
        """Import the core `opencannabis` module."""
        import opencannabis
        self.assertTrue(opencannabis is not None)


if __name__ == "__main__": unittest.main()
