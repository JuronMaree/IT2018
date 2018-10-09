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
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Hockey');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Cricket');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Rugby');
                
                INSERT INTO EVENT(event_type_code, event_description)
                VALUES(event_type_event_type_code_seq.NEXTVAL, 'Tennis');
                
                
            
                
                