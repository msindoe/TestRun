DATA WORK.IEP_yrs;
    LENGTH
        student_id       $ 11
        year               8
        iep_spec_ed_flg  $ 15 ;
    FORMAT
        student_id       $CHAR11.
        year             BEST12.
        iep_spec_ed_flg  $CHAR15. ;
    INFORMAT
        student_id       $CHAR11.
        year             BEST12.
        iep_spec_ed_flg  $CHAR15. ;
    INFILE 'C:\DOCUME~1\BJABBA~1\LOCALS~1\Temp\SAS Temporary Files\_TD432\#LN00015'
        LRECL=38
        ENCODING="WLATIN1"
        TERMSTR=CRLF
        TRUNCOVER ;
    INPUT
        @1     student_id       $CHAR11.
        @12    year             ?? BEST12.
        @24    iep_spec_ed_flg  $CHAR15. ;
RUN;


Data IEP;
set work.iep_yrs;
where year ne .;
run;

Proc sort data=IEP nodup; by student_id; run;

Data IEP_2;
set IEP;
by student_id;
if first.student_id then sum=0;
sum+1;
run;

Data IEP_3;
set IEP_2;
by student_id;
where sum > 1;
yr=strip(year);
keep student_id yr iep_spec_ed_flg;
run;



proc transpose data=IEP_3 out=IEP_Trans;
	by student_id;
	id yr;
	var iep_spec_ed_flg;
run;





