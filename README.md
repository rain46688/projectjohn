![](/RM_images/logo_long_black.png)
> 실시간 음성 및 영상채팅을 통한 고민해소 플랫폼입니다.

## 기능
- 다수간의 음성채팅 및 이미지 공유
- 1:1 화상 채팅
- 마이페이지를 통한 유저간의 실시간 메세지기능 및 회원관리
- Admin 페이지를 통한 운영진 : 유저간 실시간 메세지 기능 및 회원 관리

## 사용기술 및 개발환경
- Front : HTML, CSS, JS, jQuery
- Server : Spring MVC, nodeJS, Google STUN Server, PeerJS Server
- DBMS : Oracle
- Library : PeerJS(WebRTC), Socket.io 

#### Contact
- Jackson(jacksonhong0111@gmail.com)
- Inhee(inheekang94@gmail.com)
- Jisun(asdfjkl9444@gmail.com)
- CMS(rain46688@gmail.com)

## 상세정보

![](/RM_images/login.png)

> 로그인, 아이디 저장 및 찾기, 회원 가입이 가능한 페이지입니다.


![](/RM_images/add1.png)

> 실시간으로 개설되는 채팅방의 목록을 보여주며 Carousel 효과를 통해 다음 목록을 볼 수 있습니다.

사용자가 리스트 페이지에 들어갈 시에 웹소켓을 통하여 리스트 목록을 받아와서 화면에 구현해 주며 방이 개설되거나 삭제될 경우에도 웹소켓에 요청하여 현재 리스트의 목록을 변경합니다

![](/RM_images/add2.png)

> 게시판에서 작성자의 사연을 보고 찬성이나 반대에 투표할 수 있다. 또한 댓글을 남기고 싶은 경우 우측의 댓글 코너에서 작성할 수 있으며 댓글에도 좋아요 나 싫어요를 투표할 수 있다. 본인이 남긴 댓글의 경우 수정이나 삭제를 할 수 있으며 방장이 남긴 댓글의 경우 우측에 표시됩니다.

사용자가 상세페이지에 들어갈 경우 게시판 타입에 따라 다른 jsp 페이지를 연결시켜 주고 cookie 값을 확인하여 조회 수 업데이트 여부를 판단합니다. 좋아요 기능과 투표 기능은 Ajax를 통해 구현하였으며 댓글의 경우도 화면 전환 없이 Ajax를 통해 비동기식으로 CRUD 기능이 가능합니다.

![](/RM_images/add3.png)

> 채팅방에 입장할 경우 음성 채팅이 시작되며 본인이 하고 싶은 한마디를 상태 메시지로 우측에 띄워 놓을 수 있으며(한 사람당 하나).
방장은 중간에 위치하는 흰색 부분에 파일을 Drag 하여 업로드하고 방에 있는 인원들과 공유할 수 있습니다.

사용자가 채팅방에 들어갈 경우 채팅 기능을 위 한 Spring WebSocket 서버와 음성 채팅을 위 한 socket.io 와 PeerJS (WebRTC 라이브러리) 가 존재하는 NodeJS 서버에 연결된다. 채팅의 경우 방에 참여한 인원에 맞춰 개인당 하나의 메시지만 표시될 수 있도록 구현하였습니다.
음성 채팅의 경 우 실시간으로 socket.io를 통해 개인의 id 와 해당방의 id를 실시간으로 공유하여 새로운 사용자가 방에 입장할 경우 PeerJS 서버에 요청하여 양방향 음성 채팅이 가능하도록 구현하였습니다.

![](/RM_images/add4.png)

- 아이디는 이름과 핸드폰 번호를 입력하면 다음 화면에 출력되도록 구현
- 비밀번호는 이름과 핸드폰 번호, 아이디를 입력하면 MailHandler를 통해 해당 아이디(이메일)에 임시 비밀번호가 전송되도록 구현
- 임시 비밀번호로 로그인 시 비밀번호 변경 알림 전송

![](/RM_images/add5.png)

- WebSocket을 이용해 가장 최근 메시지를 주고 받은 채팅방이 채팅 리스트 맨 위에 올라오도록 구현
- 멤버 검색 시 Ajax를 이용해 입력 받은 키워드를 가지고 있는 닉네임을 모두 출력하도록 구현
- WebSocket을 이용해 실시간으로 채팅을 주고 받을 수 있도록 구현

![](/RM_images/add6.png)

- 소셜 로그인 시 분기 처리를 통해 회원가입이 필요한 회원에게 알람 전송 및 회원 가입 창으로 이동
- 콜 백 시 네이버 프로필을 이용한 필수 정보 자동 입력
- 비밀번호 NOT NULL 제약조건으로 가상 비밀번호 발급 및 등록
- 소셜 로그인 회원 일반 로그인 시도 시 알람

![](/RM_images/add7.png)

이용자가 업로드할 자격증 개수를 미리 알 수 없으니 NULL로 인한 오류를 방지하기 위해 추가 버튼을 눌렀을 때 자격증 입력 칸이 생기도록
ajax로 추가 자격증 입력란을 받아 옵니다.

![](/RM_images/add8.png)

>WEB RTC를 이용해서 실시간 영상 통화 기능

상담사가 상담 관련 문서 작성 가능하며 실시간으로 유저도 확인 가능 및 드래그 앤 드롭으로 이미지 실시간 전송 가능합니다.

![](/RM_images/add9.png)

>웹소켓을 이용해서 전문가 상담 게시판 구현

카테고리별 전문 상담사들의 현황을 상단 바에서 확인이 가능하고 우측 하단에서 카테고리를 변경할 수 있으며 카테고리별 베스트 상담 후기 확인 가능입니다.

![](/RM_images/add10.png)

등록되어 있는 전문 상담사의 자격증을 등록하는 페이지이며 자격정보 API 연동을 통해 해당 자격증이 존재하는지를 판단합니다.

![](/RM_images/add11.png)

웹소켓을 이용해서 알람 서버를 구축하여 상담, 게시판, 신고로 구분해서 알람 기능 구현 알람을 클릭 시 활성화되어있는 상담으로 이동하며 알람 수신을 끄는 기능도 탑재되어 있습니다.

![](/RM_images/add12.png)

상담 시작 여부 및 정보등의 현황을 한눈에 볼수있는 게시판이 제공됩니다. 

![](/RM_images/add13.png)

회원관리를 위해 불러오는 테이블입니다.
가입한 회원, 탈퇴 회원 모두 검색 조건에 따라 조회할 수 있으며, 원하는 행을 클릭하면 회원을 탈퇴시킬 수 있습니다.

![](/RM_images/add14.png)

돋보기 아이콘을 클릭하면 나오는 검색 modal 창입니다. 회원관리, 게시판 관리, 전문가 관리, 전문가 상담관리 모두 
select-option, 키워드, 라디오 버튼, 체크박스의 개수와 내용이 다르지만 대표적으로 게시판 관리 검색창을 첨부하였습니다.

![](/RM_images/add15.png)

승인/미 승인, 진행 중/종료, 처리 전/처리 완료 와 같이 구분이 필요한 부분은 쉽게 파악할 수 있도록 탭(tab) 메뉴로 구분하였습니다. 대표적으로 전문가 승인 관리 부분을 첨부하였습니다. 
또한 구분 기준에 해당하는 칼럼은 색깔과 데이터를 다르게 변경하여 한눈에 파악할 수 있도록 구현하였습니다.

![](/RM_images/add16.png)

전문가 신청 내역을 볼 수 있는 상세페이지입니다. 
신청한 회원의 정보와 자격증 정보를 볼 수 있고, 첨부된 자격증 사진은 클릭하면 확대하여 볼 수 있습니다.

![](/RM_images/add17.png)
![](/RM_images/add18.png)

텍스트 에디터로 글쓰기 구현하여 신고하기 페이지를 구성하였습니다.

![](/RM_images/add19.png)

관리자 페이지에서 1:1 문의 답변하기 메뉴를 클릭하면 보이는 채팅 방 목록입니다. 카카오톡에서 착안하여  관리자에게 문의를 한 사람들의 프로필 사진, 이름, 가장 최신 메시지 내용, 보낸 날짜를 확인할 수 있으며 행을 클릭하면 해당 채팅방으로 바로 이동합니다. 

Websocket을 활용한 관리자 1:1 채팅 답변 / 사용자 1:1 채팅 문의 화면입니다. 
사용자가 내용 입력 후 전송하면 실시간으로 관리자 채팅방으로 전송되며, 본인과 상대방의 채팅을 구분하기 위하여 그에 따른 색깔과 위치를 변경하였습니다.

Thanks you for reading!
:+1: :sparkles: :camel: :tada:
:rocket: :metal: :octocat:
