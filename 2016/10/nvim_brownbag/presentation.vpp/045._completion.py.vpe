#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import math

"""
Get the names of an enum in C and return them as a list of names in Python.

It will handle:
    - Comments in the C enum

It will not handle:
    - A closing bracket in a comment?
"""

SPARSE = '__sparse_enum'


def get_enum_list(filename, search_string):
    """
    Get a list of the names used for an enum in a C file.

    Args:
        filename (str): The name of the file to parse
        search_string (str): The string of the enum definition
            example: 'typedef enum error_codes_e'

    Returns:
        enum_list (list): A list of the names of the C enums
    """
    # Get the text of the file
    with open(filename, 'r') as f:
        text = f.read()

    return get_enum_names(text, search_string)


def get_enum_names(text, search_string):
    """
    Get a list of the names used for an enum from a string of text.

    Args:
        text (str): The text to parse
        search_string (str): The string of the enum definition
            example: 'typedef enum error_codes_e'

    Returns:
        enum_list (list): A list of the names of the C enums
    """
    text_lines = text.split('\n')
    closing = '}'
    unexpected = ['{']
    skip = ['/*', '*/']
    found_enum = False
    enum_list = []
    for line in text_lines:
        if found_enum:
            if closing in line:
                break

            if any(character in line for character in unexpected):
                if '{' in line and len(enum_list) == 0:
                    continue
                else:
                    raise ValueError('Unexpected character from `{0}` found in line `{1}`'.format(unexpected, line))

            if any(character in line for character in skip) or line == '':
                continue

            # Remote any whitespace, or anything after the last word.
            line = line.strip()

            # If there are multiple items on one line, we want to split them
            #   into separate lines
            line = line.split(',')
            for index in range(len(line)):
                # Strip each line of white space
                line[index] = line[index].strip()

                # Remove numerical extras in the line
                #   for example, 'DEBUG_MSG = 0' -> 'DEBUG_MSG'
                # However, if 'DEBUG_MSG = 33', and we only have length of 22
                # it will insert the necessary SPARSE entries until it will be
                # at the correct index
                split_line = line[index].split()
                if '=' in split_line:
                    equal_index = split_line.index('=')

                    # Append the necessary sparse entries
                    while len(enum_list) < int(split_line[equal_index + 1]):
                        enum_list.append(SPARSE)

                    line[index] = line[index].split(' ')[0]
                else:
                    line[index] = line[index].split(' ')[0]

                # Remove empty names
                if line[index] == '':
                    line.pop(index)

            # Extend the list with however many items we found
            enum_list.extend(line)

        # This has to happen last because I don't want to do anything with this line
        if search_string in line:
            found_enum = True

    return enum_list

# Practice completion here
# ^n (^x^x)
get_e

# ^x^l
for i

line[i

# set spell, ^x^K
liab

# ^x^f
~/Git/con

# ^x^v
deo
