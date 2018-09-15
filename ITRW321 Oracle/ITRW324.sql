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
DROP TABLE STUDENT_FACT;
DROP SEQUENCE committee_committee_code_seq;
DROP SEQUENCE sem_sem_num_seq;
DROP SEQUENCE res_res_code_seq;
DROP SEQUENCE campus_campus_code_seq;
DROP SEQUENCE event_type_event_type_code_seq;
DROP SEQUENCE student_student_num_seq;

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
res_decription VARCHAR(20));

CREATE TABLE CAMPUS_DIM(
campus_code NUMBER(6) CONSTRAINT campus_campus_code PRIMARY KEY,
campus_description VARCHAR(20));

CREATE TABLE EVENT_DIM(
event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code PRIMARY KEY,
event_description VARCHAR(20));

CREATE TABLE STUDENT_DIM(
student_num NUMBER(6) CONSTRAINT student_student_num PRIMARY KEY,
student_fname VARCHAR(25),
student_lname VARCHAR(25));


/* FACT */
CREATE TABLE ATTENDANCE_FACT(
year_year NUMBER(6) CONSTRAINT year_year PRIMARY KEY,
sem_num NUMBER(6) CONSTRAINT sem_sem_num1 REFERENCES SEMESTER_DIM(sem_num),
res_code NUMBER(6) CONSTRAINT res_res_code1 REFERENCES RESIDENCE_DIM(res_code),
event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code1 REFERENCES EVENT_DIM(event_type_code),
committee_code NUMBER(6) CONSTRAINT committee_committee_code1 REFERENCES COMMITTEE_DIM(committee_code),
percentage_attendance NUMBER(3));

CREATE TABLE STUDENT_FACT(
year_year NUMBER(4) CONSTRAINT year_year2 PRIMARY KEY,
committee_code NUMBER(6) CONSTRAINT committee_committee_code2 REFERENCES COMMITTEE_DIM(committee_code),
res_code NUMBER(6) CONSTRAINT res_res_code2 REFERENCES RESIDENCE_DIM(res_code),
total_num_students NUMBER(3));

CREATE TABLE EVENT_TYPE_FACT(
year_year NUMBER(6) CONSTRAINT year_year3 PRIMARY KEY,
sem_num NUMBER(6) CONSTRAINT sem_sem_num3 REFERENCES SEMESTER_DIM(sem_num),
campus_code NUMBER(6) CONSTRAINT campus_campus_code3 REFERENCES CAMPUS_DIM(campus_code),
event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code3 REFERENCES EVENT_DIM(event_type_code),
total_events NUMBER(4));

CREATE TABLE EVENT_FACT(
year_year NUMBER(6) ,
month_month NUMBER(6)  ,
event_type_code NUMBER(6) CONSTRAINT type_code4 REFERENCES EVENT_DIM(event_type_code),
res_code NUMBER(6) CONSTRAINT res_res_code4 REFERENCES RESIDENCE_DIM(res_code),
total_num_students_att_ev NUMBER(6),
total_events_students_att NUMBER(3),PRIMARY KEY(year_year, month_month));

CREATE TABLE STUDENTS_FACT(
year_year NUMBER(6) ,
month_month NUMBER(6),
res_code NUMBER(6) CONSTRAINT res_res_code5 REFERENCES RESIDENCE_DIM(res_code),
event_type_code NUMBER(6) CONSTRAINT ent_type_ev_type_c REFERENCES EVENT_DIM(event_type_code),
student_num NUMBER(6) CONSTRAINT stnt_student_num5 REFERENCES STUDENT_DIM(student_num),
total_students_in_res NUMBER(3),PRIMARY KEY(year_year, month_month));


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
INSERT INTO RESIDENCE_DIM(res_code, res_description)
VALUES(res_res_code_seq.NEXTVAL, 'Caput');

INSERT INTO RESIDENCE_DIM(res_code, res_description)
VALUES(res_res_code_seq.NEXTVAL, 'Hombre');

INSERT INTO RESIDENCE_DIM(res_code, res_description)
VALUES(res_res_code_seq.NEXTVAL, 'Veritas');

INSERT INTO RESIDENCE_DIM(res_code, res_description)
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
INSERT INTO STUDENT_DIM(student_num, student_fname, student_name)
VALUES(student_student_num_seq.NEXTVAL, 'Juron', 'Maree');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_name)
VALUES(student_student_num_seq.NEXTVAL, 'Jan', 'Lous');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_name)
VALUES(student_student_num_seq.NEXTVAL, 'Martin', 'Jacobs');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_name)
VALUES(student_student_num_seq.NEXTVAL, 'Pieter', 'Brits');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_name)
VALUES(student_student_num_seq.NEXTVAL, 'Steven', 'Herbs');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_name)
VALUES(student_student_num_seq.NEXTVAL, 'Levi', 'Goerge');

INSERT INTO STUDENT_DIM(student_num, student_fname, student_name)
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
VALUES(event_type_event_type_code_seq.NEXTVAL, 'Father and son weekend');

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
VALUES(2018, 1, 4, 3, 2, 0.4);
