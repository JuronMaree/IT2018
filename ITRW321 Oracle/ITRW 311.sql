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
                
                
          /*INSERT*/
           /*Different Campus*/
                INSERT INTO CAMPUS(campus_code, campus_description)
                VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Potchefstroom');
                
                INSERT INTO CAMPUS(campus_code, campus_description)
                VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Vaal');
                
                INSERT INTO CAMPUS(campus_code, campus_description)
                VALUES(campus_campus_code_seq.NEXTVAL, 'NWU Mafekeng');
               
               
                /*Different Residences*/
                INSERT INTO RESIDENCE(res_code, campus_code,res_descript)
                VALUES(res_res_code_seq.NEXTVAL,1, 'Caput');
                 /*Different Residences*/
                INSERT INTO RESIDENCE(res_code, campus_code,res_descript)
                VALUES(res_res_code_seq.NEXTVAL,1, 'Caput');
                 /*Different Residences*/
                INSERT INTO RESIDENCE(res_code, campus_code,res_descript)
                VALUES(res_res_code_seq.NEXTVAL,1, 'Caput');
                 /*Different Residences*/
                INSERT INTO RESIDENCE(res_code, campus_code,res_descript)
                VALUES(res_res_code_seq.NEXTVAL,1, 'Caput');
                
                
                
                /*Different Committee*/
                INSERT INTO COMMITTEE(committee_code,res_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL,1, 'Sport');       
                 /*Different Committee*/
                INSERT INTO COMMITTEE(committee_code,res_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL,1, 'Sport');   
                 /*Different Committee*/
                INSERT INTO COMMITTEE(committee_code,res_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL,1, 'Sport');   
                 /*Different Committee*/
                INSERT INTO COMMITTEE(committee_code,res_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL,1, 'Sport');   
                 /*Different Committee*/
                INSERT INTO COMMITTEE(committee_code,res_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL,1, 'Sport');   
                 /*Different Committee*/
                INSERT INTO COMMITTEE(committee_code,res_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL,1, 'Sport');   
                 /*Different Committee*/
                INSERT INTO COMMITTEE(committee_code,res_code, committee_description)
                VALUES(committee_committee_code_seq.NEXTVAL,1, 'Sport');   
                
                
                  /*Different Semesters*/
                INSERT INTO SEMESTER_DATE(sem_num, start_date, end_date)
                VALUES(sem_sem_num_seq.NEXTVAL, TO_DATE('02/Feb/2018'), TO_DATE('02/JUL/2018'));
                
                INSERT INTO SEMESTER_DATE(sem_num, start_date, end_date)
                VALUES(sem_sem_num_seq.NEXTVAL, TO_DATE('03/JUL/2018'), TO_DATE('13/NOV/2018'));
                
                
                 
                
                  /*Different Events sport*/
                INSERT INTO EVENT(event_type_code, sem_num,committee_code,event_date, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL,1,1,TO_DATE('15/JUL/2018'), 'Hockey');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Cricket');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Rugby');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Tennis');
                
        /* INSERT INTO STUDENT*/
                
                 INSERT INTO student(student_num, res_code,student_fname,student_lname)
                VALUES(student_student_num_seq.NEXTVAL,1, 'Juron','Maree');
                 
                
                INSERT INTO ATTENDANCE(student_num, event_type_code)
                VALUES(1, 1);
            
                
                
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
                
                
          CREATE TABLE STUDENT_FACT(
                year_year DATE,
                committee_code NUMBER(6) CONSTRAINT committee_committee_code222 REFERENCES COMMITTEE_DIM(committee_code),
                res_code NUMBER(6) CONSTRAINT res_res_code222 REFERENCES RESIDENCE_DIM(res_code),
                total_num_students NUMBER(3),PRIMARY KEY(year_year, committee_code, res_code)); 
                
                INSERT INTO student_fact(year_year,committee_code,res_code,total_num_students)
                    SELECT
                        EXTRACT(YEAR FROM event.event_date),
                        committee.committee_code,
                        residence.res_code,
                        count(committee.committee_description)
                    FROM committee
                    join residence
                    on committee.res_code = residence.res_code
                    join event
                    on  committee.committee_code = event.committee_code
                    group by  EXTRACT(YEAR FROM event.event_date), committee.committee_code, residence.res_code;
                    
                /*CREATE INDEX*/
                CREATE INDEX CampusIndex
                ON CAMPUS(campus_description);
                
                CREATE INDEX ResidenceIndex
                ON RESIDENCE(res_descript);
                
                CREATE INDEX CommitteeIndex
                ON COMMITTEE(committee_description);
                
                CREATE INDEX EventIndex
                ON EVENT(event_description);
                
                CREATE UNIQUE INDEX StudentFNameIndex
                ON STUDENT(student_fname);
                
                CREATE UNIQUE INDEX StudentLNameIndex
                ON STUDENT(student_lname);
                
                /*CREATE PROCEDURES*/
                CREATE OR REPLACE PROCEDURE InsertNewCampus(
                    P_campus_code IN CAMPUS.campus_code%TYPE,
                    P_campus_description IN CAMPUS.campus_description%TYPE)
                IS
                BEGIN
                INSERT INTO CAMPUS(campus_code, campus_description)
                    VALUES(P_campus_code, P_campus_description);
                INSERT INTO CAMPUS_DIM(campus_code, campus_description)
                    VALUES(P_campus_code, P_campus_description);
                COMMIT;
                END;
                
                CREATE OR REPLACE PROCEDURE InsertNewResidence(
                    P_res_code IN RESIDENCE.res_code%TYPE,
                    P_res_descript IN RESIDENCE.res_descript%TYPE)
                IS
                BEGIN
                INSERT INTO RESIDENCE(res_code, res_descript)
                    VALUES(P_res_code, P_res_descript);
                INSERT INTO RESIDENCE_DIM(res_code,  res_descript)
                    VALUES(P_res_code, P_res_descript);
                COMMIT;
                END;
                
                CREATE OR REPLACE PROCEDURE InsertNewCommittee(
                    P_committee_code IN COMMITTEE.committee_code%TYPE,
                    P_committee_description IN COMMITTEE.committee_description%TYPE)
                IS
                BEGIN
                INSERT INTO COMMITTEE(committee_code, committee_description)
                    VALUES(P_committee_code, P_committee_description);
                INSERT INTO COMMITTEE_DIM(committee_code, committee_description)
                    VALUES(P_committee_code, P_committee_description);
                COMMIT;
                END;
                
                CREATE OR REPLACE PROCEDURE InsertNewStudent(
                    P_student_num IN STUDENT.student_num%TYPE,
                    P_student_fname IN STUDENT.student_fname%TYPE,
                    P_student_lname IN STUDENT.student_lname%TYPE)
                IS
                BEGIN
                INSERT INTO STUDENT(student_num, student_fname, student_lname)
                    VALUES(P_student_num, P_student_fname, P_student_lname);
                INSERT INTO STUDENT_DIM(student_num, student_fname, student_lname)
                    VALUES(P_student_num, P_student_fname, P_student_lname);
                COMMIT;
                END;
                /*INSERT VALUES FOR PROCEDURES*/
                BEGIN
                InsertNewCampus(campus_campus_code_seq.NEXTVAL, '&campus_description');
                END;
                
                BEGIN
                InsertNewResidence(res_res_code_seq.NEXTVAL, '&res_descript');
                END;
                
                BEGIN
                InsertNewCommittee(committee_committee_code_seq.NEXTVAL, '&committee_description');
                END;
                
                BEGIN
                InsertNewStudent(student_student_num_seq.NEXTVAL, '&student_fname', '&student_lname');
                END;
                