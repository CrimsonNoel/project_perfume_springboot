--------------------------------------------------------
--  ������ ������ - ������-8��-23-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BOARDCOMSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "KIC"."BOARDCOMSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOARDCOMSEQ2
--------------------------------------------------------

   CREATE SEQUENCE  "KIC"."BOARDCOMSEQ2"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOARDSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "KIC"."BOARDSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOARDSEQ2
--------------------------------------------------------

   CREATE SEQUENCE  "KIC"."BOARDSEQ2"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CARTSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "KIC"."CARTSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ORDERITEMSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "KIC"."ORDERITEMSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "KIC"."PRODUCTSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REVIEWNUMSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "KIC"."REVIEWNUMSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SURVEYSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "KIC"."SURVEYSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ANSWER
--------------------------------------------------------

  CREATE TABLE "KIC"."ANSWER" 
   (	"SER" NUMBER(*,0), 
	"ID" VARCHAR2(20 BYTE), 
	"ANSGENDER" NUMBER(1,0), 
	"ANS1" VARCHAR2(30 BYTE), 
	"ANS2" VARCHAR2(60 BYTE), 
	"PRODNAME" VARCHAR2(50 BYTE), 
	"RDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOARD2
--------------------------------------------------------

  CREATE TABLE "KIC"."BOARD2" 
   (	"NUM" NUMBER(*,0), 
	"BOARDID" VARCHAR2(3 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"SUBJECT" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"IMAGE" VARCHAR2(300 BYTE), 
	"REGDATE" DATE, 
	"READCNT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOARDCOMMENT2
--------------------------------------------------------

  CREATE TABLE "KIC"."BOARDCOMMENT2" 
   (	"SER" NUMBER(*,0), 
	"NUM" NUMBER(*,0), 
	"ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "KIC"."CART" 
   (	"CARTID" NUMBER(*,0), 
	"ID" VARCHAR2(20 BYTE), 
	"PRODNUM" NUMBER(*,0), 
	"PRODNAME" VARCHAR2(200 BYTE), 
	"QUANTITY" NUMBER(*,0), 
	"PRICE" NUMBER(*,0), 
	"RESULT" NUMBER(*,0), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MEMBER2
--------------------------------------------------------

  CREATE TABLE "KIC"."MEMBER2" 
   (	"ID" VARCHAR2(20 BYTE), 
	"PASS" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"GENDER" NUMBER, 
	"TEL" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(40 BYTE), 
	"ZIPCODE" VARCHAR2(10 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"RDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ORDER2
--------------------------------------------------------

  CREATE TABLE "KIC"."ORDER2" 
   (	"ORDERNUM" VARCHAR2(50 BYTE), 
	"ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"TEL" VARCHAR2(20 BYTE), 
	"ZIPCODE" VARCHAR2(10 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"DETAILADDRESS" VARCHAR2(100 BYTE), 
	"RESULT" NUMBER(*,0), 
	"DELIVERCOST" NUMBER(*,0), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ORDERITEM
--------------------------------------------------------

  CREATE TABLE "KIC"."ORDERITEM" 
   (	"ODITEMNUM" NUMBER(*,0), 
	"ORDERNUM" VARCHAR2(50 BYTE), 
	"PRODNUM" NUMBER(*,0), 
	"QUANTITY" NUMBER(*,0), 
	"PRICE" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRODREVIEW
--------------------------------------------------------

  CREATE TABLE "KIC"."PRODREVIEW" 
   (	"REVIEWNUM" NUMBER(*,0), 
	"PRODNUM" NUMBER(*,0), 
	"ID" VARCHAR2(20 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"RATING" NUMBER(*,0), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "KIC"."PRODUCT" 
   (	"PRODNUM" NUMBER(*,0), 
	"NAME" VARCHAR2(200 BYTE), 
	"PRICE" NUMBER(*,0), 
	"STOCK" NUMBER(*,0), 
	"INFO" VARCHAR2(2000 BYTE), 
	"IMAGE" VARCHAR2(200 BYTE), 
	"PRODGENDER" NUMBER, 
	"PRODANS1" VARCHAR2(20 BYTE), 
	"PRODANS2" VARCHAR2(20 BYTE), 
	"REGDATE" DATE, 
	"DETAIL" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into KIC.ANSWER
SET DEFINE OFF;
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (1,'admin',1,'fruit','strawberry','�� ���� �ν�Ʈ ü��',to_date('23/08/02','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (21,'kimkim',1,'flower','citrus','���̹��� �� �� �ѿз�',to_date('23/08/07','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (22,'kimkim',1,'flower','citrus','���̹��� �� �� �ѿз�',to_date('23/08/07','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (41,'kimkim',1,'fruit','cherry','�� ���� �ν�Ʈ ü��',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (42,'kimkim',1,'fruit','cherry','�� ���� �ν�Ʈ ü��',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (43,'kimkim',1,'fruit','cherry','�� ���� �ν�Ʈ ü��',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (44,'kimkim',1,'fruit','cherry','�� ���� �ν�Ʈ ü��',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (45,'kimkim',2,'wood','void','���̵�Ʈ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (46,'kimkim',2,'wood','void','���̵�Ʈ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (47,'kimkim',2,'wood','void','���̵�Ʈ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (48,'kimkim',2,'wood','void','���̵�Ʈ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (49,'kimkim',2,'wood','void','���̵�Ʈ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (50,'kimkim',2,'wood','void','���̵�Ʈ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (51,'kimkim',2,'wood','void','���̵�Ʈ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (52,'kimkim',2,'wood','void','���̵�Ʈ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (53,'kimkim',2,'wood','void','���̵�Ʈ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (54,'kimkim',2,'flower','citrus','������ �콺�丮����',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (55,'kimkim',1,'fruit','lemon','����� �� �ݷδϾ� ����',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (56,'kimkim',1,'fruit','lemon','����� �� �ݷδϾ� ����',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (57,'kimkim',2,'wood','pyeonbaeg','�� Ʈ���� ��� �� ���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (58,'kimkim',1,'flower','rose','�� ���� �� �� ��Ǿ',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (59,'kimkim',1,'flower','rose','�� ���� �� �� ��Ǿ',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (60,'kimkim',1,'wood','void','������Ǿ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (61,'kimkim',1,'wood','void','������Ǿ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (62,'admin',2,'flower','lavender','�ε��콺�丮���� �� �� �ѿз�',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (63,'admin',2,'flower','lavender','�ε��콺�丮���� �� �� �ѿз�',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (64,'admin',2,'flower','lavender','�ε��콺�丮���� �� �� �ѿз�',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (65,'admin',2,'flower','citrus','������ �콺�丮����',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (66,'admin',2,'flower','citrus','������ �콺�丮����',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (67,'admin',1,'wood','void','������Ǿ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (68,'admin',1,'wood','void','������Ǿ ���̵���',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (69,'test',2,'wood','void','���̵�Ʈ ���̵���',to_date('23/08/17','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (70,'kimkim',2,'fruit','strawberry','�� ���� �� �� ��Ǿ',to_date('23/08/17','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (71,'youyou',2,'fruit','lemon','���̿��� �� �� ��Ǿ',to_date('23/08/22','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (72,'youyou',1,'fruit','lemon','����� �� �ݷδϾ� ����',to_date('23/08/22','RR/MM/DD'));
REM INSERTING into KIC.BOARD2
SET DEFINE OFF;
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (1,'1','admin','��������01','��������01',null,to_date('23/08/02','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (2,'1','admin','��������02','��������02',null,to_date('23/08/02','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (3,'1','admin','��������03','��������03',null,to_date('23/08/02','RR/MM/DD'),2);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (4,'1','admin','��������04','��������04',null,to_date('23/08/02','RR/MM/DD'),2);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (35,'1','admin','123','123','Creeper-icon.png',to_date('23/08/17','RR/MM/DD'),2);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (26,'2','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (24,'1','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (27,'2','admin','123123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (28,'2','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (29,'2','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (30,'2','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (31,'2','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (33,'1','admin','123','123','Creeper-icon.png',to_date('23/08/14','RR/MM/DD'),12);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (34,'2','admin','123','123','����2.jpg',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (36,'1','admin','�������� PPT��','���������Դϴ�. Ȯ���Ͻð� ��� �޾��ּ���.','���.png',to_date('23/08/22','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (37,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (38,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (39,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (40,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (41,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (42,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (43,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (44,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (45,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (46,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (47,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (48,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (49,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (50,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (51,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (52,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (53,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (54,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (55,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (56,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (57,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (58,'1','admin','123','123',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (59,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (60,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (61,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (62,'1','admin','�������� �ø���','�������� �ø���',' ',to_date('23/08/23','RR/MM/DD'),0);
REM INSERTING into KIC.BOARDCOMMENT2
SET DEFINE OFF;
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (14,33,'kimkim','�����','123213',to_date('23/08/16','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (16,35,'youyou','���缮','124124124',to_date('23/08/18','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (15,35,'youyou','���缮','123',to_date('23/08/18','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (17,4,'admin','������','124214214',to_date('23/08/22','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (18,36,'admin','������','Ȯ��',to_date('23/08/22','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (19,36,'youyou','���缮','Ȯ���̿�',to_date('23/08/22','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (20,36,'kimkim','�����','����',to_date('23/08/22','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (22,36,'test02','1234','��� ����',to_date('23/08/23','RR/MM/DD'));
REM INSERTING into KIC.CART
SET DEFINE OFF;
Insert into KIC.CART (CARTID,ID,PRODNUM,PRODNAME,QUANTITY,PRICE,RESULT,REGDATE) values (84,'youyou',122,'���̵�Ʈ ���̵���',3,59000,1,to_date('23/08/23','RR/MM/DD'));
Insert into KIC.CART (CARTID,ID,PRODNUM,PRODNAME,QUANTITY,PRICE,RESULT,REGDATE) values (85,'youyou',121,'������Ǿ ���̵���',3,59000,1,to_date('23/08/23','RR/MM/DD'));
REM INSERTING into KIC.MEMBER2
SET DEFINE OFF;
Insert into KIC.MEMBER2 (ID,PASS,NAME,GENDER,TEL,EMAIL,ZIPCODE,ADDRESS,RDATE) values ('admin','admin','������',1,'010','010',null,null,to_date('23/07/25','RR/MM/DD'));
Insert into KIC.MEMBER2 (ID,PASS,NAME,GENDER,TEL,EMAIL,ZIPCODE,ADDRESS,RDATE) values ('parkpark','park','������',1,'019','123123',null,null,to_date('23/07/25','RR/MM/DD'));
Insert into KIC.MEMBER2 (ID,PASS,NAME,GENDER,TEL,EMAIL,ZIPCODE,ADDRESS,RDATE) values ('kimkim','kim','�����',1,'010','123123',null,null,to_date('23/07/25','RR/MM/DD'));
Insert into KIC.MEMBER2 (ID,PASS,NAME,GENDER,TEL,EMAIL,ZIPCODE,ADDRESS,RDATE) values ('youyou','you','���缮',1,'010100','10101010',null,null,to_date('23/07/25','RR/MM/DD'));
Insert into KIC.MEMBER2 (ID,PASS,NAME,GENDER,TEL,EMAIL,ZIPCODE,ADDRESS,RDATE) values ('test01','1234','Ż�� �׽�Ʈ��1',1,'010','010','13529','��� ������ �д籸 �Ǳ����� 166',to_date('23/08/23','RR/MM/DD'));
REM INSERTING into KIC.ORDER2
SET DEFINE OFF;
Insert into KIC.ORDER2 (ORDERNUM,ID,NAME,TEL,ZIPCODE,ADDRESS,DETAILADDRESS,RESULT,DELIVERCOST,REGDATE) values ('kimkim_20230823134843','kimkim','�����','010','13529','��� ������ �д籸 �Ǳ����� 166','101�� 101ȣ',5,0,to_date('23/08/23','RR/MM/DD'));
Insert into KIC.ORDER2 (ORDERNUM,ID,NAME,TEL,ZIPCODE,ADDRESS,DETAILADDRESS,RESULT,DELIVERCOST,REGDATE) values ('youyou_20230823135006','youyou','���缮','010100','13529','��� ������ �д籸 �Ǳ����� 166','101�� 101ȣ',5,0,to_date('23/08/23','RR/MM/DD'));
Insert into KIC.ORDER2 (ORDERNUM,ID,NAME,TEL,ZIPCODE,ADDRESS,DETAILADDRESS,RESULT,DELIVERCOST,REGDATE) values ('admin_20230823122910','admin','������','010','13529','��� ������ �д籸 �Ǳ����� 166','123123',1,2500,to_date('23/08/23','RR/MM/DD'));
Insert into KIC.ORDER2 (ORDERNUM,ID,NAME,TEL,ZIPCODE,ADDRESS,DETAILADDRESS,RESULT,DELIVERCOST,REGDATE) values ('kimkim_20230823134552','kimkim','�����','010','13529','��� ������ �д籸 �Ǳ����� 166','101�� 101ȣ',5,0,to_date('23/08/23','RR/MM/DD'));
REM INSERTING into KIC.ORDERITEM
SET DEFINE OFF;
Insert into KIC.ORDERITEM (ODITEMNUM,ORDERNUM,PRODNUM,QUANTITY,PRICE) values (104,'kimkim_20230823134843',44,10,10000);
Insert into KIC.ORDERITEM (ODITEMNUM,ORDERNUM,PRODNUM,QUANTITY,PRICE) values (105,'youyou_20230823135006',122,1,59000);
Insert into KIC.ORDERITEM (ODITEMNUM,ORDERNUM,PRODNUM,QUANTITY,PRICE) values (102,'admin_20230823122910',42,1,100);
Insert into KIC.ORDERITEM (ODITEMNUM,ORDERNUM,PRODNUM,QUANTITY,PRICE) values (103,'kimkim_20230823134552',122,3,59000);
REM INSERTING into KIC.PRODREVIEW
SET DEFINE OFF;
Insert into KIC.PRODREVIEW (REVIEWNUM,PRODNUM,ID,CONTENT,RATING,REGDATE) values (18,122,'kimkim','�̰��� �ſ� ����.',4,to_date('23/08/23','RR/MM/DD'));
Insert into KIC.PRODREVIEW (REVIEWNUM,PRODNUM,ID,CONTENT,RATING,REGDATE) values (19,122,'youyou','�̰��� �������.',1,to_date('23/08/23','RR/MM/DD'));
REM INSERTING into KIC.PRODUCT
SET DEFINE OFF;
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (111,'�� ���� �� �� ��Ǿ',225000,100,'���ะ �ո񿡼� ������ ü���� ���ݸ�, ���̾� �Ǻ�ó�� ��� ���̸����� ������ �����','ü��.jpg',2,'fruit','cherry',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (112,'��Ÿ�� ��ν� �� ��� �ڷ�',85800,100,'�����ƿ� �ڸ��� ũ�� �߶� �ٻ�Ϳ� �Բ� ��Ű�� ���� ������','������.jpg',1,'fruit','peach',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (113,'ĵ�� �÷η� �� �� �ѿз�',113600,100,'���� Ĭ���Ͽ� ����� �ö� ����ó��, �ε巴�� �����ϴ� ������','����.jpg',1,'fruit','strawberry',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (114,'���̿��� �� �� ��Ǿ',79000,100,'����߶��� ����, ������� ����ó�� �����ϰ� ������ ����','����.jpg',2,'fruit','strawberry',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (115,'����� �� �ݷδϾ� ����',157950,100,'����� ������� ���������� ��¦ ����� ���λ� ��Ʈ�� ������ ���','����.jpg',1,'fruit','lemon',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (116,'����� ���ø� �� �� ��Ǿ',285000,100,'ûû�� ������, ��Ȧ�� ���� �Ʒ��� ������ �޿�� ������ Ǫ����','����.jpg',2,'fruit','lemon',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (117,'�� Ʈ���� ��� �� ���',185000,100,'�Ϸ��̴� �ٴҶ�� ���볢�� ������� ������� ���̷� õõ�� ������ ����Ʈ-��� ��','��鳪��.jpg',2,'wood','pyeonbaeg',to_date('23/07/25','RR/MM/DD'),'������.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (118,'���� ���� ���',131000,100,'���ν� �޻� �ӿ��� �Ŀ���ϰ� ������ ����� ���޿���� ��� ���������� ���','���޿��.jpg',1,'wood','sandal',to_date('23/07/25','RR/MM/DD'),'������.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (119,'�˹� �� ����',157950,100,'���ٶ��� ��鸮�� �ҳ��� �������� ������ �ְ� ������ ��ũ�� ���','�ҳ���.jpg',1,'wood','sonamu',to_date('23/07/25','RR/MM/DD'),'������.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (120,'���κ���',68600,100,'�Ϸ��̴� �ٴ� ���� �帮���� �Ķ� �ҳ����� ���ٸ��� �����, �޾����� ���','�ҳ���.jpg',2,'wood','sonamu',to_date('23/07/25','RR/MM/DD'),'������.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (121,'������Ǿ ���̵���',59000,100,'Ǫ���� �ٵ��� ����� ������ ������ ���̷� �Ҿ���� ������ ����� ����','���̵���.jpg',1,'wood','void',to_date('23/07/25','RR/MM/DD'),'������.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (122,'���̵�Ʈ ���̵���',59000,96,'�ڽ����� ������ ���� ��޽�����鼭�� ����� �̹����� �����ϸ�, ���̽� ��Ʈ�� �ô�������� �����ϰ� ������ ������ �����մϴ�','�� ���̵���.jpg',2,'wood','void',to_date('23/07/25','RR/MM/DD'),'������.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (43,'�׽�Ʈ2',2500,100,'100','����1.jpg',2,'flower','lilac',to_date('23/08/23','RR/MM/DD'),'�ɻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (44,'�׽�Ʈ3',10000,90,'100','����1.jpg',1,'flower','lilac',to_date('23/08/23','RR/MM/DD'),'�ɻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (102,'�̼� �� �� �� ��Ǿ',127000,100,'���� �¿� ���� ��鳪�� ��, �� ���� ����ȭ�� ���� ȭ��','����-����-���.jpg',1,'wood','pyeonbaeg',to_date('23/07/25','RR/MM/DD'),'�̼� �� ���� ��Ǿ.png');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (100,'������ �콺�丮����',125000,100,'��ŭ�� �ڸ� �⿡ ������ �ɰ� �������� ��ȭ�� �̷�� �������� �������� ������ ��Ʈ���� ��','����-��-��Ʈ����.jpg',2,'flower','citrus',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (101,'�����޽� ��Ż �����̾�',108000,100,'���ν� �޻� �ӿ��� �Ŀ���ϰ� ������ ����� ���޿���� ��� ���������� ���','����-����-���޿��.jpg',2,'wood','sandal',to_date('23/07/25','RR/MM/DD'),'�̼� �� ���� ��Ǿ.png');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (103,'�������� �� ������',174000,100,'�ÿ��� ���͸� �׸� ��Ʈ�� ���������� ���ÿ� �Ŀ�����ϰ� ������ ���϶� ���� ���� �ε巴�� �Ǻθ� ���ο�','����-��-���϶�.jpg',1,'flower','lilac',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (104,'�� ���� �ν�Ʈ ü��',100100,100,'���̽��� ��ũ�ϸ鼭 �ε巯�� ����Ʈ, ������ ������ ������ ü����� ������ �Ƹ�� ������ ����� ���� �� �����鼭�� ������ ���� ���ϼ��� ���','����-����-ü��.jpg',1,'fruit','cherry',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (105,'�ε��콺�丮���� �� �� �ѿз�',182800,100,'���� �ٶ��� ������ �þ����� ���Ϳ�����, ��Ʈ, ������� ���������� ������ ���� �ǵ�� ������','�󺥴�.jpg',2,'flower','lavender',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (106,'�� ���� �� �� ��Ǿ',215800,100,'����� �ٹ߿��� �Ǿ������ ����� ���� ����� ������ ����','���.jpg',1,'flower','rose',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (107,'�� ���� �� �� �ѿз�',135800,100,'���� ����� ���̽�Ʈ ���� ����� ���, �̱׷��� ����','���.jpg',2,'flower','rose',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (108,'�� �� �׶� �� �� �ѿз�',80000,100,'���̿÷��� ���϶��� ����� �⿬���� �︮��Ʈ������ ���ξȴ� ������','���϶�.jpg',2,'flower','lilac',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (109,'�ʹٳ� ����ġ �׷���',63000,100,'�����  �󺥴� ���� ���� �� ���� ��ũ�� ǥ���� ����Ŀ','�� �󺥴�.jpg',1,'flower','lavender',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (110,'���̹��� �� �� �ѿз�',42000,100,'�����ִ� ������ �ε巯�� ���-��Ʈ����ǳ �����','��Ʈ����.jpg',1,'flower','citrus',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
