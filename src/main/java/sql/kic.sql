-- 테이블 및 시퀀스 삭제
--drop table board2;
--drop table boardcomment2;
--drop table member2;
--drop table cart;
--drop table answer;
--drop table product;
--drop table order2;
--drop table orderitem;
--drop table prodreview;
--
--drop sequence boardseq2;
--drop sequence boardcomseq2;
--drop sequence productseq;
--drop sequence cartseq;
--drop sequence orderitemseq;
--drop sequence surveyseq;
--drop sequence reviewnumseq;

-- 회원 테이블 생성
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

-- 게시판 테이블 생성
create table board2 (
num int primary key,
boardid varchar(3),
name varchar(20),
subject varchar(100),
content varchar(2000),
image varchar(300),
regdate date,
readcnt number);

-- 게시판 시퀀스 생성
create sequence boardseq2;

-- 게시판 댓글 테이블 생성
create table boardcomment2 (
ser int primary key,
num int,
id varchar(20),
name varchar(20),
content varchar(2000),
regdate date);

-- 게시판 댓글 시퀀스 생성
create sequence boardcomseq2;

-- 상품 테이블 생성
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

-- 상품 시퀀스 생성
create sequence productseq;

-- 상품 입력
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (100,'프레시 헤스페리데스',125000,100,'상큼한 자몽 향에 달콤한 꽃과 과일향이 조화를 이루는 긍정적인 에너지로 가득한 시트러스 향','여성-꽃-시트러스.jpg',2,'flower','citrus',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (101,'에르메스 상탈 마쏘이아',108000,100,'눈부신 햇살 속에서 파우더하게 번지는 로즈와 샌달우드의 담백 여성스러운 향기','여성-나무-샌달우드.jpg',2,'wood','sandal',to_date('23/07/25','RR/MM/DD'),'이솝 휠 오드 퍼퓸.png');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (102,'이솝 휠 오 드 퍼퓸',127000,100,'밤을 태워 먹은 편백나무 숲, 한 폭의 수묵화를 닮은 화취','남성-나무-편백.jpg',1,'wood','pyeonbaeg',to_date('23/07/25','RR/MM/DD'),'이솝 휠 오드 퍼퓸.png');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (103,'프레데릭 말 엉빠썽',174000,100,'시원한 워터리 그린 노트로 시작하지만 동시에 파우더리하고 달콤한 라일락 향이 아주 부드럽게 피부를 감싸요','남성-꽃-라일락.jpg',1,'flower','lilac',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (104,'톰 포드 로스트 체리',100100,100,'베이스에 다크하면서 부드러운 우디노트, 위에는 적당히 달콤한 체리향과 은은한 아몬드 향으로 장식한 흔한 것 같으면서도 흔하지 않은 유니섹스 향수','남성-과일-체리.jpg',1,'fruit','cherry',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (105,'로데헤스페리데스 오 드 뚜왈렛',182800,100,'옅은 바람을 등지고 맡아지는 비터오렌지, 민트, 로즈마리의 프레시함이 마음을 톡톡 건드는 상쾌함','라벤더.jpg',2,'flower','lavender',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (106,'오 로즈 오 드 퍼퓸',215800,100,'생장미 다발에서 피어오르는 장미의 깊은 향취와 포근한 잔향','장미.jpg',1,'flower','rose',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (107,'오 로즈 오 드 뚜왈렛',135800,100,'세상 깔끔한 헤어미스트 같은 생장미 향기, 싱그러운 잔향','장미.jpg',2,'flower','rose',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (108,'벨 드 그라스 오 드 뚜왈렛',80000,100,'바이올레스 라일락의 보라빛 향연에서 헬리오트로프가 감싸안는 따스함','라일락.jpg',2,'flower','lilac',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (109,'너바나 프렌치 그레이',63000,100,'비맞은  라벤더 향이 나는 것 같은 시크한 표정의 뉴요커','남 라벤더.jpg',1,'flower','lavender',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (110,'에이버리 오 드 뚜왈렛',42000,100,'센스있는 남자의 부드러운 우디-시트러스풍 깔끔함','시트러스.jpg',1,'flower','citrus',to_date('23/07/25','RR/MM/DD'),'꽃상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (111,'르 설리 오 드 퍼퓸',225000,100,'가녀린 손목에서 퍼지는 체리향 초콜릿, 하이얀 피부처럼 고운 아이리스의 나른한 꽃향기','체리.jpg',2,'fruit','cherry',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (112,'넥타린 블로썸 앤 허니 코롱',85800,100,'복숭아와 자몽을 크게 잘라 잎사귀와 함께 삼키는 듯한 달콤함','복숭아.jpg',1,'fruit','peach',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (113,'캔디 플로럴 오 드 뚜왈렛',113600,100,'딸기 칵테일에 사뿐히 올라간 꽃잎처럼, 부드럽게 연출하는 섹시함','딸기.jpg',1,'fruit','strawberry',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (114,'마이웨이 오 드 퍼퓸',79000,100,'생기발랄한 딸기, 투베로즈가 보석처럼 영롱하게 빛나는 순간','딸기.jpg',2,'fruit','strawberry',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (115,'아쿠아 디 콜로니아 에바',157950,100,'레몬과 드라이한 나무먼지가 살짝 흡수된 새로산 니트의 포근한 향기','레몬.jpg',1,'fruit','lemon',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (116,'아쿠아 데시마 오 드 퍼퓸',285000,100,'청청한 여름날, 나홀로 나무 아래를 가볍게 메우는 레몬의 푸릇함','레몬.jpg',2,'fruit','lemon',to_date('23/07/25','RR/MM/DD'),'과일상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (117,'오 트리쁠 목수 성 요셉',185000,100,'일렁이는 바닐라와 히노끼의 편백향이 나무기둥 사이로 천천히 스며드는 소프트-우디 향','편백나무.jpg',2,'wood','pyeonbaeg',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (118,'조이 바이 디올',131000,100,'눈부신 햇살 속에서 파우더하게 번지는 로즈와 샌달우드의 담백 여성스러운 향기','샌달우드.jpg',1,'wood','sandal',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (119,'알바 디 서울',157950,100,'찬바람에 흔들리는 소나무 가지에서 퍼지는 솔과 진액의 시크한 향기','소나무.jpg',1,'wood','sonamu',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (120,'파인보일',68600,100,'일렁이는 바다 위로 드리워진 파란 소나무와 만다린의 산뜻함, 휴양지의 향기','소나무.jpg',2,'wood','sonamu',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (121,'오드퍼퓸 보이드우드',59000,100,'푸릇한 잎들이 우거진 묵직한 나무들 사이로 불어오는 그윽한 우드의 향취','보이드우드.jpg',1,'wood','void',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');
--Insert into KIC.PRODUCT (PRODNUM,NAME,PRICE,STOCK,INFO,IMAGE,PRODGENDER,PRODANS1,PRODANS2,REGDATE,DETAIL) values (122,'에이딕트 보이드우드',59000,100,'자스민의 그윽한 향기는 고급스러우면서도 모던한 이미지를 연출하며, 베이스 노트의 시더우드향은 차분하고 단정한 느낌을 선사합니다','여 보이드우드.jpg',2,'wood','void',to_date('23/07/25','RR/MM/DD'),'나무상세.jpg');

-- 설문 테이블 생성
create table answer(
SER int primary key,
ID varchar(20),
ANSGENDER number(1),
ANS1 varchar(30),
ANS2 varchar(60),
PRODNAME varchar(50),
rdate date
);

-- 설문 시퀀스 생성
create sequence surveyseq;

-- 장바구니 테이블
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
-- 장바구니 시퀀스 생성
create sequence cartseq;

-- 주문 테이블 생성
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

-- 주문 상품 테이블 생성 (주문의 상품을 관리하기 위함)
create table orderitem (
oditemnum int,
ordernum varchar(50),
prodnum int,
quantity int,
price int
);

-- 주문 상품 시퀀스 생성
create sequence orderitemseq;

-- 리뷰 테이블 생성
create table prodreview (
reviewnum int primary key,
prodnum int,
id varchar(20),
content varchar(2000),
rating int,
regdate date
);

-- 리뷰 시퀀스 생성
create sequence reviewnumseq;



