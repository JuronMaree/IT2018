        /*ERD TABLES*/
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
                 
                /*INSERT INTO ATTENDANCE*/
                INSERT INTO ATTENDANCE(student_num, event_type_code)
                VALUES(1, 1);
            
                
                 /* DIM TABLES */
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
      
                /*FACT TABLES*/
                CREATE TABLE STUDENT_FACT(
                year_year DATE,
                committee_code NUMBER(6) CONSTRAINT committee_committee_code222 REFERENCES COMMITTEE_DIM(committee_code),
                res_code NUMBER(6) CONSTRAINT res_res_code222 REFERENCES RESIDENCE_DIM(res_code),
                total_num_students NUMBER(3),PRIMARY KEY(year_year, committee_code, res_code)); 
           
              
              
               CREATE TABLE ATTENDANCE_FACT(
                year_year NUMBER(6),
                sem_num NUMBER(6) CONSTRAINT sem_sem_num111 REFERENCES SEMESTER_DIM(sem_num),
                res_code NUMBER(6) CONSTRAINT res_res_code111 REFERENCES RESIDENCE_DIM(res_code),
                event_type_code NUMBER(6) CONSTRAINT event_type_event_type_code111 REFERENCES EVENT_DIM(event_type_code),
                committee_code NUMBER(6) CONSTRAINT committee_committee_code111 REFERENCES COMMITTEE_DIM(committee_code),
                percentage_attendance NUMBER(3), PRIMARY KEY(year_year, sem_num, res_code, event_type_code, committee_code ));
                
               
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
                
                /*Triggers*/
                CREATE OR REPLACE TRIGGER ResidenceTrigger
                AFTER INSERT OR UPDATE ON RESIDENCE
                FOR EACH ROW
                BEGIN
                    UPDATE CAMPUS
                    SET campus_description = campus_description 
                    WHERE campus_code = :NEW.campus_code;
                END;
                
                CREATE OR REPLACE PROCEDURE InsertNewResidence(
                    P_res_code IN RESIDENCE.res_code%TYPE,
                    P_campus_code IN RESIDENCE.campus_code%TYPE,
                    P_res_descript IN RESIDENCE.res_descript%TYPE)
                IS
                BEGIN
                INSERT INTO RESIDENCE(res_code, campus_code,  res_descript)
                    VALUES(P_res_code, P_campus_code,  P_res_descript);
                COMMIT;
                END;
                
                BEGIN InsertNewResidence(6, 1, 'Karlien');
                END;
                
                /*SELECT*/
                /*FILTER RES*/ 
                SELECT r.res_descript, s.student_fname 
                FROM STUDENT s 
                JOIN RESIDENCE r 
                on s.res_code = r.res_code 
                WHERE UPPER(r.res_descript) LIKE UPPER('&Koshuis') 
                ORDER BY s.student_fname DESC; 
                
                /*Drop of Views*/
                drop view STUDENTS_VIEW; 
                drop view ATTENDANCE_VIEW; 
                drop view STUDENT_VIEW;
                
                
                /*CREATE VIEW*/ 
                CREATE VIEW STUDENTS_VIEW AS 
                Select f.year_year, f.month_month, r.res_descript, e.event_description, s.student_fname, s.student_lname, f.total_students_in_res 
                FROM STUDENTS_FACT f 
                JOIN EVENT  e 
                on f.event_type_code = e.event_type_code 
                JOIN RESIDENCE  r 
                on f.res_code = r.res_code  
                JOIN STUDENT s 
                on f.student_num = s.student_num; 
                 
                SELECT * FROM STUDENTS_VIEW; 
                 
                
                 
                /*VIEW STATEMENTS*/ 
                CREATE VIEW ATTENDANCE_VIEW AS 
                Select  a.year_year, a.sem_num, r.res_descript, e.event_description, c.committee_description, a.percentage_attendance 
                FROM ATTENDANCE_FACT a 
                JOIN EVENT e 
                on a.event_type_code = e.event_type_code 
                JOIN RESIDENCE r 
                on a.res_code = r.res_code  
                JOIN COMMITTEE c 
                on a.committee_code = c.committee_code; 
                 
                SELECT * FROM ATTENDANCE_VIEW; 
                 
                CREATE VIEW STUDENT_VIEW AS 
                Select  s.year_year, c.committee_description, r.res_descript, s.total_num_students 
                FROM STUDENT_FACT s 
                JOIN RESIDENCE r 
                on s.res_code = r.res_code  
                JOIN COMMITTEE c 
                on s.committee_code = c.committee_code; 
                 
                SELECT * FROM STUDENT_VIEW; 
                
                    
            /*Transactions STUDENT*/
            INSERT INTO STUDENT( student_num, res_code, student_fname, student_lname)
                VALUES ('&Student_num', '&Res_code', INITCAP('&Student_name'), INITCAP('&student_surname'));
           
                UPDATE STUDENT 
                SET student_fname= INITCAP('&New_name')  , student_lname= INITCAP('&New_Surname') 
                WHERE student_num =('&Student_num');
            COMMIT;
              
                DELETE FROM STUDENT 
                WHERE student_num =('&Student_num');   
            ROLLBACK;
        
             /*RESIDENCE*/      
            INSERT INTO RESIDENCE( res_code, campus_code, res_descript)
                VALUES ('&RESIDANCE_code', '&campus_code', INITCAP('&RESIDANCE_name'));
             
                UPDATE RESIDENCE 
                SET res_descript= INITCAP('&New_name') 
                WHERE res_code =('&RES_CODE');
            COMMIT;
              
                DELETE FROM RESIDENCE 
                WHERE res_descript = INITCAP('&RESIDANCE_name'); 
            ROLLBACK;
            
            /* COMMITTEE */
            INSERT INTO COMMITTEE( committee_code, res_code, committee_description)
                VALUES ('&COMMITTEE_code', '&Res_code', INITCAP('&COMMITTEE_name'));
             
                UPDATE COMMITTEE 
                SET committee_description= INITCAP('&New_name') 
                WHERE committee_code =('&COMMITTEE_CODE');
            COMMIT; 
              
                DELETE FROM COMMITTEE 
                WHERE committee_description = INITCAP('&COMMITTEE_name'); 
            ROLLBACK;
        
             /* EVENT */
            INSERT INTO EVENT_DIM( event_type_code, event_description)
                VALUES ('&EVENT_code', INITCAP('&EVENT_name'));
             
                UPDATE EVENT_DIM 
                SET event_description= INITCAP('&NEWEVENT_name') 
                WHERE event_type_code =('&EVENT_code');
            COMMIT; 
              
                DELETE FROM EVENT_DIM 
                WHERE event_description = INITCAP('&EVENT_name'); 
            ROLLBACK;
                

                