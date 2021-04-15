
from bs4 import BeautifulSoup
import os
dir_path = os.path.dirname(os.path.realpath(__file__))
print(dir_path)

print('\n------Not Filtered------')
with open(dir_path + r"\Candidates2Params(NonFiltered)/Wilks_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i+1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks ICS {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"\Candidates2Params(NonFiltered)/Wilks_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i+1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r'\Candidates2Params(NonFiltered)\Mahalanobis_ICS.htm') as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis ICS {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(NonFiltered)/Mahalanobis_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

print('\n------Not Filtered and pu calculated------')
with open(dir_path + r"/Candidates2Params(NonFiltered,pucalculated)/Wilks_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks ICS {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(NonFiltered,pucalculated)/Wilks_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(NonFiltered,pucalculated)/Mahalanobis_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis ICS {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(NonFiltered,pucalculated)/Mahalanobis_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

print('\n------Not Filtered, pu calculated and v2-v1------')
with open(dir_path + r"/Candidates2Params(v1-v2, NonFiltered, pucalculated)/Wilks_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks ICS {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(v1-v2, NonFiltered, pucalculated)/Wilks_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(v1-v2, NonFiltered, pucalculated)/Mahalanobis_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis ICS {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(v1-v2, NonFiltered, pucalculated)/Mahalanobis_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

print('\n------50Hz Filtered------')
with open(dir_path + r"/Candidates2Params(50HzFiltered)/Wilks_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks ICS {} and {} of cross correlation with {} variables used being: {}'.format(res,cross, t, vars))

with open(dir_path + r"/Candidates2Params(50HzFiltered)/Wilks_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i+1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(50HzFiltered)/Mahalanobis_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis ICS {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(50HzFiltered)/Mahalanobis_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

print('\n------50Hz Filtered and pu calculated------')
with open(dir_path + r"/Candidates2Params(50HzFiltered,pucalculated)/Wilks_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks ICS {} and {} of cross correlation with {} variables used being: {}'.format(res,cross, t, vars))

with open(dir_path + r"/Candidates2Params(50HzFiltered,pucalculated)/Wilks_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(50HzFiltered,pucalculated)/Mahalanobis_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis ICS {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(50HzFiltered,pucalculated)/Mahalanobis_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

print('\n------50Hz Filtered, pu calculated and v2-v1------')
with open(dir_path + r"/Candidates2Params(v1-v2,50HzFiltered, pucalculated)/Wilks_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks ICS {} and {} of cross correlation with {} variables used being: {}'.format(res,cross, t, vars))

with open(dir_path + r"/Candidates2Params(v1-v2,50HzFiltered, pucalculated)/Wilks_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i+1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Wilks delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(v1-v2,50HzFiltered, pucalculated)/Mahalanobis_ICS.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis ICS {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))

with open(dir_path + r"/Candidates2Params(v1-v2,50HzFiltered, pucalculated)/Mahalanobis_delta.htm") as f:
    html = f.read()
    soup = BeautifulSoup(html, "lxml")
    x = soup.find_all('table')
    y = x[len(x) - 1]
    z = y.find_all('td')
    cross = str(z[len(z)-8])[37:42]
    res = str(z[len(z)-10])[37:42]
    t = str(soup.find_all('table')[2])
    i = 0
    t = 0
    vars = ''
    for row in soup.find_all('table')[2].tbody.findAll('tr'):
        i = i + 1
        if (str(row.findAll('td')[1].contents).find('x') != -1):
            y = str(row.findAll('td')[2].contents)
            vars = vars.replace(y, '')
            t = t - 1
        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                vars.find(str(row.findAll('td')[1].contents)) == -1):
            t = t + 1
            vars = vars + str(row.findAll('td')[1].contents)
    print('Mahalanobis delta {} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))