﻿* Encoding: UTF-8.
*Analysis hipotetica señales sin filtrar.
GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=2
  /FOUT=1
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
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2, NonFiltered, pucalculated)\Mahalanobis_delta.htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

*Analysis hipotetica señales filtrado 50Hz.
GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=2
  /FOUT=1
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
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,50HzFiltered, pucalculated)\Mahalanobis_delta.htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

*Analysis hipotetica señales filtrado 50Hz.

GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=2
  /FOUT=1
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
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9 
    st10 qt10 qd10 ta10 tp10
  /ANALYSIS ALL
  /METHOD=MAHAL    
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(v1-v2,60HzFiltered, pucalculated)\Mahalanobis_delta.htm".
 
OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

*Analysis original para filtrado de 50Hz.
GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered,pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered,pucalculated)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered,pucalculated)\Mahalanobis_ICS.htm".

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
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered,pucalculated)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered,pucalculated)\Mahalanobis_delta.htm".

OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


*Analysis original para filtrado de 60Hz.
GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered,pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered,pucalculated)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered,pucalculated)\Mahalanobis_ICS.htm".

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
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered,pucalculated)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered,pucalculated)\Mahalanobis_delta.htm".

OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


*Analysis original sin filtrado.
GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered,pucalculated)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered,pucalculated)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered,pucalculated)\Mahalanobis_ICS.htm".

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
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered,pucalculated)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered,pucalculated)\Mahalanobis_delta.htm".

OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


*Analysis original para filtrado de 50Hz.
GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered)\Mahalanobis_ICS.htm".

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
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(50HzFiltered)\Mahalanobis_delta.htm".

OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


*Analysis original para filtrado de 60Hz.
GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered)\Mahalanobis_ICS.htm".

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
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(60HzFiltered)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered)\Mahalanobis_delta.htm".

OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .


*Analysis original sin filtrado.
GET DATA /TYPE=XLSX
  /FILE='C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered)\data_spss_ics.xlsx'
  /SHEET=name 'Sheet1'
  /READNAMES=on 
  /ASSUMEDSTRWIDTH=32767.
DATASET NAME DataSet1 WINDOW=FRONT.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered)\Wilks_ICS.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered)\Mahalanobis_ICS.htm".

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
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=WILKS 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.

OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered)\Wilks_delta.htm".
 
OUTPUT CLOSE *.

DISCRIMINANT
  /GROUPS=groups(1 3)
  /VARIABLES=st1 qt1 qd1 ta1 tp1 st2 qt2 qd2 ta2 tp2 st3 qt3 qd3 ta3 tp3 st4 qt4 qd4 ta4 tp4 st5 
    qt5 qd5 ta5 tp5 st6 qt6 qd6 ta6 tp6 st7 qt7 qd7 ta7 tp7 st8 qt8 qd8 ta8 tp8 st9 qt9 qd9 ta9 tp9
  /ANALYSIS ALL
  /METHOD=MAHAL 
  /FIN=2
  /FOUT=1
  /PRIORS SIZE 
  /HISTORY
  /STATISTICS=RAW CROSSVALID 
  /PLOT=COMBINED 
  /CLASSIFY=NONMISSING POOLED.


OUTPUT EXPORT /CONTENTS EXPORT=VISIBLE/HTML DOCUMENTFILE="C:\Users\Jorge\GDrive\Universidad\BSICOS\Project\Candidates2Params(NonFiltered)\Mahalanobis_delta.htm".

OUTPUT CLOSE *.

DATASET CLOSE DataSet1 .

