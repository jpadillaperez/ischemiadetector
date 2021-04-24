*Analysis hipotetica seÃ±ales sin filtrar.
GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\Mahalanobis_ICS.htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\data_spss_delta.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\Mahalanobis_delta.htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

*Analysis hipotetica seÃ±ales filtrado 50Hz.
GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\Mahalanobis_ICS.htm".
 
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
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\Mahalanobis_delta.htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

*Analysis hipotetica seÃ±ales filtrado 50Hz.

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\Mahalanobis_ICS.htm".
 
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
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=3
  /FOUT=2
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\Mahalanobis_delta.htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .



