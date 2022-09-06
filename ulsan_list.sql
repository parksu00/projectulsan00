--1)
drop table contents_review;
drop table contents;



--공연전시목록
create table contents(
				cmt20id VARCHAR2(11),
				cmenu VARCHAR2(11),
				cprfnm CLOB,
				cposter CLOB,
				cprfpdfrom DATE,
				cprfpdto DATE,
				prfruntime CLOB,
				dtguidance CLOB,
				centrpsnm VARCHAR2(20),
				cfcltynm CLOB,
				cprfage VARCHAR2(20),
				csty CLOB,
				cpcseguidance VARCHAR2(80)
);

--기본키/제약
alter table contents add constraint contents_id_pk primary key (cmt20id);
alter table contents modify cprfnm constraint contents_title_nn not null;
alter table contents modify cmt20id constraint contents_id_nn not null;

--공연전시한줄평
create table contents_review(
            cre_id VARCHAR2(11),
            c_id VARCHAR2(11),
            nickname VARCHAR2(30),
            cre_review CLOB,
			c_cdate TIMESTAMP,
			c_udate TIMESTAMP
);

--기본키/제약
alter table contents_review add constraint review_cre_id_pk primary key (cre_id);
alter table contents_review modify cre_id constraint contents_review_cre_id_nn not null;


--외래키
alter table contents_review add constraint contents_review_c_id_fk 
        FOREIGN key(c_id) references contents(cmt20id);

commit;


--2)

--공연전시목록 임시데이터
insert into contents values('PF197254', '공연', '제2회 리틀 아티스트 콘서트', 'http://www.kopis.or.kr/upload/pfmPoster/PF_PF197254_220830_105936.jpg', '2022.08.29', '2022.08.29', '1시간 20분', '월요일(19:30)', '해당정보없음', '롯데콘서트홀 (롯데콘서트홀)', '만 7세 이상', 'http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF197254_220830_1059360.jpg', '20,000원');
insert into contents values('PF197218', '공연', 'SAC on screen, 굿모닝 독도 [제주]', 'http://www.kopis.or.kr/upload/pfmPoster/PF_PF197218_220829_153237.jpg', '2022.08.26', '2022.09.06', '1시간 50분', '화요일(15:00)', '해당정보없음', '제주문예회관', '만 5세 이상', 'http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF197218_220829_0419510.jpg', '전석 무료');
insert into contents values('PF197207', '공연', '찾아가는 Let’s DMZ [이천]', 'http://www.kopis.or.kr/upload/pfmPoster/PF_PF197207_220829_150949.jpg', '2022.08.27', '2022.08.27', '1시간 20분', '월토요일(15:00)', '해당정보없음', '이천아트홀', '만 7세 이상', 'http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF197207_220829_0309490.jpg', '전석 무료');
insert into contents values('PF197197', '공연', '우리 소리 축제 하하하, 안해본소리 프로젝트', 'http://www.kopis.or.kr/upload/pfmPoster/PF_PF197254_220830_105936.jpg', '2022.08.26', '2022.08.26', '1시간 30분', '월요일(19:30)', '해당정보없음', '롯데콘서트홀 (롯데콘서트홀)', '만 7세 이상', 'http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF197254_220830_1059360.jpg', '전석 무료');
insert into contents values('PF197161', '공연', '동,서양의 음악을 핫하고 힙하게!', 'http://www.kopis.or.kr/upload/pfmPoster/PF_PF197161_220829_133411.jpg', '2022.08.30', '2022.08.30', '1시간 20분', '화요일(19:30)', '해당정보없음', '고양아람누리', '만 6세 이상', 'http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF197254_220830_1059360.jpg', '전석 무료');


--공연전시한줄평 임시데이터
insert into contents_review values('1', 'PF197254', '1번', '재밌어요','05-01-03','05-01-03');
insert into contents_review values('2', 'PF197218', '2번', '좋아요','05-01-03','05-01-03');
insert into contents_review values('3', 'PF197207', '3번', '아주 멋집니다. 즐거웠어요.','05-01-03','05-01-03');
insert into contents_review values('4', 'PF197197', '4번', '별로였어요. 공연장이 멀어요.','05-01-03','05-01-03');
insert into contents_review values('5', 'PF197161', '5번', '인정~','05-01-03','05-01-03');

commit;

select * from contents;
select * from contents_review;

desc contents;
desc contents_review;

update contents
   set cmenu = '분류',
        cprfnm = '컨텐츠명',
        cposter = '이미지경로',
        cprfpdfrom = '2022.08.29',
        cprfpdto =  '2022.08.29',
        prfruntime = '런타임',
        dtguidance = '시간',
        centrpsnm = '기획/제작사',
        cfcltynm = '장소',
        cprfage = '관람연령',
        csty = '내용',
        cpcseguidance = '비용'
 where cmt20id = 'PF197254';