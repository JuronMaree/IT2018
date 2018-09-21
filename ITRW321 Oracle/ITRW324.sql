/* DROP*/
DROP TABLE COMMITTEE_DIM;
DROP TABLE SEMESTER_DIM;
DROP TABLE RESIDENCE_DIM;
DROP TABLE CAMPUS_DIM;
DROP TABLE EVENT_DIM;
DROP TABLE STUDENT_DIM;
DROP TABLE ATTENDANCE_FACT;
DROP TABLE STUDENT_FACT;
DROP TABLE EVENT_TYPE_FACT;
DROP TABLE EVENT_FACT;
DROP TABLE STUDENTS_FACT;
DROP SEQUENCE committee_committee_code_seq;
DROP SEQUENCE sem_sem_num_seq;
DROP SEQUENCE res_res_code_seq;
DROP SEQUENCE campus_campus_code_seq;
DROP SEQUENCE event_type_event_type_code_seq;
DROP SEQUENCE student_student_num_seq;
drop view STUDENTS_VIEW ;

/* CREATE TABLES */
/* DIM */
CREATE TABLE COMMITTEE_DIM(
committee_code NUMBER(6) CONSTRAINT committee_committee_code PRIMARY KEY,
committee_description VARCHAR(20));

CREATE TABLE SEMESTER_DIM(
sem_num NUMBER(6) CONSTRAINT sem_sem_num PRIMARY KEY,
start_date DATE,
end_date DATE);

CREATE TABLE RESIDENCE_DIM(
res_code NUMBER(6) CONSTRAINT res_res_code PRIMARY KEY,
res_descript VARCHAR(20));

CREATE TABLE CAMPUS_DIM(
campus_code NUMBER(6) CONSTRAINT campus_campus_code PRIMARY KEY,
campus_description VARCHAR(20));

CREATE TABLE EVENT_DIM(
event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code PRIMARY KEY,
event_description VARCHAR(20));

CREATE TABLE STUDENT_DIM(
student_num NUMBER(6) CONSTRAINT stud_student_num PRIMARY KEY,
student_fname VARCHAR(25),
student_lname VARCHAR(25));


/* FACT */
CREATE TABLE ATTENDANCE_FACT(
year_year NUMBER(6),
sem_num NUMBER(6) CONSTRAINT sem_sem_num1 REFERENCES SEMESTER_DIM(sem_num),
res_code NUMBER(6) CONSTRAINT res_res_code1 REFERENCES RESIDENCE_DIM(res_code),
event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code1 REFERENCES EVENT_DIM(event_type_code),
committee_code NUMBER(6) CONSTRAINT committee_committee_code1 REFERENCES COMMITTEE_DIM(committee_code),
percentage_attendance NUMBER(3), PRIMARY KEY(year_year, sem_num, res_code, event_type_code, committee_code ));

CREATE TABLE STUDENT_FACT(
year_year NUMBER(4),
committee_code NUMBER(6) CONSTRAINT committee_committee_code2 REFERENCES COMMITTEE_DIM(committee_code),
res_code NUMBER(6) CONSTRAINT res_res_code2 REFERENCES RESIDENCE_DIM(res_code),
total_num_students NUMBER(3),PRIMARY KEY(year_year, committee_code, res_code));

CREATE TABLE EVENT_TYPE_FACT(
year_year NUMBER(6),
sem_num NUMBER(6) CONSTRAINT sem_sem_num3 REFERENCES SEMESTER_DIM(sem_num),
campus_code NUMBER(6) CONSTRAINT campus_campus_code3 REFERENCES CAMPUS_DIM(campus_code),
event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code3 REFERENCES EVENT_DIM(event_type_code),
total_events NUMBER(4), PRIMARY KEY(year_year, sem_num, campus_code, event_type_code));

CREATE TABLE EVENT_FACT(
year_year NUMBER(6),
month_month NUMBER(6),
event_type_code NUMBER(6) CONSTRAINT type_code4 REFERENCES EVENT_DIM(event_type_code),
res_code NUMBER(6) CONSTRAINT res_res_code4 REFERENCES RESIDENCE_DIM(res_code),
tot_stu_attend_event NUMBER(6),
tot_events_stu_attend NUMBER(3),PRIMARY KEY(year_year, month_month,event_type_code,res_code));

CREATE TABLE STUDENTS_FACT(
year_year NUMBER(6) ,
month_month NUMBER(6),
res_code NUMBER(6) CONSTRAINT res_res_code5 REFERENCES RESIDENCE_DIM(res_code),
event_type_code NUMBER(6) CONSTRAINT ent_type_ev_type_c REFERENCES EVENT_DIM(event_type_code),
student_num NUMBER(6) CONSTRAINT stnt_student_num5 REFERENCES STUDENT_DIM(student_num),
total_students_in_res NUMBER(3),PRIMARY KEY(year_year, month_month, res_code, event_type_code, student_num));


/* SEQUENCES */
CREATE SEQUENCE committee_committee_code_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE sem_sem_num_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE res_res_code_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE campus_campus_code_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE event_type_event_type_code_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE student_student_num_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCACHE
NOCYCLE;





/* ////////////////////////////////////////////////////////////*/




/*INSERT*/

/*Different Committee*/
INSERT INTO COMMITTEE_DIM(committee_code, committee_description)
VALUES(committee_committee_code_seq.NEXTVAL, 'Sport');

INSERT INTO COMMITTEE_DIM(committee_code, committee_description)
VALUES(committee_committee_code_seq.NEXTVAL, 'Werwing');

INSERT INTO COMMITTEE_DIM(committee_code, committee_description)
VALUES(committee_committee_code_seq.NEXTVAL, 'Social');

INSERT INTO COMMITTEE_DIM(committee_code, committee_description)
VALUES(committee_committee_code_seq.NEXTVAL, 'Kulture');

INSERT INTO COMMITTEE_DIM(committee_code, committee_description)
VALUES(committee_committee_code_seq.NEXTVAL, 'SJGD');

INSERT INTO COMMITTEE_DIM(committee_code, committee_description)
VALUES(committee_committee_code_seq.NEXTVAL, 'RAG');

INSERT INTO COMMITTEE_DIM(committee_code, committee_description)
VALUES(committee_committee_code_seq.NEXTVAL, 'Academic');



/*Different Residences*/
INSERT INTO RESIDENCE_DIM(res_code, res_descript)
VALUES(res_res_code_seq.NEXTVAL, 'Caput');

INSERT INTO RESIDENCE_DIM(res_code, res_descript)
VALUES(res_res_code_seq.NEXTVAL, 'Hombre');

INSERT INTO RESIDENCE_DIM(res_code, res_descript)
VALUES(res_res_code_seq.NEXTVAL, 'Veritas');

INSERT INTO RESIDENCE_DIM(res_code, res_descript)
VALUES(res_res_code_seq.NEXTVAL, 'Excelsior');


/*Different Campus*/
INSERT INTO CAMPUS_DIM(campus_code, campus_description)
VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Potchefstroom');

INSERT INTO CAMPUS_DIM(campus_code, campus_description)
VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Vaal');

INSERT INTO CAMPUS_DIM(campus_code, campus_description)
VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Mafekeng');


/*Different Semesters*/
INSERT INTO SEMESTER_DIM(sem_num, start_date, end_date)
VALUES(sem_sem_num_seq.NEXTVAL, TO_DATE('02/Feb/2018'), TO_DATE('02/JUL/2018'));

INSERT INTO SEMESTER_DIM(sem_num, start_date, end_date)
VALUES(sem_sem_num_seq.NEXTVAL, TO_DATE('03/JUL/2018'), TO_DATE('13/NOV/2018'));


/*Different Student info*/
INSERT INTO STUDENT_DIM(student_num, student_fname, student_lname)
VALUES(student_student_num_seq.NEXTVAL, 'Juron', 'Maree');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_lname)
VALUES(student_student_num_seq.NEXTVAL, 'Jan', 'Lous');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_lname)
VALUES(student_student_num_seq.NEXTVAL, 'Martin', 'Jacobs');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_lname)
VALUES(student_student_num_seq.NEXTVAL, 'Pieter', 'Brits');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_lname)
VALUES(student_student_num_seq.NEXTVAL, 'Steven', 'Herbs');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_lname)
VALUES(student_student_num_seq.NEXTVAL, 'Levi', 'Goerge');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_lname)
VALUES(student_student_num_seq.NEXTVAL, 'Len', 'PC');

/*Different Events sport*/
INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Hockey');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Cricket');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Rugby');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Tennis');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Squash');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Soccer');

/*Different Events werwing*/
INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Residence tours');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Residence Open day');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Residence stall');

/*Different Events Social*/
INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'FatherSon weekend');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Engagement social');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Marriage social');

/*Different Events Kulture*/
INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Ser');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Play');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Debate');

/*Different Events SJGD*/
INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Barfoot day');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'School socials');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Can food day');

/*Different Events RAG*/
INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'RAG float');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Fin RAG');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'RAG games');

/*Different Events Academic*/
INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Spelling-B');

INSERT INTO EVENT_DIM(event_type_code, event_description)
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Academic night');


/*STUDENT_FACT*/
/*Sport, Caput*/
INSERT ALL 
INTO STUDENT_FACT values(2018,c.committee,r.res_code, t.total_num_students)
SELECT c.committee_code, r.res_code, t.total_num_students
from committee_dim c
join residance_dim r
on 
;


INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 1, 1, 20);

/*Sport, Hombre*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 1, 2, 30);

/*Sport, Veritas*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 1, 3, 22);

/*Sport, Excelsior*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 1, 4, 50);

/*Werwing, Caput*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 2, 1, 50);

/*Werwing, Hombre*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 2, 2, 19);

/*Werwing, Veritas*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 2, 3, 22);

/*Werwing, Excelsior*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 2, 4, 36);

/*Social, Caput*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 3, 1, 30);

/*Social, Hombre*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 3, 2, 38);

/*Social, Veritas*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 3, 3, 50);

/*Social, Excelsior*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 3, 4, 47);

/*Kulture, Caput*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 4, 1, 26);

/*Kulture, Hombre*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 4, 2, 23);

/*Kulture, Veritas*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 4, 3, 50);

/*Kulture, Excelsior*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 4, 4, 79);

/*SJGD, Caput*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 5, 1, 39);

/*SJGD, Hombre*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 5, 2, 39);

/*SJGD, Veritas*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 5, 3, 43);

/*SJGD, Excelsior*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 5, 4, 20);

/*RAG, Caput*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 6, 1, 34);

/*RAG, Hombre*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 6, 2, 60);

/*RAG, Veritas*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 6, 3, 39);

/*RAG, Excelsior*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 6, 4, 25);

/*Academic, Caput*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 7, 1, 21);

/*Academic, Hombre*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 7, 2, 44);

/*Academic, Veritas*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 7, 3, 59);

/*Academic, Excelsior*/
INSERT INTO STUDENT_FACT(year_year, committee_code, res_code, total_num_students)
VALUES(2018, 7, 4, 33);


/*ATTENDANCE_FACT*/
/*Attendance for Sport*/
/*Caput, Hockey, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 1, 1, 0.5);

/*Hombre, Hockey, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 1, 1, 0.10);

/*Veritas, Hockey, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 1, 1, 0.8);

/*Excelsior, Hockey, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 1, 1, 0.9);

/*Caput, Cricket, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 2, 1, 0.10);

/*Hombre, Cricket, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 2, 1, 0.5);

/*Veritas, Cricket, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 2, 1, 0.9);

/*Excelsior, Cricket, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 2, 1, 0.9);

/*Caput, Rugby, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 3, 1, 0.10);

/*Hombre, Rugby, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 3, 1, 0.10);

/*Veritas, Rugby, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 3, 1, 0.10);

/*Excelsior, Rugby, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 3, 1, 0.10);

/*Caput, Tennis, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 1, 4, 1, 0.7);

/*Hombre, Tennis, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 2, 4, 1, 0.9);

/*Veritas, Tennis, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 3, 4, 1, 0.10);

/*Excelsior, Tennis, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 4, 4, 1, 0.3);

/*Caput, Squash, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 1, 5, 1, 0.8);

/*Hombre, Squash, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 2, 5, 1, 0.9);

/*Veritas, Squash, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 3, 5, 1, 0.9);

/*Excelsior, Squash, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 4, 5, 1, 0.5);

/*Caput, Soccer, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 1, 6, 1, 0.5);

/*Hombre, Soccer, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 2, 6, 1, 0.10);

/*Veritas, Soccer, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 3, 6, 1, 0.9);

/*Excelsior, Soccer, Sport*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 4, 6, 1, 0.10);

/*Attendance for Werwing*/
/*Caput, Res-Tours, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 1, 2, 0.5);

/*Hombre, Res-Tours, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 1, 2, 0.9);

/*Veritas, Res-Tours, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 1, 2, 0.10);

/*Excelsior, Res-Tours, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 1, 2, 0.5);

/*Caput, Open-Day, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 2, 2, 0.10);

/*Hombre, Open-Day, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 2, 2, 0.3);

/*Veritas, Open-Day, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 2, 2, 0.9);

/*Excelsior, Open-Day, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 2, 2, 0.10);

/*Caput, Res-Stall, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 3, 2, 0.9);

/*Hombre, Res-Stall, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 3, 2, 0.4);

/*Veritas, Res-Stall, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 3, 2, 0.7);

/*Excelsior, Res-Stall, Werwing*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 3, 2, 0.4);

/*Attendance for Social*/
/*Caput, Father&Son, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 1, 3, 0.5);

/*Hombre, Father&Son, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 1, 3, 0.3);

/*Veritas, Father&Son, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 1, 3, 0.7);

/*Excelsior, Father&Son, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 1, 3, 0.5);

/*Caput, Engagement, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 1, 2, 3, 0.10);

/*Hombre, Engagement, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 2, 2, 3, 0.9);

/*Veritas, Engagement, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 3, 2, 3, 0.5);

/*Excelsior, Engagement, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 4, 2, 3, 0.10);

/*Caput, Marriage, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 1, 3, 3, 0.10);

/*Hombre, Marriage, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 2, 3, 3, 0.10);

/*Veritas, Marriage, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 3, 3, 3, 0.9);

/*Excelsior, Marriage, Social*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 4, 3, 3, 0.7);

/*Attendance for Kulture*/
/*Caput, Ser, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 1, 4, 0.7);

/*Hombre, Ser, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 1, 4, 0.10);

/*Veritas, Ser, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 1, 4, 0.3);

/*Excelsior, Ser, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 1, 4, 0.5);

/*Caput, Play, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 2, 4, 0.9);

/*Hombre, Play, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 2, 4, 0.10);

/*Veritas, Play, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 2, 4, 0.4);

/*Excelsior, Play, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 2, 4, 0.6);

/*Caput, Debate, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 3, 4, 0.9);

/*Hombre, Debate, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 3, 4, 0.5);

/*Veritas, Debate, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 3, 4, 0.10);

/*Excelsior, Debate, Kulture*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 3, 4, 0.6);

/*Attendance for SJGD*/
/*Caput, Barefoot, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 1, 1, 5, 0.4);

/*Hombre, Barefoot, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 2, 1, 5, 0.7);

/*Veritas, Barefoot, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 3, 1, 5, 0.10);

/*Excelsior, Barefoor, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 4, 1, 5, 0.5);

/*Caput, School, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 1, 2, 5, 0.7);

/*Hombre, School, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 2, 2, 5, 0.5);

/*Veritas, School, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 3, 2, 5, 0.10);

/*Excelsior, School, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 4, 2, 5, 0.9);

/*Caput, Can-Food, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 1, 3, 5, 0.5);

/*Hombre, Can-Food, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 2, 3, 5, 0.8);

/*Veritas, Can-Food, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 3, 3, 5, 0.8);

/*Excelsior, Can-Food, SJGD*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 4, 3, 5, 0.5);


/*Attendance for RAG*/
/*Caput, Float, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 1, 6, 0.8);

/*Hombre, Float, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 1, 6, 0.5);

/*Veritas, Float, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 1, 6, 0.10);

/*Excelsior, Float, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 1, 6, 0.8);

/*Caput, Fin, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 2, 6, 0.10);

/*Hombre, Fin, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 2, 6, 0.5);

/*Veritas, Fin, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 2, 6, 0.7);

/*Excelsior, Fin, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 2, 6, 0.10);

/*Caput, Game, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 1, 3, 6, 0.8);

/*Hombre, Game, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 2, 3, 6, 0.4);

/*Veritas, Game, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 3, 3, 6, 0.6);

/*Excelsior, Game, RAG*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 4, 3, 6, 0.6);

/*Attendance for Academic*/
/*Caput, Spelling-B, Academic*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 1, 1, 7, 0.7);

/*Hombre, Spelling-B, Academic*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 2, 1, 7, 0.10);

/*Veritas, Spelling-B, Academic*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 3, 1, 7, 0.4);

/*Exceslior, Spelling-B, Academic*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 1, 4, 1, 7, 0.10);

/*Caput, Academic-night, Academic*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 1, 2, 7, 0.3);

/*Hombre, Academic-night, Academic*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 2, 2, 7, 0.6);

/*Veritas, Academic-night, Academic*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 3, 2, 7, 0.10);

/*Excelsior, Academic-night, Academic*/
INSERT INTO ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)
VALUES(2018, 2, 4, 2, 7, 0.5);


/*EVENT_TYPE_FACT*/
/*Event Sport, NWU Potch, Hockey*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 1, 1, 1, 10);

/*Event Sport, NWU Vaal, Hockey*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 1, 2, 1, 10);

/*Event Sport, NWU Mafekeng, Hockey*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 1, 3, 1, 10);

/*Event Sport, NWU Potch, Cricket*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 1, 1, 2, 5);

/*Event Sport, NWU Vaal, Cricket*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 1, 2, 2, 5);

/*Event Sport, NWU Mafekeng, Cricket*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 1, 3, 2, 5);

/*Event Sport, NWU Potch, Rugby*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 1, 1, 3, 20);

/*Event Sport , NWU Vaal, Rugby*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 1, 2, 3, 20);

/*Event Sport, NWU Mafekeng, Rugby*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 1, 3, 3, 20);

/*Event Sport, NWU Potch, Tennis*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 2, 1, 4, 2);

/*Event Sport, NWU Vaal, Tennis*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 2, 2, 4, 2);

/*Event Sport, NWU Mafekeng, Tennis*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 2, 3, 4, 2);

/*Event Sport, NWU Potch, Squash*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 2, 1, 5, 5);

/*Event Sport, NWU Vaal, Squash*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 2, 2, 5, 5);

/*Event Sport, NWU Mafekeng, Squash*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 2, 3, 5, 5);

/*Event Sport, NWU Potch, Soccer*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 2, 1, 6, 15);

/*Event Sport, NWU Vaal, Soccer*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 2, 2, 6, 15);

/*Event Sport, NWU Mafekeng, Soccer*/
INSERT INTO EVENT_TYPE_FACT(year_year, sem_num, campus_code, event_type_code, total_events)
VALUES(2018, 2, 3, 6, 15);





/*EVENT_FACT*/
/*Events Sport, Feb, Hockey, Caput*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 2, 1, 1, 22, 6);

/*Events Sport, Feb, Hockey, Hombre*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 2, 1, 2, 19, 6);

/*Events Sport, Feb, Hockey, Veritas*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 2, 1, 3, 31, 8);

/*Events Sport, Feb, Hockey, Excelsior*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 2, 1, 4, 26, 7);

/*Events Sport, April, Cricket, Caput*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 4, 2, 1, 36, 5);

/*Events Sport, April, Cricket, Hombre*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 4, 2, 2, 22, 5);

/*Events Sport, April, Cricket, Veritas*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 4, 2, 3, 18, 4);

/*Events Sport, April, Cricket, Excelsior*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 4, 2, 4, 26, 5);

/*Events Sport, June, Rugby, Caput*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 6, 3, 1, 40, 20);

/*Events Sport, June, Rugby, Hombre*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 6, 3, 2, 34, 19);

/*Events Sport, June, Rugby, Veritas*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 6, 3, 3, 38, 20);

/*Events Sport, June, Rugby, Excelsior*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 6, 3, 4, 40, 18);

/*Events Sport, July, Tennis, Caput*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 7, 4, 1, 6, 2);

/*Events Sport, July, Tennis, Hombre*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 7, 4, 2, 4, 2);

/*Events Sport, July, Tennis, Veritas*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 7, 4, 3, 6, 2);

/*Events Sport, July, Tennis, Excelsior*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 7, 4, 4, 4, 2);

/*Events Sport, September, Squash, Caput*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 9, 5, 1, 8, 4);

/*Events Sport, September, Squash, Hombre*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 9, 5, 2, 4, 2);

/*Events Sport, September, Squash, Veritas*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 9, 5, 3, 6, 3);

/*Events Sport, September, Squash, Excelsior*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 9, 5, 4, 6, 4);

/*Events Sport, October, Soccer, Caput*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 10, 6, 1, 22, 12);

/*Events Sport, October, Soccer, Hombre*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 10, 6, 2, 18, 15);

/*Events Sport, October, Soccer, Veritas*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 10, 6, 3, 12, 15);

/*Events Sport, October, Soccer, Excelsior*/
INSERT INTO EVENT_FACT(year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
VALUES(2018, 10, 6, 4, 20, 13);


/*STUDENTS_FACT*/
/*Feb, Caput, Hockey, Juron*/
INSERT INTO STUDENTS_FACT(year_year, month_month, res_code, event_type_code, student_num, total_students_in_res)
VALUES(2018, 2, 1, 1, 1, 20);

/*Feb, Hombre, Hockey, Jan*/
INSERT INTO STUDENTS_FACT(year_year, month_month, res_code, event_type_code, student_num, total_students_in_res)
VALUES(2018, 2, 2, 1, 2, 11);

/*March, Caput, Cricket, Juron*/
INSERT INTO STUDENTS_FACT(year_year, month_month, res_code, event_type_code, student_num, total_students_in_res)
VALUES(2018, 3, 1, 2, 1, 53);




/*EXTRACT*/
SELECT sem_num, EXTRACT (Month from start_date)
FROM SEMESTER_DIM
WHERE start_date BETWEEN TO_DATE('02/Feb/2018') AND TO_DATE('02/JUL/2018');

SELECT sem_num, EXTRACT (Month from end_date)
FROM SEMESTER_DIM
WHERE start_date BETWEEN TO_DATE('03/JUL/2018') AND TO_DATE('13/NOV/2018');

/*FILTER Committees*/
CREATE VIEW STUDENTS_VIEW AS
Select f.year_year, f.month_month, r.res_descript, e.event_description, s.student_fname,s.student_lname, f.total_students_in_res
FROM STUDENTS_FACT f
JOIN EVENT_DIM e
on f.event_type_code = e.event_type_code
JOIN RESIDENCE_DIM r
on f.res_code = r.res_code 
JOIN STUDENT_DIM s
on f.student_num = s.student_num;

SELECT * FROM STUDENTS_VIEW;

SELECT r.res_descript, c.committee_description, s.total_num_students
FROM STUDENT_FACT s
JOIN RESIDENCE_DIM r
on s.res_code = r.res_code
JOIN COMMITTEE_DIM c
ON s.committee_code = c.committee_code;
/*WHERE r.res_descript LIKE &res_descript;
ORDER BY committee_code DESC;*/

SELECT r.res_descript, c.committee_description, s.total_num_students
FROM STUDENT_FACT s
JOIN RESIDENCE_DIM r
on s.res_code = r.res_code
JOIN COMMITTEE_DIM c
ON s.committee_code = c.committee_code
WHERE UPPER(r.res_descript) LIKE UPPER('&res_descript');
/*ORDER BY committee_code DESC;*/

SELECT r.res_descript, c.committee_description, s.total_num_students
FROM STUDENT_FACT s
JOIN RESIDENCE_DIM r
on s.res_code = r.res_code
JOIN COMMITTEE_DIM c
ON s.committee_code = c.committee_code
WHERE UPPER(c.committee_description) LIKE UPPER('&committee_description');

SELECT res_code, committee_code, total_num_students
FROM STUDENT_FACT
WHERE committee_code = &committee_code
ORDER BY committee_code DESC;


/*SUM of STUDENTS IN RES*/
SELECT  TO_CHAR(res_code) As " RES CODE", SUM(total_num_students) AS " SumOfStudents"
From student_fact
GROUP BY TO_CHAR(res_code)
HAVING SUM(total_num_students) > 50;

SELECT  res_code, committee_code, total_num_students
FROM STUDENT_FACT
WHERE total_num_students > 10
ORDER BY  committee_code DESC;



/*SUM of STUDENTS IN RES*/
/*GROUP BY AND TO_CHAR*/
SELECT SUM(total_num_students) AS totalStudents
FROM student_fact 
Where res_code BETWEEN 1 AND 2 
GROUP By TO_CHAR(committee_code)
Order by totalStudents DESC;

SELECT SUM(total_num_students)
FROM student_fact Where res_code = 1;
SELECT SUM(total_num_students)
FROM student_fact Where res_code = 2 ;
SELECT SUM(total_num_students)
FROM student_fact Where res_code = 3 ;
SELECT SUM(total_num_students)
FROM student_fact Where res_code = 4 ;

/*Average Students <50*/
SELECT Avg(total_num_students) AS "Average studente"
From student_fact 
WHERE total_num_students > 50;

/* Studente Grooter as Average in die residence*/
SELECT  *
FROM STUDENT_FACT
WHERE total_num_students > (SELECT Avg(total_num_students) 
                         From student_fact 
                            WHERE res_code Between 1 AND 4) 
ORDER BY res_code;

/*Average of STUDENTS IN RES*/
SELECT  *
FROM STUDENT_FACT
WHERE total_num_students < (SELECT Avg(total_num_students) AS "AVERAGE STUDENTS" 
                         From student_fact 
                            WHERE res_code BETWEEN 1 AND 4 ) 
ORDER BY res_code DESC, total_num_students;

/*AVERAGE*/
SELECT  *
FROM STUDENT_FACT
WHERE res_code =1 AND total_num_students < (SELECT Avg(total_num_students) AS "AVERAGE STUDENTS" 
                         From student_fact 
                            WHERE total_num_students < 30 ) 
ORDER BY res_code DESC, total_num_students;

/*ROUND FUNCTION*/
SELECT ROUND(AVG(total_num_students)) FROM student_fact WHERE committee_code = 1;

/*COMBINATION*/
SELECT  committee_code, res_code, total_num_students 
FROM STUDENT_FACT
WHERE Committee_code =1 AND  ((SELECT sum(total_num_students) AS "Sum_committee_1"
                            FROM student_fact
                            Where committee_code =1) < (SELECT sum(total_num_students) AS "Sum_committee_2"
                                                    FROM student_fact
                                                    Where committee_code =2))
ORDER BY committee_code DESC, total_num_students;


/*MAX student*/
SELECT MAX(total_num_students) AS "Most students"
FROM STUDENT_FACT;


/*COUNT AND SUM*/
SELECT COUNT(total_students_in_res) As "Amount of Residances", SUM(total_students_in_res) As "Amount of STUDENTS"
FROM students_fact;


/*FILTER Res*/
SELECT year_year, month_month, res_code, event_type_code, student_num, total_students_in_res
FROM STUDENTS_FACT 
WHERE res_code In('3','1')
ORDER BY event_type_code ;

/*FILTER VIA MOTHS*/
SELECT  res_code, event_type_code, student_num, total_students_in_res
FROM STUDENTS_FACT 
WHERE month_month < (SELECT AVG(month_month)
                    FROM STUDENTS_FACT)
ORDER BY event_type_code ;

/*MAX Students ATTENDED EVENT between the recidence)*/
SELECT  event_type_code, res_code, tot_stu_attend_event
FROM EVENT_FACT
WHERE tot_stu_attend_event = (SELECT MAX(tot_stu_attend_event)
                            FROM EVENT_FACT
                            WHERE event_type_code In('1','2','3','4','5','6'))
ORDER BY event_type_code;

SELECT  event_type_code, res_code, tot_stu_attend_event
FROM EVENT_FACT
WHERE tot_stu_attend_event = (SELECT MIN(tot_stu_attend_event)
                            FROM EVENT_FACT
                            WHERE event_type_code In('1','2','3','4','5','6'))
ORDER BY event_type_code;

SELECT COUNT(event_type_code) AS "Amount of EVENTS"
FROM EVENT_FACT
WHERE res_code in('1', '2' , '3') ;

SELECT COUNT(event_type_code) AS "Amount of EVENTS"
FROM EVENT_FACT
WHERE res_code BETWEEN 1 AND 2 ;

SELECT event_type_code, res_code, tot_stu_attend_event
FROM EVENT_FACT
WHERE tot_stu_attend_event = (SELECT COUNT(event_type_code) AS "Amount of EVENTS"
                            FROM EVENT_FACT
                            WHERE res_code =1 );




/*MAX EVENTS ATTENDED EVENT between the recidence)*/
SELECT  event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend
FROM EVENT_FACT
WHERE tot_events_stu_attend = (SELECT MAX(tot_events_stu_attend)
                            FROM EVENT_FACT
                            WHERE event_type_code BETWEEN 1 AND 6)
ORDER BY event_type_code;



/*COUNT Committees STATEMENT*/
SELECT TO_CHAR(tot_stu_attend_event), COUNT(month_month) AS "Amount of Months"
FROM EVENT_FACT
WHERE tot_stu_attend_event = 22
GROUP BY TO_CHAR(tot_stu_attend_event)
HAVING COUNT(month_month) > 2;

/*COUNT events STATEMENT*/
SELECT COUNT(event_type_code) As amountofevents
FROM ATTENDANCE_FACT
GROUP BY res_code
HAVING COUNT(event_type_code) > 4;


/*All year 2018*/

SELECT *
FROM STUDENT_FACT
WHERE res_CODE = 1
ORDER BY Committee_Code DESC;


/*ATTENDANCE_FACT(year_year, sem_num, res_code, event_type_code, committee_code, percentage_attendance)*/
/*fILTERING Committees form sport INNER JOIN*/
SELECT ATTENDANCE_FACT.res_code, ATTENDANCE_FACT.event_type_code, ATTENDANCE_FACT.sem_num
FROM ATTENDANCE_FACT INNER JOIN STUDENT_FACT ON ATTENDANCE_FACT.res_code = STUDENT_FACT.res_code
WHERE STUDENT_FACT.committee_code = 1;


SELECT ATTENDANCE_FACT.res_code, ATTENDANCE_FACT.event_type_code, ATTENDANCE_FACT.sem_num
FROM ATTENDANCE_FACT INNER JOIN STUDENT_FACT ON ATTENDANCE_FACT.res_code = STUDENT_FACT.res_code
WHERE STUDENT_FACT.committee_code = 2;

SELECT ATTENDANCE_FACT.res_code, ATTENDANCE_FACT.event_type_code, ATTENDANCE_FACT.sem_num
FROM ATTENDANCE_FACT INNER JOIN STUDENT_FACT ON ATTENDANCE_FACT.res_code = STUDENT_FACT.res_code
WHERE STUDENT_FACT.committee_code = 3;


SELECT ATTENDANCE_FACT.res_code, ATTENDANCE_FACT.event_type_code, ATTENDANCE_FACT.sem_num
FROM ATTENDANCE_FACT INNER JOIN STUDENT_FACT ON ATTENDANCE_FACT.res_code = STUDENT_FACT.res_code
WHERE STUDENT_FACT.committee_code = 4;


/*fILTERING Committees form sport*/
SELECT res_code,event_type_code, sem_num, committee_code, percentage_attendance
FROM ATTENDANCE_FACT 
WHERE committee_code = 1
ORDER BY committee_code;

SELECT res_code,event_type_code, sem_num, committee_code, percentage_attendance
FROM ATTENDANCE_FACT 
WHERE percentage_attendance > (SELECT AVG(percentage_attendance)
                                FROM ATTENDANCE_FACT)
ORDER BY committee_code;



SELECT res_code,event_type_code, sem_num 
FROM ATTENDANCE_FACT 
WHERE committee_code = 3 
ORDER BY committee_code;


SELECT res_code,event_type_code, sem_num, committee_code
FROM ATTENDANCE_FACT 
WHERE committee_code IN ('4','5','6')
ORDER BY committee_code;


/*MAX Percentages*/
SELECT MAX(percentage_attendance) AS "Highest Attendance"
FROM ATTENDANCE_FACT
WHERE sem_num = 1
ORDER BY percentage_attendance ASC;

SELECT SUM(percentage_attendance) AS "SUM of all Attendance"
FROM ATTENDANCE_FACT
WHERE sem_num IN ('1','2')
ORDER BY percentage_attendance ASC;

SELECT *
FROM ATTENDANCE_FACT
WHERE (Percentage_attendance = 1) AND (Committee_code= 1);

/*VIEW STATEMENTS*/
CREATE VIEW ATTENDANCE_VIEW AS
Select  sem_num, res_code, event_type_code, committee_code, percentage_attendance
FROM ATTENDANCE_FACT;

SELECT * FROM ATTENDANCE_VIEW;

CREATE VIEW STUDENT_VIEW AS
Select  year_year, committee_code, res_code, total_num_students
FROM STUDENT_FACT;

SELECT * FROM STUDENT_VIEW;


CREATE VIEW STUDENTS_VIEW AS
Select year_year, month_month, res_code, event_type_code, student_num, total_students_in_res
FROM STUDENTS_FACT;

SELECT * FROM STUDENTS_VIEW;

/*UPDATES*/
UPDATE STUDENTS_FACT
SET year_year= &year_year , month_month= &month_month , res_code = &res_code, event_type_code = &event_type_code, student_num =&student_num, total_students_in_res=&total_students_in_res
where month_month = &month_month;

UPDATE STUDENT_FACT
SET year_year =&year_year, committee_code=&committee_code, res_code=&res_code, total_num_students=&total_num_students
where month_month = 3;

UPDATE ATTENDANCE_FACT
SET sem_num= &sem_num, res_code= &res_code, event_type_code=&event_type_code, committee_code=&committee_code, percentage_attendance=&percentage_attendance
where event_type_code = 3;