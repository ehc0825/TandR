drop table movie cascade constraints;
CREATE table MOVIE
(
movieCode NUMBER PRIMARY KEY NOT NULL, -- 영화코드
movieTitle VARCHAR2(500), -- 영화 제목
movieTag NUMBER, -- 1이면 상영종료, 2- 상영중 3- 상영예정
releaseDate DATE, -- 개봉일
cDate DATE, -- 상영종료일
director VARCHAR2(500), --감독
actor VARCHAR2(500), --출연 배우
movieInfo VARCHAR2(500), -- 영화 정보
movieContent VARCHAR2(4000), --줄거리
movieGrade NUMBER(10), -- 영화 등급
poster VARCHAR2(1000), -- 포스터
movieStar NUMBER(10), -- 평점
runningTime NUMBER(10), -- 상영시간
moviePrice NUMBER(10), -- 영화 가격
movieDel VARCHAR2(2) NOT NULL, -- 영화 삭제
movieGenre VARCHAR2(500) -- 장르
);


delete from movie;
insert into movie values(01,'SPIDER MAN',2,'2021-11-10','2021-12-14','마우로 피오레', '톰 홀랜드','스파이더맨: 노 웨이 홈은 마블 시네마틱 유니버스의 27번째 장편 영화다. <br>마블 스튜디오 스파이더맨 시리즈의 3번째 작품이자 마지막 시리즈이다.',
'정체가 탄로난 스파이더맨 피터 파커(톰 홀랜드)가 문제를 해결하기 위해 닥터 스트레인지(베네딕트 컴버배치)의 
<br>도움을 받던 중 뜻하지 않게 멀티버스가 열리게 되고, 이를 통해 닥터 옥토퍼스(알프리드 몰리나) 등 
<br>각기 다른 차원의 숙적들이 나타나며 사상 최악의 위기를 맞게 되는 이야기를 그린 마블 액션 블록버스터.',12,'spiderman.jpg',5,159,10000,'1','히어로/액션');

insert into movie values(02,'ETERNALS',2,'2021-11-03','2021-12-01','클로이 자오', '젬마 찬','마블의 초인이자 히어로 집단인 이터널스를 소개하는 영화. <br>마블 시네마틱 유니버스 페이즈 4의 일곱 번째 작품이자 세 번째 영화다.',
'마블 스튜디오의 는 수 천년에 걸쳐 그 모습을 드러내지 않고 살아온 불멸의 히어로들이 이후 인류의 가장 오래된 적 
<br>데비안츠에 맞서기 위해 다시 힘을 합치면서 벌어지는 이야기',12,'ETERNALS.jpg',4,156,12000,'1','히어로/드라마');

insert into movie values(03,'VENOM 2',2,'2021-11-04', '2021-12-05','앤디 서커스', '톰 하디','베놈 실사영화 시리즈의 2번째 작품이자, 소니 스파이더맨 유니버스의 2번째 작품이다.',
'베놈과 완벽한 파트너가 된 에디 브록(톰 하디) 앞에 클리터스 캐서디(우디 해럴슨)가 카니지로 등장, 
<br>앞으로 닥칠 대혼돈의 세상을 예고한다. 대혼돈의 시대가 시작되고,악을 악으로 처단할 것인가',15,'Venom 2.jpg',3,97,9000,'1','안티히어로');

insert into movie values(04,'듄',2,'2021-10-20','2021-12-01','드니 빌뇌브', '티모시 샬라메','1984년작 듄 이후 37년 만에 개봉하는 듄 시리즈의 신작 영화다.',
'10191년, 아트레이데스 가문의 후계자인 폴(티모시 샬라메)은 시공을 초월한 존재이자 
<br>전 우주를 구원할 예지된 자의 운명을 타고났다. 그리고 어떤 계시처럼 매일 꿈에서 아라키스 행성에 있는 한 여인을 만난다.
<br>모래언덕을 뜻하는 듄이라 불리는 아라키스는 물 한 방울 없는 사막이지만 우주에서 가장 비싼 물질인 
<br>신성한 환각제 스파이스의 유일한 생산지로 이를 차지하기 위한 전쟁이 치열하다. 황제의 명령으로 폴과 아트레이데스 가문은 
<br>죽음이 기다리는 아라키스로 향하는데…위대한 자는 부름에 응답한다, 두려움에 맞서라, 이것은 위대한 시작이다!',12,'DUNE.jpg',5,155,10000,'1','SF/판타지');

insert into movie values(05,'The Addams Family 2',2,'2021-11-10','2021-12-30','그렉 티어난', '오스카 아이작','아담스 패밀리의 속편',
'호러블리 사춘기 아이들과 떠나는 위험천진난만 패밀리 어드벤처!평범함과는 거리가 먼 
<br>호러블리 아담스 패밀리에게 닥친 최대 위기.아이들은 사춘기에 접어들고, 권태로운 가족 분위기에 위기를 느낀 
<br>아빠 ‘고메즈’와 엄마 ‘모티시아’는 가족들의 화합을 위해나이아가라 폭포에서 그랜드 캐니언까지 미국을 가로지르는 가족 여행을 떠난다. 
<br>하지만, 어쩐지 태생부터 남달랐던 ‘웬즈데이’의 놀라운 비밀이 밝혀지면서‘웬즈데이’의 사춘기는 절정에 이르고,
<br>아담스 패밀리의 여행은 점점 더 신나고, 점점 더 절망적인 상황으로 치닫는데…',0,'TheAddamsFamily2.jpg',3,93,8000,'1','애니메이션/코미디');

insert into movie values(06, '장르만 로맨스', 2, '2021-11-17', '2021-12-25', '조은지', '류승룡','2021년 11월 17일에 개봉한 한국 영화. 배우 조은지의 장편 연출 데뷔작이다.',
'베스트셀러 작가 김현은 화제작 이후 7년동안 새로운 신작을 내놓지 못해 슬럼프에 빠져 있었고 
<br>불륜으로 전처와 이혼하고 지금의 아내와 재혼하면서 새로운 미래를 시작하지만 
<br>아내는 딸을 출산한 후 딸의 교육을 위해 미국 유학을 떠나버려 때늦은 기러기 아빠 신세가 됩니다. 
<br>여전히 신작에 대한 갈피를 잡지 못하고 엉망으로 생활하던 김현은 대학교에서 자신을 좋아한다며 따라다니는 유진을 만나게 되고 
<br>유진은 김현에게 자신의 신작을 보여주는데...',15,'장르만로맨스.jpg',4,113,9000,'1','드라마/코미디');

insert into movie values(11, '더 배트맨(2022)', 3, '2022-03-04', '2022-05-05', '맷 리브스', '로버트 패틴슨','DC 코믹스의 배트맨 시리즈를 원작으로 진행되는 배트맨 실사영화 시리즈의 16번째 영화',
'없음',15,'TheBatman.jpg',5,999,12000,'1','히어로/액션');
insert into movie values(12, '닥터스트레인지(2022)', 3, '2022-05-06', '2022-07-07', '샘 레이미', '베네딕트 컴버배치','마블 시네마틱 유니버스 페이즈 4의 5번째 영화이자, 
<br>닥터 스트레인지 실사영화 시리즈의 2번째 작품이다.',
'없음',12,'DoctorStrange.jpg',4,999,12000,'1','히어로/판타지');
insert into movie values(13, 'AVATAR 2', 3, '2022-12-16', '2023-03-03', '제임스 카메론', '샘 워딩턴','영화 아바타 시리즈의 2번째 영화이자 아바타의 13년 만의 속편, 감독은 제임스 카메론',
'없음',12,'AVATAR2.jpg',4,999,12000,'1','SF/판타지');
insert into movie values(14, '매트릭스: 리저렉션', 3, '2021-12-22', '2022-02-02', '라나 워쇼스키', '키아누 리브스','매트릭스의 파이널이었던 3편 레볼루션이 2003년 개봉하며 막을 내린 이후 무려 18년 만에 돌아오는 
<br>키아누 리브스 주연의 매트릭스 시리즈 네 번째 작품이다.',
'없음',18,'TheMatrixResurrections.jpg',4,999,12000,'1','SF/액션');

insert into movie values(21,'Les Misérables',1,'2012-11-04', '2021-12-15','톰 후퍼', '휴 잭맨','시대를 뛰어넘는 감동의 메시지!<br>
사랑과 용서, 구원과 희망의 대서사시가 시작된다!'
,'굶주린 조카들을 위해 빵 한 조각을 훔친 죄로 19년의 감옥살이를 한 <br>
장발장(휴 잭맨)은 전과자라는 이유만으로 모두의 박해를 받는다. <br>
세상에 버림받은 장발장은 교회의 은식기에 손을 대지만 <br>
주교는 그를 용서하고 남은 은촛대까지 건네주며 바르게 살라고 당부한다.<br>'
,12,'Les Misérables.jpg',5,158,15000,'1','드라마/뮤지컬');

insert into movie values(22, '싱 스트리트', 1, '2016-05-19', '2016-07-08', '존 카니', '퍼디아 월시-필로'
,'두.근.두.근! 처음 만난 사랑, 처음 만든 음악!'
,'코너는 전학을 가게 된 학교에서 모델처럼 멋진 라피나를 보고 <br>
첫 눈에 반해 사랑에 빠진다. <br>
라피나에게 잘 보이고 싶은 마음에 덜컥 밴드를 하고 있다는<br>
거짓말을 한 코너는 급기야 뮤직비디오 출연까지 제안하고 승낙을 얻는다.<br>
날아갈 것만 같은 기분도 잠시, 코너는 어설픈 멤버들을 모아 ‘싱 스트리트’라는 <br>
밴드를 급 결성하고 듀란듀란, 아-하, 더 클래쉬 등 집에 있는 <br>
음반들을 찾아가며 음악을 만들기 시작한다. <br>',15,'SingStreet.jpg',3,106,9000,'1','드라마/로맨스');

insert into movie values(23, '레옹', 1, '1995-05-02', '2020-06-11', '뤽 베송', '나탈리 포트만'
,'“사랑해요. 내 첫사랑 레옹.”_마틸다 <br> 
“나도 행복해 지고 싶어. 잠도 자고, 뿌리도 내릴 꺼야.”_레옹 <br>'
,'한 손엔 우유 2팩이 든 가방, 다른 한 손엔 화분을 들고 뿌리 없이 떠도는 킬러 레옹은 <br>
어느 날 옆집 소녀 마틸다의 일가족이 몰살 당하는 것을 목격한다.<br>
그 사이 심부름을 갔다 돌아 온 마틸다는 가족들이 처참히 몰살 당하자 레옹에게 도움을 청한다.<br>
가족의 원수를 갚기 위해 킬러가 되기로 결심한 12세 소녀 마틸다는<br>
레옹에게 들을 알려주는 대신 복수하는 법을 배우게 된다.<br>
드디어 그녀는 가족을 죽인 사람이 부패 마약 경찰 스탠스임을 알게 되고,<br>
그의 숙소로 향하게 되는데… <br>',19,'Léon.jpg',5,110,13000,'1','범죄/드라마');

insert into movie values(24, '장고: 분노의 추적자', 1, '2013-03-21', '2013-06-10', '쿠엔틴 타란티노', '레오나르도 디카프리오'
,'쿠엔틴 타란티노 감독의 영화. 제작사는 와인스타인 컴퍼니. 배급은 콜럼비아 픽처스.<br>
1966년작 《쟝고》를 오마주했지만 원작의 개념은 아니다. 해당 영화의 사운드트랙이 <br>
일부 사용되는 걸 제외하면 완전히 다른 영화다'
,'1850년대 미국 남부, 현상금 사냥꾼인 닥터 킹 슐츠(크리스토프 왈츠)에게 도움을 준 대가로<br>
자유를 얻게 된 흑인 노예 장고(제이미 폭스)는 닥터 킹 슐츠와 함께 현상금 사냥꾼 일을 시작한다.<br>
매일 무섭게 사냥 기술을 연마하는 장고의 목표는 오직 하나, 오래 전 다른 곳의 노예로 팔려간 <br>
아내를 찾아내 구하는 것이다. 장고는 집요한 추적 끝에 아내가 <br>
악덕 농장주 칼뱅 칸디에(레오나르도 디카프리오)의 손에 있다는 정보를 얻게 되고 그의 농장으로 향한다. <br>
그리고 그곳에서 아내의 탈출을 위해 힘겨운 싸움을 시작하게 되는데…',18,'DjangoUnchained.jpg',4,165,10000,'1','액션/드라마');

insert into movie values(25, '다크 나이트', 1, '2008-08-16', '2009-01-01', '크리스토퍼 놀란', '크리스찬 베일, 마이클 케인, 히스 레저'
,'이 도시에 정의는 죽었다! 범죄와 부정부패를 제거하여 고담시를 지키려는 배트맨(크리스찬 베일).<br>
그는 짐 고든 형사(게리 올드만)와 패기 넘치는 고담시 지방 검사 하비 덴트(아론 에크하트)와 함께<br>
도시를 범죄 조직으로부터 영원히 구원하고자 한다.'
,'배트맨을 죽여라! 세 명의 의기투합으로 위기에 처한 악당들이 모인 자리에 보라색 양복을 입고 얼굴에<br>
짙게 화장을 한 괴이한 존재가 나타나 ‘배트맨을 죽이자’는 사상 초유의 제안을 한다.<br>
그는 바로 어떠한 룰도, 목적도 없는 사상 최악의 악당 미치광이 살인광대 ‘조커’(히스 레저).<br>
마침내 최강의 적을 만나다! 배트맨을 죽이고 고담시를 끝장내버리기 위한 조커의 광기 어린 행각에 도시는 혼란에 빠진다.<br>
조커는 배트맨이 가면을 벗고 정체를 밝히지 않으면 멈추지 않겠다며 점점 배트맨을 조여온다. <br>
한편, 배트맨은 낮엔 기업의 회장으로, 밤에는 가면을 쓴 배트맨으로 밤과 낮의 정체가<br>
다른 자신과 달리 법을 통해 도시를 구원하는 하비 덴트야말로 진정한 영웅이 아닐까 생각하게 된다.<br>
밤의 기사, 그 전설의 서막이 열린다! 조커를 막기 위해 직접 나서 영원히 존재를 감춘 밤의 기사가 될 것인가.<br>
하비 덴트에게 모든 걸 맡기고 이제 가면을 벗고 이중 생활의 막을 내릴 것인가.<br>
갈림길에 선 그는 행동에 나서야만 하는데… 사상 최강, 운명을 건 대결은 이제부터 시작이다!',18,'TheDarkKnight.jpg',5,152,11000,'1','슈퍼히어로/범죄');

insert into movie values(26, '파이트 클럽', 1, '1999-11-13', '2000-02-01', '데이비드 핀처', '브래드 피트, 에드워드 노튼'
,'당신이 알고 있는 모든 것은 허구다!<br>
믿어왔던 상식과 규칙에 통렬한 카운터를 날리는 스타일리시 액션 무비!'
,'비싼 가구들로 집 안을 채우지만 삶에 강한 공허함을 느끼는 자동차 리콜 심사관 ‘잭’.<br>
거부할 수 없는 매력의 거친 남자 ‘테일러 더든’과의 우연한 만남으로 본능이 이끄는 대로 삶을 살기로 결심한다.<br>
어느 날, “싸워봐야 네 자신을 알게 된다”라는 테일러 더든의 말에 통쾌한 한 방을 날리는 잭.<br>
두 사람은 여태껏 경험해보지 못한 강렬한 카타르시스를 느끼며 ‘파이트 클럽’이라는 비밀 조직을 결성하고, <br>
폭력으로 세상에 저항하는 거대한 집단이 형성된다. 하지만, 걷잡을 수 없이 커진 ‘파이트 클럽’은<br>
시간이 지날수록 의미가 변질되고, 잭과 테일러 더든 사이의 갈등도 점차 깊어져 가는데…<br>
올가을, 거침없는 진짜 남자들의 진짜 싸움이 시작된다!',18,'FightClub.jpg',4,139,10000,'1','드라마');

insert into movie values(27, '킹스맨: 시크릿 에이전트', 1, '2015-02-11', '2015-04-01', '매튜 본', '콜린 퍼스, 태런 에저튼'
,'세상에서 가장 위험한 면접이 시작된다!'
,'전설적 베테랑 요원 해리 하트(콜린 퍼스)는 경찰서에 구치된 에그시(태런 애거튼)를 구제한다.<br>
탁월한 잠재력을 알아본 그는 에그시를 전설적 국제 비밀정보기구 ‘킹스맨’ 면접에 참여시킨다.<br>
아버지 또한 ‘킹스맨’의 촉망 받는 요원이었으나 해리 하트를 살리기 위해 죽었다는 사실을 알게 된 에그시.<br>
목숨을 앗아갈 만큼 위험천만한 훈련을 통과해야 하는 킹스맨 후보들.<br>
최종 멤버 발탁을 눈 앞에 둔 에그시는 최고의 악당 발렌타인(사무엘 L. 잭슨)을 마주하게 되는데…',18,'KingsmanTheSecretService.jpg',5,129,11000,'1','액션/코미디');

insert into movie values(28, '인터스텔라', 1, '2014-11-06', '2020-12-03', '크리스토퍼 놀란', '매튜 매커너히, 앤 해서웨이'
,'“우린 답을 찾을 거야, 늘 그랬듯이”<br>
세계 각국의 정부와 경제가 완전히 붕괴된 미래가 다가온다.'
,'지난 20세기에 범한 잘못이 전 세계적인 식량 부족을 불러왔고, NASA도 해체되었다.<br>
이때 시공간에 불가사의한 틈이 열리고, 이를 탐험해 인류를 구해야 할 남은 자들에게 지워진다.<br>
사랑하는 가족들을 뒤로 한 채 인류라는 더 큰 가족을 위해, 그들은 이제 희망을 찾아 우주로 간다.<br>
그리고 우린 답을 찾을 것이다. 늘 그랬듯이…',12,'Interstellar.jpg',5,169,11000,'1','SF');

insert into movie values(29, '반지의 제왕: 반지 원정대', 1, '2002-01-01', '2021-03-11', '피터 잭슨', '일라이저 우드, 이안 맥켈런, 비고 모텐슨'
,'마지막 반지를 차지하는 자, 모든 힘을 지배하게 될 것이다!'
,'시간과 공간을 알 수 없는 까마득한 옛날... 전지전능한 능력을 보유한 위대한 신들은 엘프족과 난쟁이족,<br>
그리고 인간 종족을 자신들의 첫번째 세계 속에 창조하여 평화로운 삶을 살게 하였다.  <br>
많은 세월이 지나고 오랜 동안 악의 힘에 동화된 신 사우론은 절대 악의 힘을 빌어 <br>
다른 신들에 대항하며 그들이 창조해 놓은 모든 세계를 자신의 것으로 만들 계략을 세우게 된다. <br>
그러나 사우론의 계약을 알게 된 나머지 신들은 타락한 사우론을 신의 세계에서 추방하였고 <br>
모든 세력과 힘을 잃게 된 사우론은 인간들의 세상에 나타나 어리석은 인간들을 유혹해 위대한 신들에게 도전하게 만든다. <br>
신적인 힘을 거의 잃은 사우론은 인간 세계에 존재하는 전설적인 마법 반지들의 소문을 듣게 되고<br>
그 11개의 반지들을 지배하기 위해 자신의 남은 모든 힘을 실은 12번째 ‘절대 반지’를 만들어 신들을 위협한다. ',12,'TheLordoftheRings.jpg',5,228,12000,'1','판타지/모험');

insert into movie values(30, '어벤져스: 엔드게임', 1, '2019-04-24', '2019-11-11', '앤서니 루소, 조 루소', '로버트 다우니 주니어, 크리스 에반스'
,'인피니티 워 이후 절반만 살아남은 지구 마지막 희망이 된 어벤져스<br>
먼저 떠난 그들을 위해 모든 것을 걸었다!'
,'클린트는 캡틴 아메리카: 시빌 워에서 소코비아 협정을 위반한 죄로 가택 연금 중이지만 딸에게 활을 쏘는 법을 가르쳐 주며<br>
가족들과 단란한 시간을 보내고 있다. 그런데 점심을 먹으려고 화살을 챙기고 뒤를 돌아본 순간 가족들은 온데간데 없어졌고<br>
그들이 있던 자리에는 먼지만 휘날리고 있다. 바로 타노스가 손가락을 튕긴 순간이었기 때문..',12,'AvengersEndgame.jpg',5,189,12000,'1','슈퍼히어로');






drop table reservation cascade constraints;
CREATE table RESERVATION
(
rsCode NUMBER PRIMARY KEY NOT NULL,-- 예약 코드 
nsCode NUMBER, -- 상영 코드
movieCode NUMBER, -- 영화코드
seats VARCHAR2(20), --좌석
id VARCHAR2(20), -- 아이디
ticketCode NUMBER, -- 티켓코드
finalPrice NUMBER(10), -- 최종 영화값
rsCheck VARCHAR2(2) default 'n', -- 예약 확인
shCheck VARCHAR2(2) default 'n', -- 시청 확인
rvCheck VARCHAR2(2) default 'n' -- 리뷰 확인
);

drop table Review cascade constraint;
create table Review( -- 리뷰게시판
    rvNum NUMBER primary Key, --리뷰게시판번호
    rvTitle VARCHAR2(50), --리뷰게시판 제목
    rvContent VARCHAR2(4000), --리뷰게시판 내용
    id VARCHAR2(20), --사용자 id
    rvStar NUMBER, -- 평점
    rvPhoto VARCHAR2(100), -- 리뷰 사진
    rsCode NUMBER, -- 예약번호
    rvlike NUMBER, -- 좋아요
    rvDate DATE, -- 게시글 작성 날
    rvDel VARCHAR2(2) default 'n', -- 게시글 삭제
    movieCode number, -- 영화코드
    rvReadCount NUMBER, -- 리뷰 조회수
    movieTitle VARCHAR2(100) -- 영화 제목
);


delete from RESERVATION;
delete from review;

insert into RESERVATION values(1,2,01,'A1','babo12',1,10000,'y','y','y');
insert into review values(1, '이거 개노잼임 ㅋㅋ', '이런거 왜 봄 ㅋㅋ', 'babo12', 1, null, 1, 0, sysdate, 'n', 01, 0, 'SPIDER MAN');
insert into RESERVATION values(2,10,02,'A1','babo12',2,12000,'y','y','y');
insert into review values(2, '이거 개잼임 ㅋㅋ', '낚였노 이거 쓰레기임', 'babo12', 5, null, 2, 0, sysdate, 'n', 02, 0, 'ETERNALS');
insert into RESERVATION values(3,13,03,'A1','babo12',3,9000,'y','y','y');
insert into review values(3, '오 재밌음 이거', '그냥저냥임', 'babo12', 3, null, 1, 0, sysdate, 'n', 03, 0, 'VENOM 2');
insert into RESERVATION values(4,18,04,'A1','babo12',4,10000,'y','y','y');
insert into review values(4, '꿀잼', '사실아님', 'babo12', 2, null, 4, 0, sysdate, 'n', 04, 0, '듄');
insert into RESERVATION values(5,88,05,'A1','babo12',5,8000,'y','y','y');
insert into review values(5, '노잼이다', 'ㄹㅇㅋㅋ', 'babo12', 1, null, 5, 0, sysdate, 'n', 05, 0, 'The Addams Family 2');
insert into RESERVATION values(6,133,06,'A1','babo12',6,9000,'y','y','y');
insert into review values(6, '니네 이거 보지마라', '제발ㅋㅋ', 'babo12', 1, null, 6, 0, sysdate, 'n', 06, 0, '장르만 로맨스');
insert into RESERVATION values(7,2,01,'A2','babo11',7,10000,'y','y','y');
insert into review values(7, '슉슈슈슉', '이런거 왜 봄 ㅋㅋ', 'babo11', 4, null, 7, 0, sysdate, 'n', 01, 0, 'SPIDER MAN');
insert into RESERVATION values(8,2,01,'A3','babo11',7,10000,'y','y','y');
insert into review values(8, '아니 이게 머임', '이런거 왜 봄 ㅋㅋ', 'babo123', 2, null, 8, 0, sysdate, 'n', 01, 0, 'SPIDER MAN');
insert into RESERVATION values(9,2,01,'A4','babo12',7,10000,'y','y','y');
insert into review values(9, '이거 개노잼임 ㅋㅋ', '이런거 왜 봄 ㅋㅋ', 'babo13', 1, null, 9, 0, sysdate, 'n', 01, 0, 'SPIDER MAN');
insert into RESERVATION values(10,10,02,'A2','babo11',8,12000,'y','y','y');
insert into review values(10, '재미없다 ㅋㅋㅋ', '이거 쓰레기임', 'babo11', 5, null, 10, 0, sysdate, 'n', 02, 0, 'ETERNALS');
insert into RESERVATION values(11,888,26,'A1','babo123',9,10000,'y','y','y');
insert into review values(11, '명작임', 'ㅋㅋ', 'babo123', 5, null, 11, 0, sysdate, 'n', 26, 0, '파이트 클럽');
insert into RESERVATION values(12,889,27,'A1','babo1234',10,10000,'y','y','y');
insert into review values(12, '너무야함', 'ㅋㅋ', 'babo123', 4, null, 12, 0, sysdate, 'n', 27, 0, '킹스맨: 시크릿 에이전트');
insert into RESERVATION values(13,878,28,'A1','babo123',11,11000,'y','y','y');
insert into review values(13, '어려움 ㅋㅋ', 'ㅋㅋ', 'babo123', 3, null, 13, 0, sysdate, 'n', 28, 0, '인터스텔라');
insert into RESERVATION values(14,874,30,'A1','babo123',12,12000,'y','y','y');
insert into review values(14, '머야 엔딩 이상해', 'ㅋㅋ', 'babo123', 5, null, 14, 0, sysdate, 'n', 30, 0, '어벤져스: 엔드게임');
insert into RESERVATION values(15,999,21,'A1','babo123',13,15000,'y','y','y');
insert into review values(15, '개졸림 이거', 'ㅋㅋ', 'babo123', 2, null, 15, 0, sysdate, 'n', 21, 0, 'Les Misérables');


drop table theater cascade constraints;
CREATE table THEATER
(
theaterCode NUMBER PRIMARY KEY NOT NULL, -- 영화관 코드
theaterLoc  VARCHAR2(20), -- 영화관 위치
theaterName VARCHAR2(20) -- 영화관 이름
);

delete from theater;
insert into THEATER values(01,'강남','CGV');
insert into THEATER values(02,'강남','메가박스');
insert into THEATER values(03,'고양','CGV');
insert into THEATER values(04,'고양','롯데시네마');


drop table screen cascade constraints;
CREATE table SCREEN
(
screenCode NUMBER PRIMARY KEY NOT NULL, -- 상영관코드
screenTime NUMBER(10), -- 상영 시간 -- 좌석
screenNum NUMBER -- 몇관인지 
);

delete from screen;
insert into SCREEN values(01,'0800',01);
insert into SCREEN values(02,'1100',01);
insert into SCREEN values(03,'1400',01);
insert into SCREEN values(04,'1700',01);
insert into SCREEN values(05,'2000',01);
insert into SCREEN values(06,'0800',02);
insert into SCREEN values(07,'1100',02);
insert into SCREEN values(08,'1400',02);
insert into SCREEN values(09,'1700',02);
insert into SCREEN values(10,'2000',02);
insert into SCREEN values(11,'0800',03);
insert into SCREEN values(12,'1100',03);
insert into SCREEN values(13,'1400',03);
insert into SCREEN values(14,'1700',03);
insert into SCREEN values(15,'2000',03);
insert into SCREEN values(16,'0800',04);
insert into SCREEN values(17,'1100',04);
insert into SCREEN values(18,'1400',04);
insert into SCREEN values(19,'1700',04);
insert into SCREEN values(20,'2000',04); --강남cgv

insert into SCREEN values(21,'0800',01);
insert into SCREEN values(22,'1100',01);
insert into SCREEN values(23,'1400',01);
insert into SCREEN values(24,'1700',01);
insert into SCREEN values(25,'2000',01);
insert into SCREEN values(26,'0800',02);
insert into SCREEN values(27,'1100',02);
insert into SCREEN values(28,'1400',02);
insert into SCREEN values(29,'1700',02);
insert into SCREEN values(30,'2000',02); --강남 메가박스

insert into SCREEN values(31,'0800',01);
insert into SCREEN values(32,'1100',01);
insert into SCREEN values(33,'1400',01);
insert into SCREEN values(34,'1700',01);
insert into SCREEN values(35,'2000',01);
insert into SCREEN values(36,'0800',02);
insert into SCREEN values(37,'1100',02);
insert into SCREEN values(38,'1400',02);
insert into SCREEN values(39,'1700',02);
insert into SCREEN values(40,'2000',02);
insert into SCREEN values(41,'0800',03);
insert into SCREEN values(42,'1100',03);
insert into SCREEN values(43,'1400',03);
insert into SCREEN values(44,'1700',03);
insert into SCREEN values(45,'2000',03); --고양cgv

insert into SCREEN values(46,'0800',01);
insert into SCREEN values(47,'1100',01);
insert into SCREEN values(48,'1400',01);
insert into SCREEN values(49,'1700',01);
insert into SCREEN values(50,'2000',01);
insert into SCREEN values(51,'0800',02);
insert into SCREEN values(52,'1100',02);
insert into SCREEN values(53,'1400',02);
insert into SCREEN values(54,'1700',02);
insert into SCREEN values(55,'2000',02); --고양 롯데시네마


drop table NOWSHOWING cascade constraint;
CREATE TABLE NOWSHOWING(
nsCode NUMBER primary key not null, --상영코드
movieCode NUMBER, -- 영화코드
theaterCode NUMBER, -- 극장코드
screenCode NUMBER, -- 스크린코드
showingDay VARCHAR2(100), --상영날짜
pchk VARCHAR2(2) default 'n' -- 상영코드 시간별제어
);


delete from NOWSHOWING;
insert into NOWSHOWING values(01,01,01,01,'11월 30일','n');
insert into NOWSHOWING values(02,01,01,02,'11월 30일','n');
insert into NOWSHOWING values(03,01,01,03,'11월 30일','n');
insert into NOWSHOWING values(04,01,01,04,'11월 30일','n');
insert into NOWSHOWING values(05,01,01,05,'11월 30일','n'); -- 강남 cgv 1관 스파이더맨
insert into NOWSHOWING values(06,02,01,06,'11월 30일','n');
insert into NOWSHOWING values(07,02,01,07,'11월 30일','n');
insert into NOWSHOWING values(08,02,01,08,'11월 30일','n');
insert into NOWSHOWING values(09,02,01,09,'11월 30일','n');
insert into NOWSHOWING values(10,02,01,10,'11월 30일','n'); -- 강남 cgv 2관 이터널스
insert into NOWSHOWING values(11,03,01,11,'11월 30일','n');
insert into NOWSHOWING values(12,03,01,12,'11월 30일','n');
insert into NOWSHOWING values(13,03,01,13,'11월 30일','n');
insert into NOWSHOWING values(14,03,01,14,'11월 30일','n');
insert into NOWSHOWING values(15,03,01,15,'11월 30일','n'); -- 강남 cgv 3관 베놈 2
insert into NOWSHOWING values(16,04,01,16,'11월 30일','n');
insert into NOWSHOWING values(17,04,01,17,'11월 30일','n');
insert into NOWSHOWING values(18,04,01,18,'11월 30일','n');
insert into NOWSHOWING values(19,04,01,19,'11월 30일','n');
insert into NOWSHOWING values(20,04,01,20,'11월 30일','n');  --강남 cgv 4관 듄    11월 30일

insert into NOWSHOWING values(21,01,01,01,'12월 01일','n');
insert into NOWSHOWING values(22,01,01,02,'12월 01일','n');
insert into NOWSHOWING values(23,01,01,03,'12월 01일','n');
insert into NOWSHOWING values(24,01,01,04,'12월 01일','n');
insert into NOWSHOWING values(25,01,01,05,'12월 01일','n'); -- 강남 cgv 1관 스파이더맨
insert into NOWSHOWING values(26,02,01,06,'12월 01일','n');
insert into NOWSHOWING values(27,02,01,07,'12월 01일','n');
insert into NOWSHOWING values(28,02,01,08,'12월 01일','n');
insert into NOWSHOWING values(29,02,01,09,'12월 01일','n');
insert into NOWSHOWING values(30,02,01,10,'12월 01일','n'); -- 강남 cgv 2관 이터널스
insert into NOWSHOWING values(31,03,01,11,'12월 01일','n');
insert into NOWSHOWING values(32,03,01,12,'12월 01일','n');
insert into NOWSHOWING values(33,03,01,13,'12월 01일','n');
insert into NOWSHOWING values(34,03,01,14,'12월 01일','n');
insert into NOWSHOWING values(35,03,01,15,'12월 01일','n'); -- 강남 cgv 3관 베놈 2
insert into NOWSHOWING values(36,04,01,16,'12월 01일','n');
insert into NOWSHOWING values(37,04,01,17,'12월 01일','n');
insert into NOWSHOWING values(38,04,01,18,'12월 01일','n');
insert into NOWSHOWING values(39,04,01,19,'12월 01일','n');
insert into NOWSHOWING values(40,04,01,20,'12월 01일','n');  --강남 cgv 4관 듄    12월 1일

insert into NOWSHOWING values(41,01,01,01,'12월 02일','n');
insert into NOWSHOWING values(42,01,01,02,'12월 02일','n');
insert into NOWSHOWING values(43,01,01,03,'12월 02일','n');
insert into NOWSHOWING values(44,01,01,04,'12월 02일','n');
insert into NOWSHOWING values(45,01,01,05,'12월 02일','n'); -- 강남 cgv 1관 스파이더맨
insert into NOWSHOWING values(46,02,01,06,'12월 02일','n');
insert into NOWSHOWING values(47,02,01,07,'12월 02일','n');
insert into NOWSHOWING values(48,02,01,08,'12월 02일','n');
insert into NOWSHOWING values(49,02,01,09,'12월 02일','n');
insert into NOWSHOWING values(50,02,01,10,'12월 02일','n'); -- 강남 cgv 2관 이터널스
insert into NOWSHOWING values(51,03,01,11,'12월 02일','n');
insert into NOWSHOWING values(52,03,01,12,'12월 02일','n');
insert into NOWSHOWING values(53,03,01,13,'12월 02일','n');
insert into NOWSHOWING values(54,03,01,14,'12월 02일','n');
insert into NOWSHOWING values(55,03,01,15,'12월 02일','n'); -- 강남 cgv 3관 베놈 2
insert into NOWSHOWING values(56,04,01,16,'12월 02일','n');
insert into NOWSHOWING values(57,04,01,17,'12월 02일','n');
insert into NOWSHOWING values(58,04,01,18,'12월 02일','n');
insert into NOWSHOWING values(59,04,01,19,'12월 02일','n');
insert into NOWSHOWING values(60,04,01,20,'12월 02일','n');  --강남 cgv 4관 듄    12월 2일

insert into NOWSHOWING values(61,01,01,01,'12월 03일','n');
insert into NOWSHOWING values(62,01,01,02,'12월 03일','n');
insert into NOWSHOWING values(63,01,01,03,'12월 03일','n');
insert into NOWSHOWING values(64,01,01,04,'12월 03일','n');
insert into NOWSHOWING values(65,01,01,05,'12월 03일','n'); -- 강남 cgv 1관 스파이더맨
insert into NOWSHOWING values(66,02,01,06,'12월 03일','n');
insert into NOWSHOWING values(67,02,01,07,'12월 03일','n');
insert into NOWSHOWING values(68,02,01,08,'12월 03일','n');
insert into NOWSHOWING values(69,02,01,09,'12월 03일','n');
insert into NOWSHOWING values(70,02,01,10,'12월 03일','n'); -- 강남 cgv 2관 이터널스
insert into NOWSHOWING values(71,03,01,11,'12월 03일','n');
insert into NOWSHOWING values(72,03,01,12,'12월 03일','n');
insert into NOWSHOWING values(73,03,01,13,'12월 03일','n');
insert into NOWSHOWING values(74,03,01,14,'12월 03일','n');
insert into NOWSHOWING values(75,03,01,15,'12월 03일','n'); -- 강남 cgv 3관 베놈 2
insert into NOWSHOWING values(76,04,01,16,'12월 03일','n');
insert into NOWSHOWING values(77,04,01,17,'12월 03일','n');
insert into NOWSHOWING values(78,04,01,18,'12월 03일','n');
insert into NOWSHOWING values(79,04,01,19,'12월 03일','n');
insert into NOWSHOWING values(80,04,01,20,'12월 03일','n');  --강남 cgv 4관 듄    12월 3일

insert into NOWSHOWING values(81,01,02,21,'11월 30일','n');
insert into NOWSHOWING values(82,01,02,22,'11월 30일','n');
insert into NOWSHOWING values(83,01,02,23,'11월 30일','n');
insert into NOWSHOWING values(84,01,02,24,'11월 30일','n');
insert into NOWSHOWING values(85,01,02,25,'11월 30일','n'); -- 강남 메가박스 1관 스파이더맨
insert into NOWSHOWING values(86,05,02,26,'11월 30일','n');
insert into NOWSHOWING values(87,05,02,27,'11월 30일','n');
insert into NOWSHOWING values(88,05,02,28,'11월 30일','n');
insert into NOWSHOWING values(89,05,02,29,'11월 30일','n');
insert into NOWSHOWING values(90,05,02,30,'11월 30일','n'); -- 강남 메가박스 2관 더 아담스 패밀리2   11월 30일

insert into NOWSHOWING values(91,01,02,21,'12월 01일','n');
insert into NOWSHOWING values(92,01,02,22,'12월 01일','n');
insert into NOWSHOWING values(93,01,02,23,'12월 01일','n');
insert into NOWSHOWING values(94,01,02,24,'12월 01일','n');
insert into NOWSHOWING values(95,01,02,25,'12월 01일','n'); -- 강남 메가박스 1관 스파이더맨
insert into NOWSHOWING values(96,05,02,26,'12월 01일','n');
insert into NOWSHOWING values(97,05,02,27,'12월 01일','n');
insert into NOWSHOWING values(98,05,02,28,'12월 01일','n');
insert into NOWSHOWING values(99,05,02,29,'12월 01일','n');
insert into NOWSHOWING values(100,05,02,30,'12월 01일','n'); -- 강남 메가박스 2관 더 아담스 패밀리2   12월 1일

insert into NOWSHOWING values(101,01,02,21,'12월 02일','n');
insert into NOWSHOWING values(102,01,02,22,'12월 02일','n');
insert into NOWSHOWING values(103,01,02,23,'12월 02일','n');
insert into NOWSHOWING values(104,01,02,24,'12월 02일','n');
insert into NOWSHOWING values(105,01,02,25,'12월 02일','n'); -- 강남 메가박스 1관 스파이더맨
insert into NOWSHOWING values(106,05,02,26,'12월 02일','n');
insert into NOWSHOWING values(107,05,02,27,'12월 02일','n');
insert into NOWSHOWING values(108,05,02,28,'12월 02일','n');
insert into NOWSHOWING values(109,05,02,29,'12월 02일','n');
insert into NOWSHOWING values(110,05,02,30,'12월 02일','n'); -- 강남 메가박스 2관 더 아담스 패밀리2   12월 2일

insert into NOWSHOWING values(111,01,02,21,'12월 03일','n');
insert into NOWSHOWING values(112,01,02,22,'12월 03일','n');
insert into NOWSHOWING values(113,01,02,23,'12월 03일','n');
insert into NOWSHOWING values(114,01,02,24,'12월 03일','n');
insert into NOWSHOWING values(115,01,02,25,'12월 03일','n'); -- 강남 메가박스 1관 스파이더맨
insert into NOWSHOWING values(116,05,02,26,'12월 03일','n');
insert into NOWSHOWING values(117,05,02,27,'12월 03일','n');
insert into NOWSHOWING values(118,05,02,28,'12월 03일','n');
insert into NOWSHOWING values(119,05,02,29,'12월 03일','n');
insert into NOWSHOWING values(120,05,02,30,'12월 03일','n'); -- 강남 메가박스 2관 더 아담스 패밀리2   12월 3일


insert into NOWSHOWING values(121,02,03,31,'11월 30일','n'); 
insert into NOWSHOWING values(122,02,03,32,'11월 30일','n');
insert into NOWSHOWING values(123,02,03,33,'11월 30일','n');
insert into NOWSHOWING values(124,02,03,34,'11월 30일','n');
insert into NOWSHOWING values(125,02,03,35,'11월 30일','n'); -- 고양 cgv 1관 이터널스
insert into NOWSHOWING values(126,03,03,36,'11월 30일','n'); 
insert into NOWSHOWING values(127,03,03,37,'11월 30일','n');
insert into NOWSHOWING values(128,03,03,38,'11월 30일','n');
insert into NOWSHOWING values(129,03,03,39,'11월 30일','n');
insert into NOWSHOWING values(130,03,03,40,'11월 30일','n'); -- 고양 cgv 2관 베놈 2
insert into NOWSHOWING values(131,06,03,41,'11월 30일','n'); 
insert into NOWSHOWING values(132,06,03,42,'11월 30일','n');
insert into NOWSHOWING values(133,06,03,43,'11월 30일','n');
insert into NOWSHOWING values(134,06,03,44,'11월 30일','n');
insert into NOWSHOWING values(135,06,03,45,'11월 30일','n'); -- 고양 cgv 3관 장르만 로맨스 11월 30일

insert into NOWSHOWING values(136,02,03,31,'12월 01일','n'); 
insert into NOWSHOWING values(137,02,03,32,'12월 01일','n');
insert into NOWSHOWING values(138,02,03,33,'12월 01일','n');
insert into NOWSHOWING values(139,02,03,34,'12월 01일','n');
insert into NOWSHOWING values(140,02,03,35,'12월 01일','n'); -- 고양 cgv 1관 이터널스
insert into NOWSHOWING values(141,03,03,36,'12월 01일','n'); 
insert into NOWSHOWING values(142,03,03,37,'12월 01일','n');
insert into NOWSHOWING values(143,03,03,38,'12월 01일','n');
insert into NOWSHOWING values(144,03,03,39,'12월 01일','n');
insert into NOWSHOWING values(145,03,03,40,'12월 01일','n'); -- 고양 cgv 2관 베놈 2
insert into NOWSHOWING values(146,06,03,41,'12월 01일','n'); 
insert into NOWSHOWING values(147,06,03,42,'12월 01일','n');
insert into NOWSHOWING values(148,06,03,43,'12월 01일','n');
insert into NOWSHOWING values(149,06,03,44,'12월 01일','n');
insert into NOWSHOWING values(150,06,03,45,'12월 01일','n'); -- 고양 cgv 3관 장르만 로맨스 12월 01일

insert into NOWSHOWING values(151,02,03,31,'12월 02일','n'); 
insert into NOWSHOWING values(152,02,03,32,'12월 02일','n');
insert into NOWSHOWING values(153,02,03,33,'12월 02일','n');
insert into NOWSHOWING values(154,02,03,34,'12월 02일','n');
insert into NOWSHOWING values(155,02,03,35,'12월 02일','n'); -- 고양 cgv 1관 이터널스
insert into NOWSHOWING values(156,03,03,36,'12월 02일','n'); 
insert into NOWSHOWING values(157,03,03,37,'12월 02일','n');
insert into NOWSHOWING values(158,03,03,38,'12월 02일','n');
insert into NOWSHOWING values(159,03,03,39,'12월 02일','n');
insert into NOWSHOWING values(160,03,03,40,'12월 02일','n'); -- 고양 cgv 2관 베놈 2
insert into NOWSHOWING values(161,06,03,41,'12월 02일','n'); 
insert into NOWSHOWING values(162,06,03,42,'12월 02일','n');
insert into NOWSHOWING values(163,06,03,43,'12월 02일','n');
insert into NOWSHOWING values(164,06,03,44,'12월 02일','n');
insert into NOWSHOWING values(165,06,03,45,'12월 02일','n'); -- 고양 cgv 3관 장르만 로맨스 12월 02일

insert into NOWSHOWING values(166,02,03,31,'12월 03일','n'); 
insert into NOWSHOWING values(167,02,03,32,'12월 03일','n');
insert into NOWSHOWING values(168,02,03,33,'12월 03일','n');
insert into NOWSHOWING values(169,02,03,34,'12월 03일','n');
insert into NOWSHOWING values(170,02,03,35,'12월 03일','n'); -- 고양 cgv 1관 이터널스
insert into NOWSHOWING values(171,03,03,36,'12월 03일','n'); 
insert into NOWSHOWING values(172,03,03,37,'12월 03일','n');
insert into NOWSHOWING values(173,03,03,38,'12월 03일','n');
insert into NOWSHOWING values(174,03,03,39,'12월 03일','n');
insert into NOWSHOWING values(175,03,03,40,'12월 03일','n'); -- 고양 cgv 2관 베놈 2
insert into NOWSHOWING values(176,06,03,41,'12월 03일','n'); 
insert into NOWSHOWING values(177,06,03,42,'12월 03일','n');
insert into NOWSHOWING values(178,06,03,43,'12월 03일','n');
insert into NOWSHOWING values(179,06,03,44,'12월 03일','n');
insert into NOWSHOWING values(180,06,03,45,'12월 03일','n'); -- 고양 cgv 3관 장르만 로맨스 12월 03일


insert into NOWSHOWING values(181,01,04,46,'11월 30일','n'); 
insert into NOWSHOWING values(182,01,04,47,'11월 30일','n');
insert into NOWSHOWING values(183,01,04,48,'11월 30일','n');
insert into NOWSHOWING values(184,01,04,49,'11월 30일','n');
insert into NOWSHOWING values(185,01,04,50,'11월 30일','n'); -- 고양 롯데 1관 스파이더맨
insert into NOWSHOWING values(186,04,04,51,'11월 30일','n'); 
insert into NOWSHOWING values(187,04,04,52,'11월 30일','n');
insert into NOWSHOWING values(188,04,04,53,'11월 30일','n');
insert into NOWSHOWING values(189,04,04,54,'11월 30일','n');
insert into NOWSHOWING values(190,04,04,55,'11월 30일','n'); -- 고양 롯데 2관 듄 11월 30일

insert into NOWSHOWING values(191,01,04,46,'12월 01일','n'); 
insert into NOWSHOWING values(192,01,04,47,'12월 01일','n');
insert into NOWSHOWING values(193,01,04,48,'12월 01일','n');
insert into NOWSHOWING values(194,01,04,49,'12월 01일','n');
insert into NOWSHOWING values(195,01,04,50,'12월 01일','n'); -- 고양 롯데 1관 스파이더맨
insert into NOWSHOWING values(196,04,04,51,'12월 01일','n'); 
insert into NOWSHOWING values(197,04,04,52,'12월 01일','n');
insert into NOWSHOWING values(198,04,04,53,'12월 01일','n');
insert into NOWSHOWING values(199,04,04,54,'12월 01일','n');
insert into NOWSHOWING values(200,04,04,55,'12월 01일','n'); -- 고양 롯데 2관 듄 12월 1일

insert into NOWSHOWING values(201,01,04,46,'12월 02일','n'); 
insert into NOWSHOWING values(202,01,04,47,'12월 02일','n');
insert into NOWSHOWING values(203,01,04,48,'12월 02일','n');
insert into NOWSHOWING values(204,01,04,49,'12월 02일','n');
insert into NOWSHOWING values(205,01,04,50,'12월 02일','n'); -- 고양 롯데 1관 스파이더맨
insert into NOWSHOWING values(206,04,04,51,'12월 02일','n'); 
insert into NOWSHOWING values(207,04,04,52,'12월 02일','n');
insert into NOWSHOWING values(208,04,04,53,'12월 02일','n');
insert into NOWSHOWING values(209,04,04,54,'12월 02일','n');
insert into NOWSHOWING values(210,04,04,55,'12월 02일','n'); -- 고양 롯데 2관 듄 12월 2일

insert into NOWSHOWING values(211,01,04,46,'12월 03일','n'); 
insert into NOWSHOWING values(212,01,04,47,'12월 03일','n');
insert into NOWSHOWING values(213,01,04,48,'12월 03일','n');
insert into NOWSHOWING values(214,01,04,49,'12월 03일','n');
insert into NOWSHOWING values(215,01,04,50,'12월 03일','n'); -- 고양 롯데 1관 스파이더맨
insert into NOWSHOWING values(216,04,04,51,'12월 03일','n'); 
insert into NOWSHOWING values(217,04,04,52,'12월 03일','n');
insert into NOWSHOWING values(218,04,04,53,'12월 03일','n');
insert into NOWSHOWING values(219,04,04,54,'12월 03일','n');
insert into NOWSHOWING values(220,04,04,55,'12월 03일','n'); -- 고양 롯데 2관 듄 12월 3일


drop table Member cascade constraint;
create table Member(
id varchar2(20) primary key, --아이디
password varchar2(20), -- 패스워드
name varchar2(20), --이름
textcount number(10), -- 작성글 수
ticketcount number(10), -- 예매 횟수 
tel varchar2(100), -- 전화번호
address varchar2(500), --주소
mailaddress varchar2(500), --메일주소
score number(10), --회원점수
reg_date date, --등록일
memberDel varchar(2) default 'n' -- 삭제여부
);

delete from MEMBER;
insert into member values('test1','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test2','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test3','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test4','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test5','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test6','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test7','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test8','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test9','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test10','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test11','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test12','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test13','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test14','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test15','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test16','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test17','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test18','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test19','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test21','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test22','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test23','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test24','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test25','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test26','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test27','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test28','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test29','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test30','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test31','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test32','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test33','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test34','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test35','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test36','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test37','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test38','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test39','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test40','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test41','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test42','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test43','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test44','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test45','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test46','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test47','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test48','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test49','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test50','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('test51','11','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('master','master','master',0,0,'010-0000-0000','없음','master@master.master',100,sysdate,'n');
insert into member values('babo11','123412','babo',0,0,'010-0000-0000','없음','master@master.master',0,sysdate,'n');
insert into member values('babo12','123412','babo',0,0,'010-0000-0000','없음','master@master.master',0,sysdate,'n');
insert into member values('babo123','123412','babo',0,0,'010-0000-0000','없음','master@master.master',0,sysdate,'n');
insert into member values('babo13','123412','babo',0,0,'010-0000-0000','없음','master@master.master',0,sysdate,'n');



drop table reply cascade constraint;
create table reply
(
replyNum number(10) primary key,
fbNum number(10),
replyContent varchar2(1000),
id varchar2(20),
replyDate Date, 
replyDel varchar2(2) default 'n', 
ref number(10),
ref_level number(10),
ref_step number(10)
);


drop table Event cascade constraint;
create table Event(
eventnum number(10) primary key, --이벤트 번호
eventTitle varchar(500), --이벤트 제목
eventContent varchar2(1000), --이벤트 내용
id varchar2(20), --아이디
photo varchar2(100), --사진
eventDate date, --이벤트 등록일
eventClose varchar2(2), -- 이벤트 종료여부 
eventReadCount NUMBER -- 조회수
);

delete from EVENT;
insert into EVENT values(1,'이벤트 1',null,'master','cgv이벤트1.jpg', sysdate, 'n', 0);
insert into EVENT values(2,'이벤트 2',null,'master','cgv이벤트2.jpg', sysdate, 'n', 0);
insert into EVENT values(3,'이벤트 3',null,'master','메가박스이벤트1.jpg', sysdate, 'n', 0);
insert into EVENT values(4,'이벤트 4',null,'master','메가박스이벤트2.jpg', sysdate, 'n', 0);
insert into EVENT values(5,'이벤트 5',null,'master','메가박스이벤트3.jpg', sysdate, 'n', 0);
insert into EVENT values(6,'이벤트 6',null,'master','메가박스이벤트4.jpg', sysdate, 'n', 0);
insert into EVENT values(7,'이벤트 7',null,'master','메가박스이벤트5.jpg', sysdate, 'n', 0);
insert into EVENT values(8,'이벤트 8',null,'master','메가박스이벤트6.jpg', sysdate, 'n', 0);
insert into EVENT values(9,'이벤트 9',null,'master','메가박스이벤트7.jpg', sysdate, 'n', 0);
insert into EVENT values(10,'이벤트 10',null,'master','메가박스이벤트8.jpg', sysdate, 'n', 0);
insert into EVENT values(11,'이벤트 11',null,'master','메가박스이벤트9.jpg', sysdate, 'n', 0);
insert into EVENT values(12,'이벤트 12',null,'master','메가박스이벤트10.jpg', sysdate, 'n', 0);
insert into EVENT values(13,'이벤트 13',null,'master','메가박스이벤트11.jpg', sysdate, 'n', 0);



drop table Fboard cascade constraint;
create table FBoard ( -- 자유게시간
    fbNum number primary key, --자유게시판 번호
    fbTitle varchar2(500), --자유게시판제목
    fbContent varchar2(4000), --자유게시판 내용 
    id varchar2(500), -- 사용자 id
    photo varchar2(200), -- 자유게시판 사진    
    fbDate DATE, -- 자유게시판 작성일
    fbDel varchar2(2) default 'n', -- 자유게시판 삭제
    fbReadCount   NUMBER, -- 자유게시판 조회수   
    replyCount NUMBER -- 댓글수
);

delete from FBOARD;
insert into FBOARD values(1,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(2,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(3,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(4,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(5,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(6,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(7,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(8,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(9,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(10,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(11,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(12,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(13,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(14,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(15,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(16,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(17,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(18,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(19,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(20,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(21,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(22,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(23,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(24,'기분좋다','아무튼 좋다', 'babo11', null, sysdate, 'n', 0,0);
insert into FBOARD values(25,'기분좋다sp','아무튼 좋다sp', 'babo11', null, sysdate, 'n', 0,0);


drop table searchCount cascade constraint;
create table searchCount ( -- 검색어 카운트
    search VARCHAR2(500) primary key,
    searchCt NUMBER--검색수
);

drop table likes cascade constraint;
create table likes (
lkNum number primary key, 
rvNum number, 
id VARCHAR2(20) 
);

drop table saveboard cascade constraint;
create table saveboard ( -- 검색어 카운트
    sbNum number primary key,
    fbTitle varchar2(500), --자유게시판제목
    fbContent varchar2(4000), --자유게시판 내용 
    id varchar2(500)
);
select * from saveboard;

update fboard set fbreadcount = 150 where fbNum = 25;
update fboard set fbreadcount = 132 where fbNum = 24;

update review set rvreadcount = 122 where rvNum = 14;
update review set rvreadcount = 186 where rvNum = 12;
update review set rvreadcount = 143 where rvNum = 7;
update review set rvreadcount = 133 where rvNum = 6;

update review set rvlike = 13 where rvNum = 7;
update review set rvlike = 16 where rvNum = 6;
update review set rvlike = 20 where rvNum = 12;
update review set rvlike = 18 where rvNum = 14;


