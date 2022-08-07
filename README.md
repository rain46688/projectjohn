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








<!-- Markdown link & img dfn's -->
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/yourname/yourproject/wiki

