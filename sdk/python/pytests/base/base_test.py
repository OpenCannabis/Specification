# -*- coding: utf-8 -*-

""" Tests for `opencannabis.base`. """

import unittest
import gust
import opencannabis

from opencannabis.base.ProductKey_pb2 import ProductKey
from opencannabis.base.ProductKind_pb2 import ProductKind


SIMPLE_KEY = "id: \"abc123\"\ntype: EDIBLES\n"


class OCPBaseTests(unittest.TestCase):
    """Tests for the package `opencannabis.base`."""

    def test_product_kind(self):
        """Test enumerations on `opencannabis.base.ProductKind`."""
        self.assertEqual(ProductKind.EDIBLES, 1, "sentinel for `EDIBLES` should be expected value in `ProductKind`")

    def test_product_key(self):
        """Test the structure defined by `opencannabis.base.ProductKey`."""
        key = ProductKey()
        key.id = "abc123"
        key.type = ProductKind.EDIBLES

        self.assertEqual("abc123", key.id, "key ID should be expected value")
        self.assertEqual(ProductKind.EDIBLES, key.type, "key kind should be expected value")
        self.assertEqual(SIMPLE_KEY, str(key), "text-encoded key structure should be expected value")


if __name__ == "__main__": unittest.main()
