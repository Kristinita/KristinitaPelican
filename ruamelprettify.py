"""Prettify YAML.

Remove [brackets], {braces} and "quotes".
Using ruamel.yaml:
https://stackoverflow.com/a/49609535/5951529
"""
import ruamel.yaml
import sys


def block_style(base):
    """
    Block style.

    The routine here walks over a simple, i.e. consisting of dicts, lists and
    primitives, tree loaded from YAML, recursing into dict values and
    list items and setting block-style on them.
    """
    if isinstance(base, dict):
        for k in base:
            try:
                base.fa.set_block_style()
            except AttributeError:
                pass
            block_style(base[k])
    elif isinstance(base, list):
        for elem in base:
            try:
                base.fa.set_block_style()
            except AttributeError:
                pass
            block_style(elem)


yaml = ruamel.yaml.YAML()
# Save quotes only in cases, when they are needed:
# https://stackoverflow.com/a/22235064/5951529
# https://stackoverflow.com/a/49609535/5951529
yaml.preserve_quotes = False
file_in = sys.argv[1]
file_out = sys.argv[2]
with open(file_in) as fp:
    data = yaml.load(fp)
block_style(data)
with open(file_out, 'w') as fp:
    yaml.dump(data, fp)
