--------------------------------------------------------
--  파일이 생성됨 - 수요일-8월-23-2023   
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
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (1,'admin',1,'fruit','strawberry','톰 포드 로스트 체리',to_date('23/08/02','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (21,'kimkim',1,'flower','citrus','에이버리 오 드 뚜왈렛',to_date('23/08/07','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (22,'kimkim',1,'flower','citrus','에이버리 오 드 뚜왈렛',to_date('23/08/07','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (41,'kimkim',1,'fruit','cherry','톰 포드 로스트 체리',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (42,'kimkim',1,'fruit','cherry','톰 포드 로스트 체리',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (43,'kimkim',1,'fruit','cherry','톰 포드 로스트 체리',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (44,'kimkim',1,'fruit','cherry','톰 포드 로스트 체리',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (45,'kimkim',2,'wood','void','에이딕트 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (46,'kimkim',2,'wood','void','에이딕트 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (47,'kimkim',2,'wood','void','에이딕트 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (48,'kimkim',2,'wood','void','에이딕트 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (49,'kimkim',2,'wood','void','에이딕트 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (50,'kimkim',2,'wood','void','에이딕트 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (51,'kimkim',2,'wood','void','에이딕트 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (52,'kimkim',2,'wood','void','에이딕트 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (53,'kimkim',2,'wood','void','에이딕트 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (54,'kimkim',2,'flower','citrus','프레시 헤스페리데스',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (55,'kimkim',1,'fruit','lemon','아쿠아 디 콜로니아 에바',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (56,'kimkim',1,'fruit','lemon','아쿠아 디 콜로니아 에바',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (57,'kimkim',2,'wood','pyeonbaeg','오 트리쁠 목수 성 요셉',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (58,'kimkim',1,'flower','rose','오 로즈 오 드 퍼퓸',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (59,'kimkim',1,'flower','rose','오 로즈 오 드 퍼퓸',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (60,'kimkim',1,'wood','void','오드퍼퓸 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (61,'kimkim',1,'wood','void','오드퍼퓸 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (62,'admin',2,'flower','lavender','로데헤스페리데스 오 드 뚜왈렛',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (63,'admin',2,'flower','lavender','로데헤스페리데스 오 드 뚜왈렛',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (64,'admin',2,'flower','lavender','로데헤스페리데스 오 드 뚜왈렛',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (65,'admin',2,'flower','citrus','프레시 헤스페리데스',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (66,'admin',2,'flower','citrus','프레시 헤스페리데스',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (67,'admin',1,'wood','void','오드퍼퓸 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (68,'admin',1,'wood','void','오드퍼퓸 보이드우드',to_date('23/08/14','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (69,'test',2,'wood','void','에이딕트 보이드우드',to_date('23/08/17','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (70,'kimkim',2,'fruit','strawberry','르 설리 오 드 퍼퓸',to_date('23/08/17','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (71,'youyou',2,'fruit','lemon','마이웨이 오 드 퍼퓸',to_date('23/08/22','RR/MM/DD'));
Insert into KIC.ANSWER (SER,ID,ANSGENDER,ANS1,ANS2,PRODNAME,RDATE) values (72,'youyou',1,'fruit','lemon','아쿠아 디 콜로니아 에바',to_date('23/08/22','RR/MM/DD'));
REM INSERTING into KIC.BOARD2
SET DEFINE OFF;
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (1,'1','admin','공지사항01','공지사항01',null,to_date('23/08/02','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (2,'1','admin','공지사항02','공지사항02',null,to_date('23/08/02','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (3,'1','admin','공지사항03','공지사항03',null,to_date('23/08/02','RR/MM/DD'),2);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (4,'1','admin','공지사항04','공지사항04',null,to_date('23/08/02','RR/MM/DD'),2);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (35,'1','admin','123','123','Creeper-icon.png',to_date('23/08/17','RR/MM/DD'),2);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (26,'2','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (24,'1','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (27,'2','admin','123123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (28,'2','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (29,'2','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (30,'2','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (31,'2','admin','123','123',' ',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (33,'1','admin','123','123','Creeper-icon.png',to_date('23/08/14','RR/MM/DD'),12);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (34,'2','admin','123','123','샘플2.jpg',to_date('23/08/14','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (36,'1','admin','공지사항 PPT용','공지사항입니다. 확인하시고 댓글 달아주세요.','재롱.png',to_date('23/08/22','RR/MM/DD'),1);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (37,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (38,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (39,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (40,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (41,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (42,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (43,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (44,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (45,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (46,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (47,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (48,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (49,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (50,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (51,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (52,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (53,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (54,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (55,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (56,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (57,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (58,'1','admin','123','123',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (59,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (60,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (61,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
Insert into KIC.BOARD2 (NUM,BOARDID,NAME,SUBJECT,CONTENT,IMAGE,REGDATE,READCNT) values (62,'1','admin','공지사항 늘리기','공지사항 늘리기',' ',to_date('23/08/23','RR/MM/DD'),0);
REM INSERTING into KIC.BOARDCOMMENT2
SET DEFINE OFF;
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (14,33,'kimkim','김민재','123213',to_date('23/08/16','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (16,35,'youyou','유재석','124124124',to_date('23/08/18','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (15,35,'youyou','유재석','123',to_date('23/08/18','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (17,4,'admin','관리자','124214214',to_date('23/08/22','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (18,36,'admin','관리자','확인',to_date('23/08/22','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (19,36,'youyou','유재석','확인이요',to_date('23/08/22','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (20,36,'kimkim','김민재','ㅇㅇ',to_date('23/08/22','RR/MM/DD'));
Insert into KIC.BOARDCOMMENT2 (SER,NUM,ID,NAME,CONTENT,REGDATE) values (22,36,'test02','1234','댓글 ㅇㅇ',to_date('23/08/23','RR/MM/DD'));
REM INSERTING into KIC.CART
SET DEFINE OFF;
Insert into KIC.CART (CARTID,ID,PRODNUM,PRODNAME,QUANTITY,PRICE,RESULT,REGDATE) values (84,'youyou',122,'에이딕트 보이드우드',3,59000,1,to_date('23/08/23','RR/MM/DD'));
Insert into KIC.CART (CARTID,ID,PRODNUM,PRODNAME,QUANTITY,PRICE,RESULT,REGDATE) values (85,'youyou',121,'오드퍼퓸 보이드우드',3,59000,1,to_date('23/08/23','RR/MM/DD'));
REM INSERTING into KIC.MEMBER2
SET DEFINE OFF;
Insert into KIC.MEMBER2 (ID,PASS,NAME,GENDER,TEL,EMAIL,ZIPCODE,ADDRESS,RDATE) values ('admin','admin','관리자',1,'010','010',null,null,to_date('23/07/25','RR/MM/DD'));
Insert into KIC.MEMBER2 (ID,PASS,NAME,GENDER,TEL,EMAIL,ZIPCODE,ADDRESS,RDATE) values ('parkpark','park','박지성',1,'019','123123',null,null,to_date('23/07/25','RR/MM/DD'));
Insert into KIC.MEMBER2 (ID,PASS,NAME,GENDER,TEL,EMAIL,ZIPCODE,ADDRESS,RDATE) values ('kimkim','kim','김민재',1,'010','123123',null,null,to_date('23/07/25','RR/MM/DD'));
Insert into KIC.MEMBER2 (ID,PASS,NAME,GENDER,TEL,EMAIL,ZIPCODE,ADDRESS,RDATE) values ('youyou','you','유재석',1,'010100','10101010',null,null,to_date('23/07/25','RR/MM/DD'));
Insert into KIC.MEMBER2 (ID,PASS,NAME,GENDER,TEL,EMAIL,ZIPCODE,ADDRESS,RDATE) values ('test01','1234','탈퇴 테스트용1',1,'010','010','13529','경기 성남시 분당구 판교역로 166',to_date('23/08/23','RR/MM/DD'));
REM INSERTING into KIC.ORDER2
SET DEFINE OFF;
Insert into KIC.ORDER2 (ORDERNUM,ID,NAME,TEL,ZIPCODE,ADDRESS,DETAILADDRESS,RESULT,DELIVERCOST,REGDATE) values ('kimkim_20230823134843','kimkim','김민재','010','13529','경기 성남시 분당구 판교역로 166','101동 101호',5,0,to_date('23/08/23','RR/MM/DD'));
Insert into KIC.ORDER2 (ORDERNUM,ID,NAME,TEL,ZIPCODE,ADDRESS,DETAILADDRESS,RESULT,DELIVERCOST,REGDATE) values ('youyou_20230823135006','youyou','유재석','010100','13529','경기 성남시 분당구 판교역로 166','101동 101호',5,0,to_date('23/08/23','RR/MM/DD'));
Insert into KIC.ORDER2 (ORDERNUM,ID,NAME,TEL,ZIPCODE,ADDRESS,DETAILADDRESS,RESULT,DELIVERCOST,REGDATE) values ('admin_20230823122910','admin','관리자','010','13529','경기 성남시 분당구 판교역로 166','123123',1,2500,to_date('23/08/23','RR/MM/DD'));
Insert into KIC.ORDER2 (ORDERNUM,ID,NAME,TEL,ZIPCODE,ADDRESS,DETAILADDRESS,RESULT,DELIVERCOST,REGDATE) values ('kimkim_20230823134552','kimkim','김민재','010','13529','경기 성남시 분당구 판교역로 166','101동 101호',5,0,to_date('23/08/23','RR/MM/DD'));
REM INSERTING into KIC.ORDERITEM
SET DEFINE OFF;
Insert into KIC.ORDERITEM (ODITEMNUM,ORDERNUM,PRODNUM,QUANTITY,PRICE) values (104,'kimkim_20230823134843',44,10,10000);
Insert into KIC.ORDERITEM (ODITEMNUM,ORDERNUM,PRODNUM,QUANTITY,PRICE) values (105,'youyou_20230823135006',122,1,59000);
Insert into KIC.ORDERITEM (ODITEMNUM,ORDERNUM,PRODNUM,QUANTITY,PRICE) values (102,'admin_20230823122910',42,1,100);
Insert into KIC.ORDERITEM (ODITEMNUM,ORDERNUM,PRODNUM,QUANTITY,PRICE) values (103,'kimkim_20230823134552',122,3,59000);
REM INSERTING into KIC.PRODREVIEW
SET DEFINE OFF;
Insert into KIC.PRODREVIEW (REVIEWNUM,PRODNUM,ID,CONTENT,RATING,REGDATE) values (18,122,'kimkim','이것은 매우 좋다.',4,to_date('23/08/23','RR/MM/DD'));
Insert into KIC.PRODREVIEW (REVIEWNUM,PRODNUM,ID,CONTENT,RATING,REGDATE) values (19,122,'youyou','이것은 쓰레기다.',1,to_date('23/08/23','RR/MM/DD'));
REM INSERTING into KIC.PRODUCT
SET DEFINE OFF;
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (111,'르 설리 오 드 퍼퓸',225000,100,'가녀린 손목에서 퍼지는 체리향 초콜릿, 하이얀 피부처럼 고운 아이리스의 나른한 꽃향기','체리.jpg',2,'fruit','cherry',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (112,'넥타린 블로썸 앤 허니 코롱',85800,100,'복숭아와 자몽을 크게 잘라 잎사귀와 함께 삼키는 듯한 달콤함','복숭아.jpg',1,'fruit','peach',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (113,'캔디 플로럴 오 드 뚜왈렛',113600,100,'딸기 칵테일에 사뿐히 올라간 꽃잎처럼, 부드럽게 연출하는 섹시함','딸기.jpg',1,'fruit','strawberry',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (114,'마이웨이 오 드 퍼퓸',79000,100,'생기발랄한 딸기, 투베로즈가 보석처럼 영롱하게 빛나는 순간','딸기.jpg',2,'fruit','strawberry',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (115,'아쿠아 디 콜로니아 에바',157950,100,'레몬과 드라이한 나무먼지가 살짝 흡수된 새로산 니트의 포근한 향기','레몬.jpg',1,'fruit','lemon',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (116,'아쿠아 데시마 오 드 퍼퓸',285000,100,'청청한 여름날, 나홀로 나무 아래를 가볍게 메우는 레몬의 푸릇함','레몬.jpg',2,'fruit','lemon',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (117,'오 트리쁠 목수 성 요셉',185000,100,'일렁이는 바닐라와 히노끼의 편백향이 나무기둥 사이로 천천히 스며드는 소프트-우디 향','편백나무.jpg',2,'wood','pyeonbaeg',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (118,'조이 바이 디올',131000,100,'눈부신 햇살 속에서 파우더하게 번지는 로즈와 샌달우드의 담백 여성스러운 향기','샌달우드.jpg',1,'wood','sandal',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (119,'알바 디 서울',157950,100,'찬바람에 흔들리는 소나무 가지에서 퍼지는 솔과 진액의 시크한 향기','소나무.jpg',1,'wood','sonamu',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (120,'파인보일',68600,100,'일렁이는 바다 위로 드리워진 파란 소나무와 만다린의 산뜻함, 휴양지의 향기','소나무.jpg',2,'wood','sonamu',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (121,'오드퍼퓸 보이드우드',59000,100,'푸릇한 잎들이 우거진 묵직한 나무들 사이로 불어오는 그윽한 우드의 향취','보이드우드.jpg',1,'wood','void',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (122,'에이딕트 보이드우드',59000,96,'자스민의 그윽한 향기는 고급스러우면서도 모던한 이미지를 연출하며, 베이스 노트의 시더우드향은 차분하고 단정한 느낌을 선사합니다','여 보이드우드.jpg',2,'wood','void',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (43,'테스트2',2500,100,'100','샘플1.jpg',2,'flower','lilac',to_date('23/08/23','RR/MM/DD'),'꽃상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (44,'테스트3',10000,90,'100','샘플1.jpg',1,'flower','lilac',to_date('23/08/23','RR/MM/DD'),'꽃상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (102,'이솝 휠 오 드 퍼퓸',127000,100,'밤을 태워 먹은 편백나무 숲, 한 폭의 수묵화를 닮은 화취','남성-나무-편백.jpg',1,'wood','pyeonbaeg',to_date('23/07/25','RR/MM/DD'),'이솝 휠 오드 퍼퓸.png');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (100,'프레시 헤스페리데스',125000,100,'상큼한 자몽 향에 달콤한 꽃과 과일향이 조화를 이루는 긍정적인 에너지로 가득한 시트러스 향','여성-꽃-시트러스.jpg',2,'flower','citrus',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (101,'에르메스 상탈 마쏘이아',108000,100,'눈부신 햇살 속에서 파우더하게 번지는 로즈와 샌달우드의 담백 여성스러운 향기','여성-나무-샌달우드.jpg',2,'wood','sandal',to_date('23/07/25','RR/MM/DD'),'이솝 휠 오드 퍼퓸.png');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (103,'프레데릭 말 엉빠썽',174000,100,'시원한 워터리 그린 노트로 시작하지만 동시에 파우더리하고 달콤한 라일락 향이 아주 부드럽게 피부를 감싸요','남성-꽃-라일락.jpg',1,'flower','lilac',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (104,'톰 포드 로스트 체리',100100,100,'베이스에 다크하면서 부드러운 우디노트, 위에는 적당히 달콤한 체리향과 은은한 아몬드 향으로 장식한 흔한 것 같으면서도 흔하지 않은 유니섹스 향수','남성-과일-체리.jpg',1,'fruit','cherry',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (105,'로데헤스페리데스 오 드 뚜왈렛',182800,100,'옅은 바람을 등지고 맡아지는 비터오렌지, 민트, 로즈마리의 프레시함이 마음을 톡톡 건드는 상쾌함','라벤더.jpg',2,'flower','lavender',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (106,'오 로즈 오 드 퍼퓸',215800,100,'생장미 다발에서 피어오르는 장미의 깊은 향취와 포근한 잔향','장미.jpg',1,'flower','rose',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (107,'오 로즈 오 드 뚜왈렛',135800,100,'세상 깔끔한 헤어미스트 같은 생장미 향기, 싱그러운 잔향','장미.jpg',2,'flower','rose',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (108,'벨 드 그라스 오 드 뚜왈렛',80000,100,'바이올레스 라일락의 보라빛 향연에서 헬리오트로프가 감싸안는 따스함','라일락.jpg',2,'flower','lilac',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (109,'너바나 프렌치 그레이',63000,100,'비맞은  라벤더 향이 나는 것 같은 시크한 표정의 뉴요커','남 라벤더.jpg',1,'flower','lavender',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (110,'에이버리 오 드 뚜왈렛',42000,100,'센스있는 남자의 부드러운 우디-시트러스풍 깔끔함','시트러스.jpg',1,'flower','citrus',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
