--사용자(회원)정보를 저장할 테이블
create table users(
	id varchar2(100) primary key,
	pwd varchar2(100) not null,
	email nvarchar2(100),
	profile varchar2(100), -- 프로필 이미지 경로를 저장할 칼럼
	regdate date
);