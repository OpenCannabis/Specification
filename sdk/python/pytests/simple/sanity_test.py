# -*- coding: utf-8 -*-

""" Tests for basic sanity. """

import unittest


class SanityTest(unittest.TestCase):
    """Sanity tests."""

    def test_math(self):
        """Test basic math functions."""
        self.assertTrue((1 + 1) == 2)


if __name__ == "__main__": unittest.main()
