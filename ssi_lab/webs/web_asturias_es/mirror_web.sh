#!/bin/bash
# Only one level of recursion. Increment the level to create a real copy
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent --restrict-file-names=windows -l 1 http://www.asturias.es
