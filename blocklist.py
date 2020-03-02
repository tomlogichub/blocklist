#!/usr/bin/python3

import os
import os.path
import argparse
import json
import time
from cgi import parse_qs, escape

blocklist = '/var/www/html/blocklist.html'

def update_blocklist(environ, start_response):
    # Returns a dictionary in which the values are lists
    d = parse_qs(environ['QUERY_STRING'])
    action = d.get('action', [''])[0]
    ip = d.get('ip', [''])[0]
    action = escape(action)
    ip = escape(ip) 

    if action == 'add':
        # Open the file in append & read mode ('a+')
        with open(blocklist, "a+") as file_object:
            # Move read cursor to the start of file.
            file_object.seek(0)
            # If file is not empty then append '\n'
            data = file_object.read(100)
            if len(data) > 0 :
                file_object.write("\n")
            # Append text at the end of file
            file_object.write(ip)

    if action == 'remove':
        with open(blocklist, "r") as f:
            lines = f.readlines()
        with open(blocklist, "w") as f:
            for line in lines:
                if line.strip("\n") != ip:
                    f.write(line)

    htmlResponse = [ "<!DOCTYPE html>" ]
    htmlResponse.append("<html>")
    htmlResponse.append("<body>")
    htmlResponse.append("<p>OK</p>")
    htmlResponse.append("</body>")
    htmlResponse.append("</html>")
    start_response("200", [("Content-Type", "text/html")])
    return [ line.encode("utf-8") for line in htmlResponse ]
