                DROP TABLE COMMITTEE;
                DROP TABLE SEMESTER_DATE;
                DROP TABLE RESIDENCE;
                DROP TABLE CAMPUS;
                DROP TABLE EVENT;
                DROP TABLE STUDENT;
                
                 DROP SEQUENCE committee_committee_code_seq;
                DROP SEQUENCE sem_sem_num_seq;
                DROP SEQUENCE res_res_code_seq;
                DROP SEQUENCE campus_campus_code_seq;
                DROP SEQUENCE event_type_event_type_code_seq;
                DROP SEQUENCE student_student_num_seq;
                
                
        CREATE TABLE COMMITTEE(
                committee_code NUMBER(6) CONSTRAINT committee_committee_code1 PRIMARY KEY,
                committee_description VARCHAR(20));
                
                CREATE TABLE SEMESTER_DATE(
                sem_num NUMBER(6) CONSTRAINT sem_sem_num PRIMARY KEY,
                start_date DATE,
                end_date DATE);
                
                CREATE TABLE RESIDENCE(
                res_code NUMBER(6) CONSTRAINT res_res_code PRIMARY KEY,
                res_descript VARCHAR(20));
                
                CREATE TABLE CAMPUS(
                campus_code NUMBER(6) CONSTRAINT campus_campus_code PRIMARY KEY,
                campus_description VARCHAR(20));
                
                CREATE TABLE EVENT(
                event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code PRIMARY KEY,
                event_description VARCHAR(20));
                
                CREATE TABLE STUDENT(
                student_num NUMBER(6) CONSTRAINT stud_student_num PRIMARY KEY,
                student_fname VARCHAR(25),
                student_lname VARCHAR(25));
                
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
                INSERT INTO COMMITTEE(committee_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL, 'Sport');
                
                INSERT INTO COMMITTEE(committee_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL, 'Werwing');
                
                INSERT INTO COMMITTEE(committee_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL, 'Social');
                
                INSERT INTO COMMITTEE(committee_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL, 'Kulture');
                
                INSERT INTO COMMITTEE(committee_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL, 'SJGD');
                
                INSERT INTO COMMITTEE(committee_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL, 'RAG');
                
                INSERT INTO COMMITTEE(committee_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL, 'Academic');
                
                
                
                /*Different Residences*/
                INSERT INTO RESIDENCE(res_code, res_descript)
                VALUES(res_res_code_seq.NEXTVAL, 'Caput');
                
                INSERT INTO RESIDENCE(res_code, res_descript)
                VALUES(res_res_code_seq.NEXTVAL, 'Hombre');
                
                INSERT INTO RESIDENCE(res_code, res_descript)
                VALUES(res_res_code_seq.NEXTVAL, 'Veritas');
                
                INSERT INTO RESIDENCE(res_code, res_descript)
                VALUES(res_res_code_seq.NEXTVAL, 'Excelsior');
                
                
                /*Different Campus*/
                INSERT INTO CAMPUS(campus_code, campus_description)
                VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Potchefstroom');
                
                INSERT INTO CAMPUS(campus_code, campus_description)
                VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Vaal');
                
                INSERT INTO CAMPUS(campus_code, campus_description)
                VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Mafekeng');
                
                
                /*Different Semesters*/
                INSERT INTO SEMESTER(sem_num, start_date, end_date)
                VALUES(sem_sem_num_seq.NEXTVAL, TO_DATE('02/Feb/2018'), TO_DATE('02/JUL/2018'));
                
                INSERT INTO SEMESTER(sem_num, start_date, end_date)
                VALUES(sem_sem_num_seq.NEXTVAL, TO_DATE('03/JUL/2018'), TO_DATE('13/NOV/2018'));
                
                
                /*Different Student info*/
                INSERT INTO STUDENT(student_num, student_fname, student_lname)
                VALUES(student_student_num_seq.NEXTVAL, 'Juron', 'Maree');
                
                INSERT INTO STUDENT(student_num, student_fname, student_lname)
                VALUES(student_student_num_seq.NEXTVAL, 'Jan', 'Lous');
                
                INSERT INTO STUDENT(student_num, student_fname, student_lname)
                VALUES(student_student_num_seq.NEXTVAL, 'Martin', 'Jacobs');
                
                INSERT INTO STUDENT(student_num, student_fname, student_lname)
                VALUES(student_student_num_seq.NEXTVAL, 'Pieter', 'Brits');
                
                INSERT INTO STUDENT(student_num, student_fname, student_lname)
                VALUES(student_student_num_seq.NEXTVAL, 'Steven', 'Herbs');
                
                INSERT INTO STUDENT(student_num, student_fname, student_lname)
                VALUES(student_student_num_seq.NEXTVAL, 'Levi', 'Goerge');
                
                INSERT INTO STUDENT(student_num, student_fname, student_lname)
                VALUES(student_student_num_seq.NEXTVAL, 'Len', 'PC');
                
                /*Different Events sport*/
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Hockey');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Cricket');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Rugby');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Tennis');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Squash');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Soccer');
                
                /*Different Events werwing*/
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Residence tours');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Residence Open day');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Residence stall');
                
                /*Different Events Social*/
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'FatherSon weekend');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Engagement social');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Marriage social');
                
                /*Different Events Kulture*/
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Ser');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Play');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Debate');
                
                /*Different Events SJGD*/
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Barfoot day');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'School socials');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Can food day');
                
                /*Different Events RAG*/
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'RAG float');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Fin RAG');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'RAG games');
                
                /*Different Events Academic*/
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Spelling-B');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Academic night');
                
                
/* DROP
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
                DROP VIEW STUDENTS_VIEW ;
                DROP VIEW ATTENDANCE_VIEW ;
                DROP VIEW STUDENT_VIEW ;
                */

/* CREATE TABLES */
                /* DIM */
                CREATE TABLE COMMITTEE_DIM(
                committee_code NUMBER(6) CONSTRAINT committee_committee_code11 PRIMARY KEY,
                committee_description VARCHAR(20));
                
                CREATE TABLE SEMESTER_DIM(
                sem_num NUMBER(6) CONSTRAINT sem_sem_num11 PRIMARY KEY,
                start_date DATE,
                end_date DATE);
                
                CREATE TABLE RESIDENCE_DIM(
                res_code NUMBER(6) CONSTRAINT res_res_code11 PRIMARY KEY,
                res_descript VARCHAR(20));
                
                CREATE TABLE CAMPUS_DIM(
                campus_code NUMBER(6) CONSTRAINT campus_campus_code11 PRIMARY KEY,
                campus_description VARCHAR(20));
                
                CREATE TABLE EVENT_DIM(
                event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code11 PRIMARY KEY,
                event_description VARCHAR(20));
                
                CREATE TABLE STUDENT_DIM(
                student_num NUMBER(6) CONSTRAINT stud_student_num11 PRIMARY KEY,
                student_fname VARCHAR(25),
                student_lname VARCHAR(25));
                
                
/* FACT */
                CREATE TABLE ATTENDANCE_FACT(
                year_year NUMBER(6),
                sem_num NUMBER(6) CONSTRAINT sem_sem_num111 REFERENCES SEMESTER_DIM(sem_num),
                res_code NUMBER(6) CONSTRAINT res_res_code111 REFERENCES RESIDENCE_DIM(res_code),
                event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code111 REFERENCES EVENT_DIM(event_type_code),
                committee_code NUMBER(6) CONSTRAINT committee_committee_code111 REFERENCES COMMITTEE_DIM(committee_code),
                percentage_attendance NUMBER(3), PRIMARY KEY(year_year, sem_num, res_code, event_type_code, committee_code ));
                
                CREATE TABLE STUDENT_FACT(
                year_year NUMBER(4),
                committee_code NUMBER(6) CONSTRAINT committee_committee_code22 REFERENCES COMMITTEE_DIM(committee_code),
                res_code NUMBER(6) CONSTRAINT res_res_code22 REFERENCES RESIDENCE_DIM(res_code),
                total_num_students NUMBER(3),PRIMARY KEY(year_year, committee_code, res_code));
                
                CREATE TABLE EVENT_TYPE_FACT(
                year_year NUMBER(6),
                sem_num NUMBER(6) CONSTRAINT sem_sem_num33 REFERENCES SEMESTER_DIM(sem_num),
                campus_code NUMBER(6) CONSTRAINT campus_campus_code33 REFERENCES CAMPUS_DIM(campus_code),
                event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code33 REFERENCES EVENT_DIM(event_type_code),
                total_events NUMBER(4), PRIMARY KEY(year_year, sem_num, campus_code, event_type_code));
                
                CREATE TABLE EVENT_FACT(
                year_year NUMBER(6),
                month_month NUMBER(6),
                event_type_code NUMBER(6) CONSTRAINT type_code44 REFERENCES EVENT_DIM(event_type_code),
                res_code NUMBER(6) CONSTRAINT res_res_code44 REFERENCES RESIDENCE_DIM(res_code),
                tot_stu_attend_event NUMBER(6),
                tot_events_stu_attend NUMBER(3),PRIMARY KEY(year_year, month_month,event_type_code,res_code));
                
                CREATE TABLE STUDENTS_FACT(
                year_year NUMBER(6) ,
                month_month NUMBER(6),
                res_code NUMBER(6) CONSTRAINT res_res_code55 REFERENCES RESIDENCE_DIM(res_code),
                event_type_code NUMBER(6) CONSTRAINT ent_type_ev_type_c55 REFERENCES EVENT_DIM(event_type_code),
                student_num NUMBER(6) CONSTRAINT stnt_student_num55 REFERENCES STUDENT_DIM(student_num),
                total_students_in_res NUMBER(3),PRIMARY KEY(year_year, month_month, res_code, event_type_code, student_num));
                
                
