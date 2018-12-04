Sort transpose and summarize with output dataset using just one proc

 Two solutions

         1. Proc corresp
         2. Proc report


github
https://tinyurl.com/y6twhzlx
https://github.com/rogerjdeangelis/utl-sort-transpose-and-summarize-with-output-dataset-using-just-one-proc

SAS Forum
https://tinyurl.com/y9p2qa5e
https://communities.sas.com/t5/SAS-Programming/Case-Statement-or-other-type-breakout/m-p/517060


INPUT
=====

 WORK.HAVE total obs=14

  NAME    TYPE

  Mike    Red
  Mike    Red
  Mike    Blue
  Mike    Red
  Mike    Blue
  Mike    Red
  Mike    Green

  Matt    Red
  Matt    Red
  Matt    Red
  Matt    Red
  Matt    Blue
  Matt    Green
  Matt    Green


EXAMPLE OUTPUT
--------------

 WORK.WANT total obs=3

  LABEL    BLUE    GREEN    RED    SUM

  Matt       1       2       4       7
  Mike       2       1       4       7

  Sum        3       3       8      14


PROCESS
=======

 1. Proc corresp

    ods output observed=want;
    proc corresp data=have dim=1 observed;
       tables name, type;
    run;quit;

 2. Proc report

   proc report data=have out=want_rpt missing nowd;
     cols name type;
     define name / group;
     define type / across;
   run;quit;

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

data have;
  input name $ type $;
cards;
Mike Red
Mike Red
Mike Blue
Mike Red
Mike Blue
Mike Red
Mike Green
Matt Red
Matt Red
Matt Red
Matt Red
Matt Blue
Matt Green
Matt Green
;;;;
run;quit;
