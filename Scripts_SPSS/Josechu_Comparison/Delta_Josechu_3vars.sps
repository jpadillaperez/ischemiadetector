* Encoding: UTF-8.
*Analisis todas las señales para el resultado de delta de josechu

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\data_spss_delta.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=ta7 st3 st9
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\3Vars_Josechu_delta(v1-v2, NonFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered,pucalculated)\data_spss_delta.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=ta7 st3 st9
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\3Vars_Josechu_delta(NonFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered)\data_spss_delta.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=ta7 st3 st9
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\3Vars_Josechu_delta(NonFiltered).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\data_spss_delta.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.


DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=ta7 st3 st9
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\3Vars_Josechu_delta(v1-v2, 50HzFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered,pucalculated)\data_spss_delta.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.


DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=ta7 st3 st9
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\3Vars_Josechu_delta(50HzFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered)\data_spss_delta.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.


DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=ta7 st3 st9
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\3Vars_Josechu_delta(50HzFiltered).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\data_spss_delta.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=ta7 st3 st9
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\3Vars_Josechu_delta(v1-v2, 60HzFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered,pucalculated)\data_spss_delta.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=ta7 st3 st9
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\3Vars_Josechu_delta(60HzFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered)\data_spss_delta.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=ta7 st3 st9
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\3Vars_Josechu_delta(60HzFiltered).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .
