from urllib import urlretrieve
import lxml.html

def get(url):
    filename = os.path.join('download', url.replace('http://dccadv.org/', ''))
    urlretrieve(url, filename = filename)
    return open(filename).read()

indexUrl = 'http://dccadv.org/index.php?pid=61'

raw = urlretrieve(indexUrl)
html = lxml.html.fromstring(raw)
html.make_links_absolute(indexUrl)

for categoryUrl in html.xpath('id("resources_search")/descendant::a/@href'):
    urlretrieve(categoryUrl)
