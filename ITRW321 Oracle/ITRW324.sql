                DROP TABLE COMMITTEE;
                DROP TABLE SEMESTER_DATE;
                DROP TABLE RESIDENCE;
                DROP TABLE CAMPUS;
                DROP TABLE EVENT;
                DROP TABLE STUDENT;
                Drop Table Attendance;
         
                
                DROP SEQUENCE committee_committee_code_seq;
                DROP SEQUENCE sem_sem_num_seq;
                DROP SEQUENCE res_res_code_seq;
                DROP SEQUENCE campus_campus_code_seq;
                DROP SEQUENCE event_type_event_type_code_seq;
                DROP SEQUENCE student_student_num_seq;
                
               /* campus
                residendce
                coommitee
            semester date
            event
            student
            atendance*/
            CREATE TABLE CAMPUS(
                campus_code NUMBER(6) CONSTRAINT campus_campus_code PRIMARY KEY,
                campus_description VARCHAR(20));
                
        CREATE TABLE RESIDENCE(
                res_code NUMBER(6) CONSTRAINT res_res_code PRIMARY KEY,
                campus_code NUMBER(6) CONSTRAINT camp_cd REFERENCES CAMPUS(campus_code),
                res_descript VARCHAR(20));
                
                CREATE TABLE COMMITTEE(
                committee_code NUMBER(6) CONSTRAINT committee_committee_code71 PRIMARY KEY,
                res_code NUMBER(6) CONSTRAINT res_cod1 REFERENCES RESIDENCE(res_code),
                committee_description VARCHAR(20));
                
                CREATE TABLE SEMESTER_DATE(
                sem_num NUMBER(6) CONSTRAINT sem_sem_num PRIMARY KEY,
                start_date DATE,
                end_date DATE);
                
                
                
                
                CREATE TABLE EVENT(
                event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code PRIMARY KEY,
                sem_num NUMBER(6) CONSTRAINT sem_numb REFERENCES SEMESTER_DATE(sem_num),
                committee_code NUMBER(6) CONSTRAINT com_cd REFERENCES COMMITTEE(committee_code),                
                event_date DATE DEFAULT(SYSDATE),
                tot_stu_attend NUMBER(7),
                event_description VARCHAR(20));
                
                CREATE TABLE STUDENT(
                student_num NUMBER(6) CONSTRAINT stud_student_num PRIMARY KEY,
                res_code NUMBER(6) CONSTRAINT res_cd REFERENCES RESIDENCE(res_code),
                student_fname VARCHAR(25),
                student_lname VARCHAR(25));
                
        CREATE TABLE ATTENDANCE(
                student_num NUMBER(6) CONSTRAINT stu_num REFERENCES STUDENT(student_num),
                event_type_code NUMBER(6) CONSTRAINT type_code_ev REFERENCES EVENT(event_type_code));
                
                
                
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
                INSERT INTO COMMITTEE(committee_code,res_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL,17, 'Sport');
                
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
                INSERT INTO RESIDENCE(res_code, campus_code,res_descript)
                VALUES(res_res_code_seq.NEXTVAL,7, 'Caput');
                
                INSERT INTO RESIDENCE(res_code,campus_code, res_descript)
                VALUES(res_res_code_seq.NEXTVAL, 8,'Hombre');
                
                INSERT INTO RESIDENCE(res_code,campus_code, res_descript)
                VALUES(res_res_code_seq.NEXTVAL,9, 'Veritas');
                
                INSERT INTO RESIDENCE(res_code,campus_code, res_descript)
                VALUES(res_res_code_seq.NEXTVAL, 9,'Excelsior');
                
                
                /*Different Campus*/
                INSERT INTO CAMPUS(campus_code, campus_description)
                VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Potchefstroom');
                
                INSERT INTO CAMPUS(campus_code, campus_description)
                VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Vaal');
                
                INSERT INTO CAMPUS(campus_code, campus_description)
                VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Mafekeng');
                
                
                /*Different Semesters*/
                INSERT INTO SEMESTER_DATE(sem_num, start_date, end_date)
                VALUES(sem_sem_num_seq.NEXTVAL, TO_DATE('02/Feb/2018'), TO_DATE('02/JUL/2018'));
                
                INSERT INTO SEMESTER_DATE(sem_num, start_date, end_date)
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
                
            Insert into COMMITTEE_DIM
                SELECT committee_code,committee_description
                FROM COMMITTEE ;
              
            Insert into residence_dim
                SELECT res_code,res_descript
                FROM residence ;
                
            Insert into campus_dim
                SELECT campus.campus_code,campus.campus_description
                FROM campus ;
                
            Insert into student_dim
                SELECT student.student_num,student.student_fname,student.student_lname
                FROM student ;
                
            Insert into semester_dim
                SELECT semester_date.sem_num,semester_date.start_date,semester_date.end_date
                FROM SEMESTER_DATE ;
                
            Insert into event_dim
                SELECT event.event_type_code,event.event_description
                FROM event ;
                
                
               /* INSERT INTO ATTENDANCE_FACT(
                year_year, sem_num, res_code, event_type_code, commitee_code, PERCENTANCE_ATTENDANCE*/
                
              /* INSERT INTO EVENT_TYPE_FACT(
               f.year_year, s.sem_num, c.campus_code, f.event_type_code, f.TOTAL_EVENTS)
               SELECT s.sem_num, EXTRACT(YEAR FROM s.start_date)
               FROM EVENT f 
               JOIN SEMESTER_DATE s 
               on f.sem_num = s.sem_num
               JOIN CAMPUS c
               on f.campus_code = c.campus_code;*/
               
               
               INSERT INTO EVENT_TYPE_FACT(
               e.year_year, 
               s.sem_num, c.campus,
               e.event_type_code, e.TOTAL_EVENTS)
               select 
                extract(year from s.start_date),
                s.sem_num,c.campus_code,e.event_type_code,
                COUNT(e.event_type_code)
               FROM EVENT e 
               JOIN SEMESTER_DATE s
               on e.sem_num = s.sem_num
               JOIN CAMPUS c
               on c.campus_code = e.campus_code;
               
               group by extract(year from s.start_date), s.start_date, s.sem_num, c.campus_code, e.event_type_code;
               
               
                INSERT INTO Quotes_Fact
        (ShaftNumber, TheYear, TheMonth, 
            TOTAL_NUMBER_QUOTES)
        SELECT
            Quotes.SHAFTNUMBER,
            EXTRACT(YEAR FROM Quotes.QUOTEDATE),
            EXTRACT(MONTH FROM Quotes.QUOTEDATE),

            INSERT INTO EVENT_FACT
                    (year_year, month_month, event_type_code, res_code, tot_stu_attend_event, tot_events_stu_attend)
                SELECT 
                    EXTRACT(year from EVENT.event_date),
                    EXTRACT(month from EVENT.event_date),
                    EVENT.event_type_code,
                    EVENT.res_code,
                    SUM(EVENT.tot_stu_attend),
                    SUM(EVENT.tot_events_stu)
            FROM EVENT
            WHERE EVENT.event_date > SYSDATE-1
                GROUP BY EVENT.event_type_code, EVENT.res_code,
                EXTRACT(year from EVENT.event_date),
                EXTRACT(month from EVENT.event_date);
            
            where event.event_description like '%S%';
            
            SELECT * from EVENT
                where event.event_description like '%S%';
               
            SELECT * from COMMITTEE
            select * from RESIDENCE
                where campus_code IS NOT NULL
            select * from campus    
            select * from event_fact