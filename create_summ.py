from bs4 import BeautifulSoup
import os
import pandas as pd
from openpyxl import load_workbook

dir_path = os.path.dirname(os.path.realpath(__file__))
meas = pd.DataFrame(columns=['accuracy', 'cross', 'n_vars', 'variables'])
index = 0
folders = [r"/Candidates2Params(NonFiltered)", r"/Candidates2Params(NonFiltered,pucalculated)",
           r"/Candidates2Params(v1-v2, NonFiltered, pucalculated)", r"/Candidates2Params(50HzFiltered)",
           r"/Candidates2Params(50HZFiltered,pucalculated)", r"/Candidates2Params(v1-v2,50HzFiltered, pucalculated)"]
studies = [r"/Wilks_ICS.htm", r"/Wilks_delta.htm", r"/Mahalanobis_ICS.htm", r"/Mahalanobis_ICS.htm"]

for fol in folders:
    print("--------"+fol[19:-1]+"--------")
    for stu in studies:
        print(stu[1:-4]+": ", end='')
        with open(dir_path + fol + stu) as f:
            html = f.read()
            soup = BeautifulSoup(html, "lxml")
            x = soup.find_all('table')
            y = x[len(x) - 1]
            z = y.find_all('td')
            for lines in z:
                if str(lines).find('cross-validated grouped cases correctly classified') != -1:
                    cross = str(lines)[37:42]
                elif str(lines).find('original grouped cases correctly classified') != -1:
                    res = str(lines)[37:42]
            i = 0
            n = -1
            t = 0
            variables = []
            for j in soup.find_all('caption'):
                n = n + 1
                if "Variables Entered/Removed" in j:
                    for row in soup.find_all('table')[n].tbody.findAll('tr'):
                        i = i + 1
                        if str(row.findAll('td')[1].contents).find('x') != -1:
                            y = str(row.findAll('td')[2].contents)[2:-2]
                            variables.remove(y)
                            t = t - 1
                        elif i >= 4 and (str(row.findAll('td')[1].contents).find('x') == -1) and (
                                str(row.findAll('td')[1].contents) not in variables):
                            t = t + 1
                            variables.append(str(row.findAll('td')[1].contents)[2:-2])
            print(
                '{} and {} of cross correlation with {} variables used being: {}'.format(res, cross, t, variables))
            meas.loc[index] = [res, cross, t,
                               str(variables)[1:-1].replace(", ", "\t").replace(r"'", r"\"").replace('\\', "")]
            index = index + 1
book = load_workbook(r'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\results.xlsx')
writer = pd.ExcelWriter(r'C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\results.xlsx', engine='openpyxl')
writer.book = book
writer.sheets = dict((ws.title, ws) for ws in book.worksheets)
meas.to_excel(writer, sheet_name='Sheet1')
writer.save()
