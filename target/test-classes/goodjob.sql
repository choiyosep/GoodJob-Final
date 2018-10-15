-- 회원 ( ERD에서 기업/개인 구분하기위해 type 컬럼을 뒀으나 명령어라 사용불가함 따라서 member_type으로 변경
create table member(
	id varchar2(100) primary key,
	password varchar2(100) not null,
	email varchar2(100) not null,
	name varchar2(100) not null,
	address varchar2(100) not null,
	tel varchar2(100) not null,
	member_type number --0은 관리자 / 1 은 개인회원 / 2 는 기업회원 승인 X / 3은 기업회원 승인 OK
)
drop table member cascade constraint;

insert into MEMBER(id, password, email, name, address, tel, member_type) values('admin', 'admin', 'admin@kosta.or.kr', '관리자', '경기도 성남시 분당구 대왕판교로 670길 유스페이스2 B동 8층', '070-5039-5803, 5805', 0);
insert into MEMBER(id, password, email, name, address, tel, member_type) values('NHNuser', '123', 'NHNuser@nhn.co.kr', 'NHNEntertainment', '경기도 성남시 분당구 대왕판교로 645번길 16 NHN엔터테인먼트 플레이뮤지엄', '031-8028-3221', 3);
insert into MEMBER(id, password, email, name, address, tel, member_type) values('Tmaxuser', '123', 'Tmaxuser@tmax.com', 'TmaxSoft', '경기도 성남시 분당구 황새울로 258번길 29, BS타워 8-9층 티맥스소프트', '031-8018-1000', 3);
insert into MEMBER(id, password, email, name, address, tel, member_type) values('qqqq', '123', 'qqqq@gmail.com', '이동규', '충청도 당진시', '010-1111-1111', 1);
insert into MEMBER(id, password, email, name, address, tel, member_type) values('miri', '123', 'miri@gmail.com', '서미리', '경기도 성남시 중원구', '010-2222-2222', 1);
insert into MEMBER(id, password, email, name, address, tel, member_type) values('yosep', '123', 'yosep@gmail.com', '최요셉', '경기도 수원시', '010-3333-3333', 1);
insert into MEMBER(id, password, email, name, address, tel, member_type) values('hsj', '123', 'hsj@gmail.com', '황성진', '경기도 안양시', '010-4444-4444', 1);
insert into MEMBER(id, password, email, name, address, tel, member_type) values('MCW', '123', 'MCW@gmail.com', '문철우', '서울특별시 중랑구', '010-5555-5555', 1);

select * from member;
---------------------------------------------------------------------

-- 관리자
create table manager(
	id varchar2(100) primary key,
	manager_level varchar2(100) not null,
	constraint fk_member_manager foreign key(id) references member(id)
)
drop table manager cascade constraint;

insert into MANAGER(id, manager_level) values('admin', 1);

select * from manager;
---------------------------------------------------------------------

-- 개인회원 
create table normal_member(
	normal_id varchar2(100) primary key,
	gender varchar2(100) not null,
	picture_path varchar2(100) not null,
	career_status varchar2(100) not null,
	constraint fk_normalandmember foreign key(normal_id) references member(id)
)
drop table normal_member cascade constraint;

insert into NORMAL_MEMBER(normal_id, gender, picture_path, career_status) values('qqqq', '이동규.png', 'Java 개발자로 LINE에서 3년 근무', '남');
insert into NORMAL_MEMBER(normal_id, gender, picture_path, career_status) values('miri', '서미리.png', '.NET(C#) 개발 경력 2년 (마이다시아이티)', '여');
insert into NORMAL_MEMBER(normal_id, gender, picture_path, career_status) values('yosep', '최요셉.png', '없음', '남');
insert into NORMAL_MEMBER(normal_id, gender, picture_path, career_status) values('hsj', '황성진.png', 'Oracle DBA 6년', '남');
insert into NORMAL_MEMBER(normal_id, gender, picture_path, career_status) values('MCW', '문철우.png', 'Python 개발 5년 (네이버)', '남');

select * from normal_member;
---------------------------------------------------------------------

-- 포트폴리오
create table portfolio(
	normal_id varchar2(100) primary key,
	title varchar2(100) not null,
	content varchar2(1000) not null,
	constraint fk_member_portfolio foreign key(normal_id) references normal_member(normal_id) 
)
drop table portfolio cascade constraint;

insert into PORTFOLIO(normal_id, title, content) values('yosep', 'Coder가 아닌 Developer가 되겠습니다.', '항상 배움의 자세로 새로운 분야에 도전하고 있으며, 매사에 도전하고 노력하는 인재입니다.');
insert into PORTFOLIO(normal_id, title, content) values('MCW', '인재를 싸게 팝니다.', '주변 사람과 소통하며 혁신을 이뤄내는 사원이 되겠습니다.');

select * from portfolio;
---------------------------------------------------------------------

-- 포트폴리오 파일 경로 
create table portfolio_file(
	file_num number primary key,
	normal_id varchar2(100) not null,
	file_path varchar2(100) not null,
	constraint fk_member_portfolio_file foreign key(normal_id) references portfolio(normal_id)
)
create sequence portfolio_file_seq start with 601;
drop table portfolio_file cascade constraint;

insert into PORTFOLIO_FILE(file_num, normal_id, file_path) values(portfolio_file_seq.nextval, 'yosep', '물품공유플랫폼.pdf');
insert into PORTFOLIO_FILE(file_num, normal_id, file_path) values(portfolio_file_seq.nextval, 'yosep', '소셜다이닝(sharebob).pptx');
insert into PORTFOLIO_FILE(file_num, normal_id, file_path) values(portfolio_file_seq.nextval, 'MCW', 'GoodJob.pdf');

select * from portfolio_file;
---------------------------------------------------------------------

-- 기업회원
create table company_member(
	company_id varchar2(100) primary key,
	introduction varchar2(100) not null,
	company_type varchar2(100) not null,
	industry varchar2(100) not null,
	sales number default 0,
	date_of_establishment varchar2(100) not null,
	num_of_employees number not null,
	constraint fk_member_company_member foreign key(company_id) references member(id)
)
drop table company_member cascade constraint;

insert into COMPANY_MEMBER(company_id, introduction, company_type, industry, sales, date_of_establishment, num_of_employees) values('NHNuser', '더 넓은 세상, 더 많은 사람들이 더 큰 재미를 우리와 함께 나눕니다.', '대기업', '솔루션', 1813, '2015-11-18', 664);
insert into COMPANY_MEMBER(company_id, introduction, company_type, industry, sales, date_of_establishment, num_of_employees) values('Tmaxuser', '대한민국 S/W의 위상을 국내 및 전세계 시장에 알려나가고 있습니다.', '중견기업', 'SI/SM', 710, '1997-06-04', 358);

select * from company_member;
---------------------------------------------------------------------

-- 구인공고와  PK시퀀스
create table job_posting(
	job_posting_num number primary key,
	company_id varchar2(100),
	career_status varchar2(100) not null,
	title varchar2(100) not null,
	content varchar2(1000) not null,
	constraint fk_company_member_job_posting foreign key(company_id) references company_member(company_id)
)
create sequence job_posting_num_seq start with 1001;

drop sequence job_posting_num_seq;
drop table job_posting cascade constraint;

insert into JOB_POSTING(job_posting_num, company_id, career_status, title, content) values(job_posting_num_seq.nextval, 'NHNuser', '경력 3년', 'NHN엔터테인먼트에서 Java 신입, 프리랜서 개발자 모집', 'Java 어플리케이션 개발 경험자, WAS 이해도가 높은 경험자 우대합니다.');
insert into JOB_POSTING(job_posting_num, company_id, career_status, title, content) values(job_posting_num_seq.nextval, 'Tmaxuser', '경력 무관', '티맥스소프트 DBA 2018 하반기 공개채용', 'MS-SQL 서버 모니터링 및 트러블 슈팅경험 있으신 분, OLTP 업무 경험 있으신 분');

select * from job_posting;
---------------------------------------------------------------------

-- 키워드 삭제(MIRI 2018.10.12)
--create table keyword(
--	keyword_name varchar2(100),
--	constraint fk_job_keyword foreign key(job_posting_num) references job_posting(job_posting_num),
--	constraint pk_keyword_num_name primary key(job_posting_num, keyword_name)
--)
--drop table keyword cascade constraint;
--
--select * from keyword;
---------------------------------------------------------------------

--구인공고와 키워드 복합키
create table job_posting_keyword(
	job_posting_num number,
	keyword_name varchar2(100),
	constraint fk_job_posting_num foreign key(job_posting_num) references job_posting(job_posting_num),
	constraint pk_keywordname_jobpostingnum primary key(keyword_name,job_posting_num)
)
drop table job_posting_keyword cascade constraint;

insert into JOB_POSTING_KEYWORD(job_posting_num, keyword_name) values(1001, '워라밸');
insert into JOB_POSTING_KEYWORD(job_posting_num, keyword_name) values(1001, '야근 없음');
insert into JOB_POSTING_KEYWORD(job_posting_num, keyword_name) values(1001, '근면 성실');
insert into JOB_POSTING_KEYWORD(job_posting_num, keyword_name) values(1002, '워라밸');
insert into JOB_POSTING_KEYWORD(job_posting_num, keyword_name) values(1002, 'Spring');
insert into JOB_POSTING_KEYWORD(job_posting_num, keyword_name) values(1002, '열정');
insert into JOB_POSTING_KEYWORD(job_posting_num, keyword_name) values(1002, '수평적 문화');
insert into JOB_POSTING_KEYWORD(job_posting_num, keyword_name) values(1002, '야근 없음');

select * from job_posting_keyword;
---------------------------------------------------------------------

-- 질의응답과 구인공고게시글/아이디 복합키 설정
create table question_answer(
	qa_num number primary key,
	normal_id varchar2(100),
	job_posting_num number,
	question varchar2(200) not null,
	answer varchar2(500) not null,
	constraint fk_member_qna foreign key(normal_id) references normal_member(normal_id),
	constraint fk_job_posting_num_qna foreign key(job_posting_num) references job_posting(job_posting_num)
)
create sequence qa_num_seq start with 701;
drop table question_answer cascade constraint;
drop sequence qa_num_seq

insert into QUESTION_ANSWER(qa_num, normal_id, job_posting_num, question, answer) values(qa_num_seq.nextval, 'qqqq', 1001, '수습기간이 따로 있나요?', '3개월의 수습기간을 거치게 됩니다.');
insert into QUESTION_ANSWER(qa_num, normal_id, job_posting_num, question, answer) values(qa_num_seq.nextval, 'qqqq', 1001, '정확한 채용 인원이 몇 명인가요?', '5명입니다.');
insert into QUESTION_ANSWER(qa_num, normal_id, job_posting_num, question, answer) values(qa_num_seq.nextval, 'miri', 1001, '중식은 어떻게 지원되나요?', '중식은 따로 지원되지 않습니다.');
insert into QUESTION_ANSWER(qa_num, normal_id, job_posting_num, question, answer) values(qa_num_seq.nextval, 'miri', 1002, '가장 자랑할만한 복리후생은 어떻게 되나요?', '탄력 근무제로 출퇴근 시간의 조정이 가능합니다.');
insert into QUESTION_ANSWER(qa_num, normal_id, job_posting_num, question, answer) values(qa_num_seq.nextval, 'qqqq', 1002, '졸업 예정자도 지원 가능한가요?', '네. 가능합니다.');

select * from question_answer;
---------------------------------------------------------------------

--모집직군분류와 PK 시퀀스
create table recruitment_category(
	rc_num number primary key,
	rc_name varchar2(100) not null
)
create sequence rc_num_seq start with 101;

drop table recruitment_category cascade constraint;
drop sequence rc_num_seq;

insert into RECRUITMENT_CATEGORY(rc_num, rc_name) values(rc_num_seq.nextval, '웹 프로그래머');
insert into RECRUITMENT_CATEGORY(rc_num, rc_name) values(rc_num_seq.nextval, '응용 프로그래머');
insert into RECRUITMENT_CATEGORY(rc_num, rc_name) values(rc_num_seq.nextval, '시스템 프로그래머');
insert into RECRUITMENT_CATEGORY(rc_num, rc_name) values(rc_num_seq.nextval, 'HTML/퍼블리싱/UI');
insert into RECRUITMENT_CATEGORY(rc_num, rc_name) values(rc_num_seq.nextval, '네트워크/서버/보안');
insert into RECRUITMENT_CATEGORY(rc_num, rc_name) values(rc_num_seq.nextval, 'DBA/데이터베이스');
insert into RECRUITMENT_CATEGORY(rc_num, rc_name) values(rc_num_seq.nextval, '게임');
insert into RECRUITMENT_CATEGORY(rc_num, rc_name) values(rc_num_seq.nextval, '인공지능/빅데이터');
insert into RECRUITMENT_CATEGORY(rc_num, rc_name) values(rc_num_seq.nextval, 'ERP');

select * from recruitment_category;
---------------------------------------------------------------------

-- 모집직군분류와 구인공고글 복합키 설정
create table job_recruitment(
	job_posting_num number,
	rc_num number,
	constraint fk_job_posting_num2 foreign key(job_posting_num) references job_posting(job_posting_num),
	constraint fk_rc foreign key(rc_num) references recruitment_category(rc_num),
	constraint pk_jobpostingnum_rcnum primary key (rc_num,job_posting_num)
)
drop table job_recruitment cascade constraint;

insert into JOB_RECRUITMENT(job_posting_num, rc_num) values(1001, 101);
insert into JOB_RECRUITMENT(job_posting_num, rc_num) values(1001, 105);
insert into JOB_RECRUITMENT(job_posting_num, rc_num) values(1002, 106);

select * from job_recruitment;
---------------------------------------------------------------------

-- 모집직군분류와 구직회원 복합키 설정
create table portfolio_recruitment(
	normal_id varchar2(100),
	rc_num number,
	constraint fk_id_pf foreign key(normal_id) references portfolio(normal_id),
	constraint fk_rc_pf foreign key(rc_num) references recruitment_category(rc_num),
	constraint pk_id_rc_pf primary key(rc_num,normal_id)
)
drop table portfolio_recruitment cascade constraint;

insert into PORTFOLIO_RECRUITMENT(normal_id, rc_num) values('yosep', 101);
insert into PORTFOLIO_RECRUITMENT(normal_id, rc_num) values('yosep', 106);
insert into PORTFOLIO_RECRUITMENT(normal_id, rc_num) values('MCW', 101);
insert into PORTFOLIO_RECRUITMENT(normal_id, rc_num) values('MCW', 108);

select * from portfolio_recruitment;
---------------------------------------------------------------------

-- 고용형태종류와 PK 시퀀스
create table employment_type_category(
	emp_type_num number primary key,
	emp_type_name varchar2(100) not null
)

create sequence emp_type_num_seq start with 301;

drop table employment_type_category cascade constraint;
drop sequence emp_type_num_seq;

insert into EMPLOYMENT_TYPE_CATEGORY(emp_type_num, emp_type_name) values(emp_type_num_seq.nextval, '인턴');
insert into EMPLOYMENT_TYPE_CATEGORY(emp_type_num, emp_type_name) values(emp_type_num_seq.nextval, '신입');
insert into EMPLOYMENT_TYPE_CATEGORY(emp_type_num, emp_type_name) values(emp_type_num_seq.nextval, '경력');
insert into EMPLOYMENT_TYPE_CATEGORY(emp_type_num, emp_type_name) values(emp_type_num_seq.nextval, '프리랜서');

select * from employment_type_category;
---------------------------------------------------------------------

-- 고용형태종류와 구인공고글 복합키 설정
create table job_emp(
	job_posting_num number,
	emp_type_num number,
	constraint fk_job_posting_num3 foreign key(job_posting_num) references job_posting(job_posting_num),
	constraint fk_emp_job foreign key(emp_type_num) references employment_type_category(emp_type_num),
	constraint pk_jobposting_jobemp primary key(emp_type_num,job_posting_num)
)

drop table job_emp cascade constraint;

insert into JOB_EMP(job_posting_num, emp_type_num) values(1001, 302);
insert into JOB_EMP(job_posting_num, emp_type_num) values(1001, 304);
insert into JOB_EMP(job_posting_num, emp_type_num) values(1002, 304);

select * from job_emp;
---------------------------------------------------------------------

-- 고용형태종류와 구직회원 복합키 설정
create table portfolio_emp(
	normal_id varchar2(100),
	emp_type_num number,
	constraint fk_id_emp foreign key(normal_id) references portfolio(normal_id),
	constraint fk_emp_pf foreign key(emp_type_num) references employment_type_category(emp_type_num),
	constraint pk_id_emp_pf primary key(emp_type_num,normal_id)
)
drop table portfolio_emp cascade constraint;

insert into PORTFOLIO_EMP(normal_id, emp_type_num) values('yosep', 301);
insert into PORTFOLIO_EMP(normal_id, emp_type_num) values('yosep', 302);
insert into PORTFOLIO_EMP(normal_id, emp_type_num) values('yosep', 304);
insert into PORTFOLIO_EMP(normal_id, emp_type_num) values('MCW', 303);
insert into PORTFOLIO_EMP(normal_id, emp_type_num) values('MCW', 304);

select * from portfolio_emp;
---------------------------------------------------------------------

-- 지역분류와 PK 시퀀스
create table location(
	loc_num number primary key,
	loc_name varchar2(100) not null
)
create sequence loc_num_seq start with 501;

drop table location cascade constraint;
drop sequence loc_num_seq;

insert into LOCATION(loc_num, loc_name) values(loc_num_seq.nextval, '서울');
insert into LOCATION(loc_num, loc_name) values(loc_num_seq.nextval, '경기');
insert into LOCATION(loc_num, loc_name) values(loc_num_seq.nextval, '기타');

select * from location;
---------------------------------------------------------------------

-- 지역종류와 구인공고글 복합키 설정
create table job_loc(
	job_posting_num number,
	loc_num number,
	constraint fk_job_posting_num4 foreign key(job_posting_num) references job_posting(job_posting_num),
	constraint fk_loc_job foreign key(loc_num) references location(loc_num),
	constraint pk_jobposting_jobloc primary key(loc_num,job_posting_num)
)

drop table job_loc cascade constraint;

insert into JOB_LOC(job_posting_num, loc_num) values(1001, 501);
insert into JOB_LOC(job_posting_num, loc_num) values(1002, 502);

select * from job_loc;
----------------------------------------------------------------------

--지역종류와 구직회원 복합키 설정
create table portfolio_loc(
	normal_id varchar2(100),
	loc_num number,
	constraint fk_id_loc foreign key(normal_id) references portfolio(normal_id),
	constraint fk_loc_pf foreign key(loc_num) references location(loc_num),
	constraint pk_id_loc_pf primary key(loc_num,normal_id)
)
drop table portfolio_loc cascade constraint;

insert into PORTFOLIO_LOC(normal_id, loc_num) values('yosep', 501);
insert into PORTFOLIO_LOC(normal_id, loc_num) values('yosep', 503);
insert into PORTFOLIO_LOC(normal_id, loc_num) values('MCW', 502);
insert into PORTFOLIO_LOC(normal_id, loc_num) values('MCW', 503);

select * from portfolio_loc;
-----------------------------------------------------------------------

-- 개발분야와 PK 시퀀스
create table development_category(
	dev_cat_num number primary key,
	rc_num number not null,
	dev_cat_name varchar2(100) not null,
	constraint fk_dev_num foreign key(rc_num) references recruitment_category(rc_num)
)

create sequence dev_cat_num_seq start with 201;

drop table development_category cascade constraint;
drop sequence dev_cat_num_seq;

insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 101, 'Java');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 101, 'jsp');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 101, 'php');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 101, 'Ajax');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 101, '.NET');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 101, 'ASP');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 102, 'Java');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 102, 'C');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 102, 'C++');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 102, 'C#');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 102, '안드로이드');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 102, '아이폰');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 102, 'Linux');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 102, 'Python');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 102, '.NET');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 103, '임베디드');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 103, '펌웨어');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 103, 'PLC');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 104, '웹 퍼블리셔');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 104, 'HTML5');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 104, 'JavaScript');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 104, 'CSS3');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 104, 'UI/UX');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 105, '네트워크 관리');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 105, '서버 관리');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 105, '시스템 운영');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 106, 'DBA');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 106, 'SQL');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 107, '게임 개발');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 107, '게임 기획');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 107, '게임 디자인');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 107, '게임 운영');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 108, '빅데이터');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 108, '인공지능(AI)');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 108, '데이터 분석');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 108, '사물인터넷(IOT)');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 109, '시스템 설계');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 109, '시스템 분석');
insert into DEVELOPMENT_CATEGORY(dev_cat_num, rc_num, dev_cat_name) values(dev_cat_num_seq.nextval, 109, '시스템 엔지니어');

select * from development_category;
----------------------------------------------------------------------

-- 개발분야와 구인공고글 복합키 설정
create table job_dev(
	job_posting_num number,
	dev_cat_num number,
	constraint fk_job_posting_num5 foreign key (job_posting_num) references job_posting(job_posting_num),
	constraint fk_dev_job foreign key(dev_cat_num) references development_category(dev_cat_num),
	constraint pk_jobposting_jobdev primary key(dev_cat_num,job_posting_num)
)

drop table job_dev cascade constraint;

insert into JOB_DEV(job_posting_num, dev_cat_num) values(1001, 201);
insert into JOB_DEV(job_posting_num, dev_cat_num) values(1001, 202);
insert into JOB_DEV(job_posting_num, dev_cat_num) values(1001, 204);
insert into JOB_DEV(job_posting_num, dev_cat_num) values(1001, 225);
insert into JOB_DEV(job_posting_num, dev_cat_num) values(1001, 226);
insert into JOB_DEV(job_posting_num, dev_cat_num) values(1002, 227);
insert into JOB_DEV(job_posting_num, dev_cat_num) values(1002, 228);

select * from job_dev;
----------------------------------------------------------------------

-- 개발분야와 구직회원 복합키 설정
create table portfolio_dev(
	normal_id varchar2(100),
	dev_cat_num number,
	constraint fk_id_dev foreign key(normal_id) references portfolio(normal_id),
	constraint fk_dev_pf foreign key(dev_cat_num) references development_category(dev_cat_num),
	constraint pk_id_dev_pf primary key(dev_cat_num,normal_id)
)
drop table portfolio_dev cascade constraint;

insert into PORTFOLIO_DEV(normal_id, dev_cat_num) values('yosep', 202);
insert into PORTFOLIO_DEV(normal_id, dev_cat_num) values('yosep', 203);
insert into PORTFOLIO_DEV(normal_id, dev_cat_num) values('yosep', 227);
insert into PORTFOLIO_DEV(normal_id, dev_cat_num) values('MCW', 201);
insert into PORTFOLIO_DEV(normal_id, dev_cat_num) values('MCW', 234);

select * from portfolio_dev;
----------------------------------------------------------------------

-- 학력구분과 PK 시퀀스
create table academic_category(
	academic_num number primary key,
	academic_name varchar2(100) not null
)
create sequence academic_num_seq start with 401;

drop table academic_category cascade constraint;
drop sequence academic_num_seq;

insert into ACADEMIC_CATEGORY(academic_num, academic_name) values(academic_num_seq.nextval, '고졸');
insert into ACADEMIC_CATEGORY(academic_num, academic_name) values(academic_num_seq.nextval, '초대졸');
insert into ACADEMIC_CATEGORY(academic_num, academic_name) values(academic_num_seq.nextval, '대졸');
insert into ACADEMIC_CATEGORY(academic_num, academic_name) values(academic_num_seq.nextval, '석사졸업');
insert into ACADEMIC_CATEGORY(academic_num, academic_name) values(academic_num_seq.nextval, '박사졸업');

select * from academic_category;
----------------------------------------------------------------------

-- 학력구분과 구인공고글 복합키 설정
create table job_academic(
	job_posting_num number,
	academic_num number,
	constraint fk_job_posting_num6 foreign key(job_posting_num) references job_posting(job_posting_num),
	constraint fk_academic_job foreign key(academic_num) references academic_category(academic_num),
	constraint pk_jobposting_jobacademic primary key(academic_num,job_posting_num)
)
drop table job_academic cascade constraint;

insert into JOB_ACADEMIC(job_posting_num, academic_num) values(1001, 402);
insert into JOB_ACADEMIC(job_posting_num, academic_num) values(1002, 403);

select * from job_academic;
----------------------------------------------------------------------

-- 학력구분과 구직회원 복합키 설정
create table portfolio_academic(
	normal_id varchar2(100),
	academic_num number,
	constraint fk_id_aca foreign key(normal_id) references portfolio(normal_id),
	constraint fk_aca_pf foreign key(academic_num) references academic_category(academic_num),
	constraint pk_id_aca_pf primary key(academic_num,normal_id)
)
drop table portfolio_academic cascade constraint;

insert into PORTFOLIO_ACADEMIC(normal_id, academic_num) values('yosep', 403);
insert into PORTFOLIO_ACADEMIC(normal_id, academic_num) values('MCW', 404);

select * from portfolio_academic;

commit


