--사용자(회원)정보를 저장할 테이블
create table users(
	id varchar2(100) primary key,
	pwd varchar2(100) not null,
	email nvarchar2(100),
	profile varchar2(100), -- 프로필 이미지 경로를 저장할 칼럼
	regdate date
);

-- 업로드된 파일의 정보를 저장할 테이블
create table board_file(
	num number primary key,
	writer varchar2(100) not null,
	title varchar2(100) not null,
	orgFileName varchar2(100) not null, -- 원본 파일명
	saveFileName varchar2(100) not null,-- 서버에 실제로 저장된 파일명
	fileSize number not null, --파일의 크기
	regdate date
);

create sequence board_file_seq;