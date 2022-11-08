<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>quiz_board</title>
    <link rel="stylesheet" href="css/quiz_board.css">
    <link rel="stylesheet" href="css/loginPage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        $("#header").load("login_header.html");
    });
    </script>
</head>
<body>
    <div id="header"></div>
    <div class="quiz_board_wrap">
        <div class="quiz_board">
            <div class="quiz_board_top">
                <div id="quiz">����</div>
                <div id="answer">����</div>
            </div>
            <div class="quiz_board_mid">
                <div class="search_wrap">
                    <select class="search_method">
                        <option value="1">����+����</option>
                        <option value="2">����</option>
                        <option value="3">����</option>
                        <option value="4">��ȣ</option>
                    </select>
                    <div class="search"><input placeholder="�˻�� �Է����ּ���"></div>
                    <button class="search_btn">�˻�</button>
                </div>
                
                <table class="quiz_board_table">
                    <thead>
                        <tr>
                            <th id="number">��ȣ</th>
                            <th id="title">����</th>
                            <th id="date">�������</th>
                            <th id="count">��ȸ��</th>
                        </tr>
                    </thead>
                    <tbody id="quiz_contents">
                        <tr>
                            <td>9999</td>
                            <td>�׽�Ʈ�� �Դϴ�</td>
                            <td>2022-10-12</td>
                            <td>1520</td>
                        </tr>

                        <tr>
                            <td>002</td>
                            <td>�׽�Ʈ�� �Դϴ�</td>
                            <td>2022-10-10</td>
                            <td>152</td>
                        </tr>

                        <tr>
                            <td>003</td>
                            <td>�׽�Ʈ�� �Դϴ�</td>
                            <td>2022-10-11</td>
                            <td>120</td>
                        </tr>

                        <tr>
                            <td>004</td>
                            <td>�׽�Ʈ�� �Դϴ�</td>
                            <td>2022-10-11</td>
                            <td>99999999</td>
                        </tr>

                        <tr>
                            <td>005</td>
                            <td>�׽�Ʈ�� �Դϴ�</td>
                            <td>2022-10-11</td>
                            <td>120</td>
                        </tr>
                        
                    </tbody>
                </table>

            </div>
            <div class="quiz_board_bot">
                <ul id="change_page">
                    <li><a href="#"><<</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">>></a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>