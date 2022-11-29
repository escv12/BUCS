<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUCS</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
<div class="container">
    <header class="header">
      <nav class="gnb">
        <ul>
          <li><a href="index.html"><img src="image/logo.PNG"></a></li>
          <li><a class="menuLink" href="#">파이썬</a></li>
          <li><a class="menuLink" href="#">자바</a></li>
          <li><a class="menuLink" href="#">html</a></li>
          <li><a class="menuLink" href="#">질문</a></li>
          <li><a class="menuLink" href="#">퀴즈</a></li>
          <li><a class="menuLink" href="#">게시판</a></li>
          <li><input class="search" type="text" placeholder="검색어를 입력해주세요"></li>
          
        </ul>
      </nav>
    </header>

    <div class="content">


      <!------------------------왼쪽 메뉴-------------------------------->
      <div class="content_left">
        <div class="account">
          <a class="login_btn" href="./login.jsp">로그인</a>
          <div class="sub_area">
            <a href="./find_id.jsp">아이디 | </a>
            <a href="./find_pw.jsp">비밀번호 찾기 | </a>
            <a href="./sign_up.jsp">회원가입</a>
          </div>
        </div>

          <div class="study">
            <p id="study_title">강의</p>
            <ul class="category">
              <li class="category_item">
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">파이썬</a></p>
                  <li class="sub_category_item"><a href="#">서브 카테고리 1</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 2</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 3</a></li>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">자바</a></p>
                  <li class="sub_category_item"><a href="#">서브 카테고리 1</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 2</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 3</a></li>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">HTML</a></p>
                  <li class="sub_category_item"><a href="#">서브 카테고리 1</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 2</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 3</a></li>
                </ul>
              </li>
            </ul>
          </div>

          <div class="study">
            <p id="study_title">회원 - 로그인 성공시 생성</p>
            <ul class="category">
              <li class="category_item">
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">최근 방문 게시글</a></p>
                  <li class="sub_category_item"><a href="#">파이썬 강의 - 객체생성</a></li>
                  <li class="sub_category_item"><a href="#">자바 강의 - 객체생성</a></li>
                  <li class="sub_category_item"><a href="#">HTML 강의</a></li>
                  <li class="sub_category_item"><a href="#">자바 강의 2</a></li>
                  <li class="sub_category_item"><a href="#">HTML 강의 2</a></li>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">내 정보</a></p>
                  <li class="sub_category_item"><a href="#">나의 질문글</a></li>
                  <li class="sub_category_item"><a href="#">회원 정보 수정</a></li>
                  <li class="sub_category_item"><a href="#">회원 탈퇴</a></li>
                </ul>
                <ul class="sub_category">
                  <p class="sub_category_title"><a href="#">메인 카테고리 3</a></p>
                  <li class="sub_category_item"><a href="#">서브 카테고리 1</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 2</a></li>
                  <li class="sub_category_item"><a href="#">서브 카테고리 3</a></li>
                </ul>
              </li>
            </ul>
          </div>
      </div>
      <!------------------------왼쪽 메뉴 끝-------------------------------->
      <!------------------------오른쪽 메뉴-------------------------------->
      <div class="content_right">
        <div class="addiv">
          이미지 들어갈 곳
          <a href="#">
            <img>
          </a>
        </div>

        <div class="study">
          <p id="study_title">공지사항</p>
          <ul class="category">
            <li class="category_note">
              <span class="note">[공지]</span>
              <a href="#">이곳은 공지사항입니다 여러가지 공지를 작성할 수 있습니다</a>
              <span class="date">2022-11-07</span>
            </li>
            <li class="category_note">
              <span class="note">[공지]</span>
              <a href="#">이곳은 공지사항입니다</a>
              <span class="date">2022-11-07</span>
            </li>
            <li class="category_note">
              <span class="note">[공지]</span>
              <a href="#"></a>여러가지 공지를 작성할 수 있습니다</a>
              <span class="date">2022-11-07</span>
            </li>
          </ul>
        </div>

        <div class="contents_quiz">
          <h3>게시판</h3>
          <div class="row">
            <div class="col_1">
              <div class="widget-box">
                <div class="widget_header"><h4>Question board</h4></div>
                <div class="widget_body">
                  <div class="widget_main">
                    <div class="row">
                      <div class="col_3">
                        <div class="img_wrap">
                          <img src="image/character.png">
                          <p class="user_id">유저 아이디</p>
                        </div>

                      </div>
                      <div class="col_4">
                        <div class="widget_text">
                          <p class="widget_text_title">
                            <a href="#">
                              이곳은 질문입니다
                              이곳은 질문입니다
                              이곳은 질문입니다
                              이곳은 질문입니다
                            </a>
                          </p>
                          <p class="widget_text_content">
                            <a href="#">
                              질문의 내용입니다
                              질문의 내용입니다
                              질문의 내용입니다
                              질문의 내용입니다
                            </a>
                          </p>
                        </div>
                      </div>

                    </div>
                  </div>
                  <div class="widget_info">
                    <div class="info_wrap">
                      <span>조회 </span>
                      <span class="pop">12</span>
                    </div>
                    <div class="info_wrap">
                      <span>댓글 </span>
                      <span class="talk">15</span>
                    </div>
                    <div class="info_wrap">
                      <span>좋아요 </span>
                      <span class="good">16</span>
                    </div>
                  </div>
                </div>
                <div class="widget_body">
                  <div class="widget_main">
                    <div class="row">
                      <div class="col_3">
                        <div class="img_wrap">
                          <img src="image/character.png">
                          <p class="user_id">유저 아이디</p>
                        </div>

                      </div>
                      <div class="col_4">
                        <div class="widget_text">
                          <p class="widget_text_title">
                            <a href="#">
                              이곳은 질문입니다
                              이곳은 질문입니다
                              이곳은 질문입니다
                              이곳은 질문입니다
                            </a>
                          </p>
                          <p class="widget_text_content">
                            <a href="#">
                              질문의 내용입니다
                              질문의 내용입니다
                              질문의 내용입니다
                              질문의 내용입니다
                            </a>
                          </p>
                        </div>
                      </div>

                    </div>
                  </div>
                  <div class="widget_info">
                    <div class="info_wrap">
                      <span>조회 </span>
                      <span class="pop">12</span>
                    </div>
                    <div class="info_wrap">
                      <span>댓글 </span>
                      <span class="talk">15</span>
                    </div>
                    <div class="info_wrap">
                      <span>좋아요 </span>
                      <span class="good">16</span>
                    </div>
                  </div>
                </div>
                </div>
                
              
              </div>
              <div class="col_2">
                <div class="widget-box">
                  <div class="widget_header"><h4>Quiz board</h4></div>
                  <div class="widget_body">
                    <div class="widget_main">
                      <div class="row">
                        <div class="col_3">
                          <div class="img_wrap">
                            <img src="image/character.png">
                            <p class="user_id">유저 아이디</p>
                          </div>
  
                        </div>
                        <div class="col_4">
                          <div class="widget_text">
                            <p class="widget_text_title">
                              <a href="#">
                                이곳은 퀴즈입니다
                                이곳은 퀴즈입니다
                                이곳은 퀴즈입니다
                                이곳은 퀴즈입니다
                              </a>
                            </p>
                            <p class="widget_text_content">
                              <a href="#">
                                퀴즈의 내용입니다
                                퀴즈의 내용입니다
                                퀴즈의 내용입니다
                                퀴즈의 내용입니다
                              </a>
                            </p>
                          </div>
                        </div>
  
                      </div>
                    </div>
                    <div class="widget_info">
                      <div class="info_wrap">
                        <span>조회 </span>
                        <span class="pop">12</span>
                      </div>
                      <div class="info_wrap">
                        <span>댓글 </span>
                        <span class="talk">15</span>
                      </div>
                      <div class="info_wrap">
                        <span>좋아요 </span>
                        <span class="good">16</span>
                      </div>
                    </div>
                  </div>
                  <div class="widget_body">
                    <div class="widget_main">
                      <div class="row">
                        <div class="col_3">
                          <div class="img_wrap">
                            <img src="image/character.png">
                            <p class="user_id">유저 아이디</p>
                          </div>
  
                        </div>
                        <div class="col_4">
                          <div class="widget_text">
                            <p class="widget_text_title">
                              <a href="#">
                                이곳은 퀴즈입니다
                                이곳은 퀴즈입니다
                                이곳은 퀴즈입니다
                                이곳은 퀴즈입니다
                              </a>
                            </p>
                            <p class="widget_text_content">
                              <a href="#">
                                퀴즈의 내용입니다
                                퀴즈의 내용입니다
                                퀴즈의 내용입니다
                                퀴즈의 내용입니다
                              </a>
                            </p>
                          </div>
                        </div>
  
                      </div>
                    </div>
                    <div class="widget_info">
                      <div class="info_wrap">
                        <span>조회 </span>
                        <span class="pop">12</span>
                      </div>
                      <div class="info_wrap">
                        <span>댓글 </span>
                        <span class="talk">15</span>
                      </div>
                      <div class="info_wrap">
                        <span>좋아요 </span>
                        <span class="good">16</span>
                      </div>
                    </div>
                  </div>
                </div>



            </div>
            </div>
          </div>

        <div class="addiv">
          머 들어갈지 모르는 곳
          <a href="#">
            <img>
          </a>
        </div>
      </div>
      <!------------------------오른쪽 메뉴 끝-------------------------------->
    </div>
  </div>
</body>
</html>