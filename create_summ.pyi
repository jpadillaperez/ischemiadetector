from bs4 import BeautifulSoup
import os
import pandas as pd
from openpyxl import load_workbook

dir_path = os.path.dirname(os.path.realpath(__file__))
meas = pd.DataFrame(columns=['accuracy', 'cross', 'n_vars', 'vars'])
index = 1
folders = [r"/Candidates2Params(NonFiltered)", r"/Candidates2Params(NonFiltered,pucalculated)", r"/Candidates2Params(v1-v2, NonFiltered, pucalculated)", r"/Candidates2Params(50HzFiltered)", r"/Candidates2Params(50HZFiltered,pucalculated)", r"/Candidates2Params(v1-v2,50HzFiltered, pucalculated)"]
studies = [r"/Wilks_ICS.htm", r"/Wilks_delta.htm", r"/Mahalanobis_ICS.htm", r"/Mahalanobis_ICS.htm"]

for fol in folders:
    print("--------"+fol[19:-1]+"--------")
    for stu in studies:
        print(stu[1:-4]+": ", end = '')
        with open(dir_path + fol + stu) as f:
            html = f.read()
            soup = BeautifulSoup(html, "lxml")
            x = soup.find_all('table')
            y = x[len(x) - 1]
            z = y.find_all('td')
            cross = str(z[len(z) - 8])[37:42]
            res = str(z[len(z) - 10])[37:42]
            t = str(soup.find_all('table')[2])
            i = 0
            n = -1
            t = 0
            vars = []
            for j in soup.find_all('caption'):
                n = n + 1
                if "Variables Entered/Removed" in j:
                    for row in soup.find_all('table')[n].tbody.findAll('tr'):
                        i = i + 1
                        if (str(row.findAll('td')[1].contents).find('x') != -1):
                            y = str(row.findAll('td')[2].contents)[2:-2]
                            vars.remove(y)
                            t = t - 1
                        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                                str(row.findAll('td')[1].contents) not in vars):
                            t = t + 1
                            vars.append(str(row.findAll('td')[1].contents)[2:-2])
            print(
                '{} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, vars))
            meas.loc[index] = [res, cross, int(t),
                               str(vars)[1:-1].replace(", ", "\t").replace(r"'", r"\"").replace('\\', "")]
            index = index + 1
book = load_workbook(r'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\results.xlsx')
writer = pd.ExcelWriter(r'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\results.xlsx', engine='openpyxl')
writer.book = book
writer.sheets = dict((ws.title, ws) for ws in book.worksheets)
meas.to_excel(writer, sheet_name='Sheet1')
writer.save()
