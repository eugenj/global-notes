import csv
import sys
from itertools import izip
a = izip(*csv.reader(sys.stdin))
csv.writer(sys.stdout).writerows(a)