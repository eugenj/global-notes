import re
import urllib3
import winsound
import time

def check(arrivalDate, lengthOfStay):
    http = urllib3.PoolManager()
    response = http.request('GET', 'https://www.reserveamerica.com/explore/cape-henlopen-state-park/DE/360108/campsites?arrivalDate=' + arrivalDate + '&lengthOfStay=' + lengthOfStay + '&availStartDate=' + arrivalDate + '&pageNumber=0')

    body = response.data.decode('utf-8')
    site_titles_dirty = re.findall('<title>(.*)</title>', body)
    site_titles = list(filter(lambda title: (',' in title), site_titles_dirty))
    site_parsed = list(map(lambda s: s.split(', '), site_titles))

    class Site:
            def __init__(self, name, type, available):
                    self.name = name
                    self.type = type
                    self.available = available
            def __str__(self):
                    return self.name + ':' + self.type + ':' + str(self.available)

    type_code_by_name = {'Cabin': 'C', 'Tent Only': 'T', 'Standard': 'S'}

    sites = list(map(lambda s: Site(s[0], type_code_by_name[s[1]], s[2] != 'Not Available'), site_parsed))

    if len(sites) != 175:
            print('Unexpected number of sites ' + len(sites))

    available_sites = list(filter(lambda site: site.available, sites))

    if len(available_sites) > 0:
        sites_str = '\n'.join(str(e) for e in available_sites)
        print(arrivalDate + '(' + lengthOfStay + '): Available of ' + str(len(available_sites)) + ': \n' + sites_str)
        winsound.Beep(440, 5000)
    else:
            print(arrivalDate + '(' + lengthOfStay + '): Nothing available')

while True:
    check('2022-09-02', '3')
    #check('2022-07-22', '2')
    time.sleep(27)
