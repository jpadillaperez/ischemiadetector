/* MEX-file for reading MIT format annotation for ECG Signals */
/* (c) Juan Pablo Martinez Cortes.  University of Zaragoza.
   e-mail: juanpabl@tsc1.cps.unizar.es */
/*
/	INCLUDE FILES
*/

#include 	"mex.h"
#include        <stdio.h>
#include        <string.h>
#include        <tmwtypes.h>


 void mexFunction(
	int	nlhs,
	mxArray	*plhs[],
	int	nrhs,
	const mxArray	*prhs[]
	)


{

/* Variable definition*/
char *filename;
int32_T nsamp,dim;
int  freq,buflen, A, II;
int32_T I;
double *timeabs, *time, *timedata;
int32_T timelim[2];
int32_T nbytes, nevents, i, pos,k;
int dims[2];
mxChar *anntyp;
mxChar *subtyp;
mxChar *chan, *num;
char **aux;
char *nullstring = "";
char *currauxfield;
unsigned char currnumfield, currchanfield, currsubtyp, data[2], skip[4];
const char* typecode = "NLRaVFJASEj/Q~ | sT*D\"=pB^t+u?![]en@xf()r";
const char* field_names[] ={"time","anntyp","subtyp","chan","num","aux"};
FILE *fid;
mxArray *outtime, *outsubtyp, *outanntyp, *outchan, *outnum, *outaux;
char finalflag=0;
mxChar *char_array;
/*---------------------------------------------------------------------*/


/*----------------------------------------------------------------------/
/	Check for proper number of arguments				/
/----------------------------------------------------------------------*/

if ((nrhs < 1)||(nrhs>2))
{
	mexErrMsgTxt ( "readannot: one or two input arguments required" );
}
if ( nlhs > 1 )
{
	mexErrMsgTxt ( "readannot: none or one output argument required" );
}

if (!mxIsChar(prhs[0]))
    mexErrMsgTxt("First argument must be a string.");
else if (!mxGetM(prhs[0]))
    mexErrMsgTxt("First argument must be a string in a row vector.");
    
/* Get the length of the input string. */
buflen = mxGetN(prhs[0])+1;
/* Allocate memory for input filename */
filename = mxCalloc(buflen, sizeof(char));
/* Copy argument to variable */
mxGetString(prhs[0], filename, buflen);

/* Reading time of beginning and end */

if (nrhs>1)
   {
    if (!mxIsNumeric(prhs[1]))
        mexErrMsgTxt("Second argument (optional) must be a numeric array.");
    else if ((mxGetM(prhs[1])!=1)||(mxGetN(prhs[1])!=2))
               mexErrMsgTxt("Third argument must be a 1x2 numerical array");
    timeabs = mxGetPr(prhs[1]);
    if (timeabs[1]<=timeabs[0])
          mexErrMsgTxt("Bad time vector");
    else
      if (mxIsFinite(timeabs[1]))
            {timelim[0]=(int32_T) timeabs[0];
             timelim[1]=(int32_T) timeabs[1];}
      else
            {timelim[0]=(int32_T) timeabs[0];
             timelim[1]=-1;}
   }
else
    {timelim[0]=0; timelim[1]=-1;}           /* -1 means until the end */


/*printf (" %d %d",timelim[0],timelim[1]);*/
/*-----------------------------------------------------------------------------*/
/*------------------------- Reading and interpreting annotation data ----------*/
/*-----------------------------------------------------------------------------*/

if ((fid = fopen(filename, "rb"))==NULL)
     mexErrMsgTxt("Unable to open annotation file");

/* Estimation of the number of annotationns */
fseek(fid, 0, SEEK_END);
nbytes = ftell(fid);
rewind(fid);
dim = nbytes / 2 ;           /* The maximum number of posible events */
/*******************Memory Allocation ***************************/
time = (double*) mxCalloc(dim, sizeof(double));
anntyp = (mxChar*) mxCalloc(dim, sizeof(mxChar));
subtyp = (mxChar*) mxCalloc(dim, sizeof(mxChar));
chan = (mxChar*) mxCalloc(dim, sizeof(mxChar));
num = (mxChar*) mxCalloc(dim, sizeof(mxChar));
aux = (char**) mxCalloc(dim, sizeof(char*));

/***************** Variable Initialization**********************/
i=0;                  /* Current annotation number (index) */
pos = 0;
currnumfield = '0';
currchanfield = '0';
currsubtyp = '0';
currauxfield = nullstring;
/**************** Reading of the two first bytes ************************/
fread(data,sizeof(char),2,fid);
if (ferror(fid)) mexErrMsgTxt("Error reading annotation file");

/*printf (" %d %d",data[0],data[1]);*/

if (timelim[1]== -1) finalflag =1;
while ((!feof(fid))&&(finalflag || (pos<timelim[1])))
  {A = data[0] + (((int) data[1])<<8); /* A = data[0] + data[1]*256 */
   II = A & 0x03FF;   /* in binary 0000001111111111 */
   A = A>>10;

   /*printf ("A = %d L = %d\n", A, II);*/
   
   /* Special case. Initially A = 59 */
   while (A==59)
         {fread(skip,sizeof(char),4,fid);
          if (ferror(fid)) mexErrMsgTxt("Error reading annotation file");
          if (feof(fid)) mexErrMsgTxt("Unexpected EOF");
          I = skip[2]+( (skip[3]+ ( (skip[0]+ ( ( (int32_T) skip[1] )<<8 ) )<<8 ) )<<8);
           /*printf ("Skip = %d\n", I);         */
          pos += I;
	  fread(data,sizeof(char),2,fid);
          if (ferror(fid)) mexErrMsgTxt("Error reading annotation file");
	  if (feof(fid)) mexErrMsgTxt("Unexpected EOF");
          A = data[0] + (((int) data[1])<<8); /* A = data[0] + data[1]*256 */
          II = A & 0x03FF;   /* in binary 0000001111111111 */
          A = A>>10;
         }
   if (A) anntyp[i] = typecode[A-1];     /*type of annotation*/
   else break;           /*if A=0, break*/

   /* Reading next 2 bytes */
   fread(data,sizeof(char),2,fid);
   if (ferror(fid)) mexErrMsgTxt("Error reading annotation file");
   if (feof(fid)) 
      {A = 0;}
   else
      {A = data[0] + (((int) data[1])<<8); /* A = data[0] + data[1]*256 */
       I = A & 0x03FF;   /* in binary 0000001111111111 */
       A = A>>10;
       }
   while (A>=60)                         /*while more information about i-th annotation*/
     {if (A==60) currnumfield = (char) '0'+I;
           else if  (A==61) currsubtyp = (char) '0'+I;
                else if (A==62) currchanfield = (char) '0'+I;
                     else if (A==63)
                            {if (I & 0x0001) I++;
                             currauxfield = (char*) mxCalloc(I+1, sizeof(char));
                             fread(currauxfield,sizeof(char),I,fid);
                             currauxfield[I]='\0';  /* Chain delimitator */
                             if (ferror(fid)) mexErrMsgTxt("Error reading annotation file");
                             if (feof(fid)) mexErrMsgTxt("Unexpected EOF");
                             aux;
                             }
     fread(data,sizeof(char),2,fid);
     if (ferror(fid)) mexErrMsgTxt("Error reading annotation file");
     if (feof(fid)) {break; /* del? */}
     A = data[0] + (((int) data[1])<<8); /* A = data[0] + data[1]*256 */
     I = A & 0x03FF;   /* in binary 0000001111111111 */
     A = A>>10;


     }
   pos += II;
   time[i]= (double) pos;
   /*printf ("pos = %d %d %3.5f\n", pos, II, time[i]);*/
   num[i]=currnumfield;
   chan[i]=currchanfield;
   aux[i]=currauxfield;
   subtyp[i]=currsubtyp;
   currsubtyp = '0';
   currauxfield = nullstring;
   i ++;
  }
fclose(fid);
if ((!finalflag)&& (pos>timelim[1])) i--; /* Last event passes through final time */
/****** First event must be the first after timelim[0]*********/

k=0;
while (time[k]<timelim[0])
{
k++;
}
i-=k;
/*printf ("i = %d k = %d timelim = %d %d\n", i, k, timelim[0], timelim[1]);*/

/****************** Create struct ******************/
plhs[0] = mxCreateStructMatrix(1,1,6,field_names);
/****************** Fill the arrays for the fields ***/
dims[0]=i; dims[1]= 1;
/***** time field *****/
outtime = mxCreateNumericArray(2,dims,mxDOUBLE_CLASS,mxREAL);
timedata = (double*) mxGetData(outtime);
memcpy(timedata, &time[k], i*sizeof(double));
mxSetFieldByNumber(plhs[0], 0, 0, outtime);

/***** anntyp field ****/
outanntyp = mxCreateCharArray(2,dims);
char_array = (mxChar*) mxGetData(outanntyp);
memcpy(char_array, &anntyp[k], i*sizeof(mxChar));
/*printf(" %c %c ",char_array[45000],char_array[50000]);*/
mxSetFieldByNumber(plhs[0], 0, 1, outanntyp); 

/***** subtyp field ****/
outsubtyp = mxCreateCharArray(2,dims);
char_array = (mxChar*) mxGetData(outsubtyp);
memcpy(char_array, &subtyp[k], i*sizeof(mxChar));
mxSetFieldByNumber(plhs[0], 0, 2, outsubtyp); 

/***** chan field ****/
outchan = mxCreateCharArray(2,dims);
char_array = (mxChar*) mxGetData(outchan);
memcpy(char_array, &chan[k], i*sizeof(mxChar));
mxSetFieldByNumber(plhs[0], 0, 3, outchan); 

/***** num field ****/
outnum = mxCreateCharArray(2,dims);
char_array = (mxChar*) mxGetData(outnum);
memcpy(char_array, &num[k], i*sizeof(mxChar));
mxSetFieldByNumber(plhs[0], 0, 4, outnum);

/***** aux field *****/
outaux=mxCreateCharMatrixFromStrings(i,(const char**) &aux[k]);
mxSetFieldByNumber(plhs[0], 0, 5, outaux);



/****************** Free Memory   ******************/
mxFree(time);
mxFree(anntyp);
mxFree(subtyp);
mxFree(chan);
mxFree(num);
mxFree(aux);
}



