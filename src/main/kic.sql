-- ȸ�� ���̺� ����
create table member2 (
id varchar(20) primary key,
pass varchar(20),
name varchar(20),
gender number,
tel varchar(20),
email varchar(40),
zipcode varchar(10),
address varchar(100),
rdate date);

-- �Խ��� ���̺� ����
create table board2 (
num int primary key,
boardid varchar(3),
name varchar(20),
subject varchar(100),
content varchar(2000),
image varchar(300),
regdate date,
readcnt number);

-- �Խ��� ������ ����
create sequence boardseq2;

-- �Խ��� ��� ���̺� ����
create table boardcomment2 (
ser int primary key,
num int,
id varchar(20),
name varchar(20),
content varchar(2000),
regdate date);

-- �Խ��� ��� ������ ����
create sequence boardcomseq2;

-- ��ǰ ���̺� ����
create table product (
prodnum int primary key,
name varchar(200),
price int,
stock int,
info varchar(2000),
image varchar(200),
prodgender number,
prodans1 varchar(20),
prodans2 varchar(20),
regdate date,
detail varchar(200)
);

-- ��ǰ ������ ����
create sequence productseq;

-- ��ǰ �Է�
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (100,'������ �콺�丮����',125000,100,'��ŭ�� �ڸ� �⿡ ������ �ɰ� �������� ��ȭ�� �̷�� �������� �������� ������ ��Ʈ���� ��','����-��-��Ʈ����.jpg',2,'flower','citrus',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (101,'�����޽� ��Ż �����̾�',108000,100,'���ν� �޻� �ӿ��� �Ŀ���ϰ� ������ ����� ���޿���� ��� ���������� ���','����-����-���޿��.jpg',2,'wood','sandal',to_date('23/07/25','RR/MM/DD'),'�̼� �� ���� ��Ǿ.png');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (102,'�̼� �� �� �� ��Ǿ',127000,100,'���� �¿� ���� ��鳪�� ��, �� ���� ����ȭ�� ���� ȭ��','����-����-���.jpg',1,'wood','pyeonbaeg',to_date('23/07/25','RR/MM/DD'),'�̼� �� ���� ��Ǿ.png');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (103,'�������� �� ������',174000,100,'�ÿ��� ���͸� �׸� ��Ʈ�� ���������� ���ÿ� �Ŀ�����ϰ� ������ ���϶� ���� ���� �ε巴�� �Ǻθ� ���ο�','����-��-���϶�.jpg',1,'flower','lilac',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (104,'�� ���� �ν�Ʈ ü��',100100,100,'���̽��� ��ũ�ϸ鼭 �ε巯�� ����Ʈ, ������ ������ ������ ü����� ������ �Ƹ�� ������ ����� ���� �� �����鼭�� ������ ���� ���ϼ��� ���','����-����-ü��.jpg',1,'fruit','cherry',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (105,'�ε��콺�丮���� �� �� �ѿз�',182800,100,'���� �ٶ��� ������ �þ����� ���Ϳ�����, ��Ʈ, ������� ���������� ������ ���� �ǵ�� ������','�󺥴�.jpg',2,'flower','lavender',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (106,'�� ���� �� �� ��Ǿ',215800,100,'����� �ٹ߿��� �Ǿ������ ����� ���� ����� ������ ����','���.jpg',1,'flower','rose',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (107,'�� ���� �� �� �ѿз�',135800,100,'���� ����� ���̽�Ʈ ���� ����� ���, �̱׷��� ����','���.jpg',2,'flower','rose',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (108,'�� �� �׶� �� �� �ѿз�',80000,100,'���̿÷��� ���϶��� ����� �⿬���� �︮��Ʈ������ ���ξȴ� ������','���϶�.jpg',2,'flower','lilac',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (109,'�ʹٳ� ����ġ �׷���',63000,100,'�����  �󺥴� ���� ���� �� ���� ��ũ�� ǥ���� ����Ŀ','�� �󺥴�.jpg',1,'flower','lavender',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (110,'���̹��� �� �� �ѿз�',42000,100,'�����ִ� ������ �ε巯�� ���-��Ʈ����ǳ �����','��Ʈ����.jpg',1,'flower','citrus',to_date('23/07/25','RR/MM/DD'),'�ɻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (111,'�� ���� �� �� ��Ǿ',225000,100,'���ะ �ո񿡼� ������ ü���� ���ݸ�, ���̾� �Ǻ�ó�� ��� ���̸����� ������ �����','ü��.jpg',2,'fruit','cherry',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (112,'��Ÿ�� ��ν� �� ��� �ڷ�',85800,100,'�����ƿ� �ڸ��� ũ�� �߶� �ٻ�Ϳ� �Բ� ��Ű�� ���� ������','������.jpg',1,'fruit','peach',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (113,'ĵ�� �÷η� �� �� �ѿз�',113600,100,'���� Ĭ���Ͽ� ����� �ö� ����ó��, �ε巴�� �����ϴ� ������','����.jpg',1,'fruit','strawberry',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (114,'���̿��� �� �� ��Ǿ',79000,100,'����߶��� ����, ������� ����ó�� �����ϰ� ������ ����','����.jpg',2,'fruit','strawberry',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (115,'����� �� �ݷδϾ� ����',157950,100,'����� ������� ���������� ��¦ ����� ���λ� ��Ʈ�� ������ ���','����.jpg',1,'fruit','lemon',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (116,'����� ���ø� �� �� ��Ǿ',285000,100,'ûû�� ������, ��Ȧ�� ���� �Ʒ��� ������ �޿�� ������ Ǫ����','����.jpg',2,'fruit','lemon',to_date('23/07/25','RR/MM/DD'),'���ϻ�.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (117,'�� Ʈ���� ��� �� ���',185000,100,'�Ϸ��̴� �ٴҶ�� ���볢�� ������� ������� ���̷� õõ�� ������ ����Ʈ-��� ��','��鳪��.jpg',2,'wood','pyeonbaeg',to_date('23/07/25','RR/MM/DD'),'������.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (118,'���� ���� ���',131000,100,'���ν� �޻� �ӿ��� �Ŀ���ϰ� ������ ����� ���޿���� ��� ���������� ���','���޿��.jpg',1,'wood','sandal',to_date('23/07/25','RR/MM/DD'),'������.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (119,'�˹� �� ����',157950,100,'���ٶ��� ��鸮�� �ҳ��� �������� ������ �ְ� ������ ��ũ�� ���','�ҳ���.jpg',1,'wood','sonamu',to_date('23/07/25','RR/MM/DD'),'������.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (120,'���κ���',68600,100,'�Ϸ��̴� �ٴ� ���� �帮���� �Ķ� �ҳ����� ���ٸ��� �����, �޾����� ���','�ҳ���.jpg',2,'wood','sonamu',to_date('23/07/25','RR/MM/DD'),'������.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (121,'������Ǿ ���̵���',59000,100,'Ǫ���� �ٵ��� ����� ������ ������ ���̷� �Ҿ���� ������ ����� ����','���̵���.jpg',1,'wood','void',to_date('23/07/25','RR/MM/DD'),'������.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (122,'���̵�Ʈ ���̵���',59000,100,'�ڽ����� ������ ���� ��޽�����鼭�� ����� �̹����� �����ϸ�, ���̽� ��Ʈ�� �ô�������� �����ϰ� ������ ������ �����մϴ�','�� ���̵���.jpg',2,'wood','void',to_date('23/07/25','RR/MM/DD'),'������.jpg');

-- ���� ���̺� ����
create table answer(
SER int primary key,
ID varchar(20),
ANSGENDER number(1),
ANS1 varchar(30),
ANS2 varchar(60),
PRODNAME varchar(50),
rdate date
);

-- ���� ������ ����
create sequence surveyseq;

-- ��ٱ��� ���̺�
create table cart (
cartid int primary key,
id varchar(20),
prodnum int,
prodname varchar(200),
quantity int,
price int,
result int,
regdate date
);
-- ��ٱ��� ������ ����
create sequence cartseq;

-- �ֹ� ���̺� ����
create table order2 (
ordernum varchar(50) primary key,
id varchar(20),
name varchar(20),
tel varchar(20),
zipcode varchar(10),
address varchar(100),
detailaddress varchar(100),
result int,
delivercost int, 
regdate date);

-- �ֹ� ��ǰ ���̺� ���� (�ֹ��� ��ǰ�� �����ϱ� ����)
create table orderitem (
oditemnum int,
ordernum varchar(50),
prodnum int,
quantity int,
price int
);

-- �ֹ� ��ǰ ������ ����
create sequence orderitemseq;

-- ���� ���̺� ����
create table prodreview (
reviewnum int primary key,
prodnum int,
id varchar(20),
content varchar(2000),
rating int,
regdate date
);

-- ���� ������ ����
create sequence reviewnumseq;


-- ���̺� �� ������ ����
--drop table board2;
--drop table boardcomment2;
--drop table member2;
--drop table cart;
--drop table answer;
--drop table product;
--drop table order2;
--drop table orderitem;
--
--drop sequence boardseq2;
--drop sequence boardcomseq2;
--drop sequence productseq;
--drop sequence cartseq;
--drop sequence orderitemseq;
--drop sequence surveyseq;


