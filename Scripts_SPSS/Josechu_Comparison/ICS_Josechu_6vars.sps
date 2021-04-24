* Encoding: UTF-8.
*Analisis todas las señales para el resultado de delta de josechu

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st3 ta7 tp8 tp2 st9 st6
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\6Vars_Josechu_ics(v1-v2, NonFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered,pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st3 ta7 tp8 tp2 st9 st6
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\6Vars_Josechu_ics(NonFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st3 ta7 tp8 tp2 st9 st6
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\6Vars_Josechu_ics(NonFiltered).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.


DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st3 ta7 tp8 tp2 st9 st6
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\6Vars_Josechu_ics(v1-v2, 50HzFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered,pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.


DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st3 ta7 tp8 tp2 st9 st6
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\6Vars_Josechu_ics(50HzFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.


DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st3 ta7 tp8 tp2 st9 st6
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\6Vars_Josechu_ics(50HzFiltered).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st3 ta7 tp8 tp2 st9 st6
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\6Vars_Josechu_ics(v1-v2, 60HzFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered,pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st3 ta7 tp8 tp2 st9 st6
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\6Vars_Josechu_ics(60HzFiltered, pucalculated).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st3 ta7 tp8 tp2 st9 st6
  /ANALYSIS ALL
  /PRIORS SIZE 
  /STATISTICS=MEAN STDDEV RAW CORR CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Results_SPSS\6Vars_Josechu_ics(60HzFiltered).htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .
