#!/usr/bin/env python

import os
import urllib
import datetime
from gi.repository import Nautilus, GObject

class ColumnExtension(GObject.GObject, Nautilus.ColumnProvider, Nautilus.InfoProvider):
    def __init__(self):
        pass

    def get_columns(self):
        return (Nautilus.Column(
            name="NautilusPython::Longdate",
            attribute="longdate",
            label="Longdate",
            description="Get long date"),)

    def update_file_info(self, file):
        if file.get_uri_scheme() != 'file':
            return

        filename = urllib.unquote(file.get_uri()[7:])
        statbuf = os.stat(filename)
        formatteddate = datetime.datetime.fromtimestamp(statbuf.st_mtime).strftime('%Y-%m-%d %H:%M:%S')
        file.add_string_attribute('longdate', str(formatteddate))
