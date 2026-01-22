<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="beans.MyData" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Data List</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f7f7f7;
        color: #333;
        display: flex;
        justify-content: center;
        min-height: 100vh;
        animation: fadeUp 0.8s ease forwards;
        opacity: 0;
    }

    @keyframes fadeUp {
        0% { opacity: 0; transform: translateY(20px); }
        100% { opacity: 1; transform: translateY(0); }
    }

    .container {
        margin: 40px 0;
        padding: 40px 60px;
        background: #ffffff;
        border-radius: 20px;
        box-shadow: 0 15px 45px rgba(0, 0, 0, 0.08);
        max-width: 700px;
        width: 90%;
    }

    h1 {
        text-align: center;
        color: #7b4a7d;
        font-size: 2.4em;
        font-weight: 300;
        margin-bottom: 30px;
        letter-spacing: 2px;
    }

    .nav {
        text-align: center;
        margin-bottom: 30px;
    }

    .nav a {
        display: inline-block;
        margin: 0 10px;
        padding: 10px 25px;
        background: linear-gradient(135deg, #b58bc6, #8b5aa3);
        color: #fff;
        text-decoration: none;
        border-radius: 8px;
        font-size: 0.9em;
        transition: 0.3s;
    }

    .nav a:hover {
        transform: scale(1.05);
        opacity: 0.9;
    }

    .card {
        background: #fafafa;
        border-radius: 15px;
        padding: 25px 30px;
        margin-bottom: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        transition: transform 0.3s;
        text-shadow: 0 1px 3px rgba(0,0,0,0.90);
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .data-text {
        font-size: 1.1em;
        margin-bottom: 10px;
        color: #ffffff;
        white-space: pre-wrap;
    }

    .datetime {
        font-size: 0.85em;
        color: #ffffff;
        text-align: right;
    }

    footer {
        text-align: center;
        margin-top: 30px;
        font-size: 0.8em;
        color: #aaa;
    }
</style>
</head>

<body>

<%
    List<MyData> mdList = (List<MyData>) request.getAttribute("mdList");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<div class="container">

    <h1>歴代の記事</h1>

    <div class="nav">
        <a href="./Details">まだ記事を書く</a>
    </div>

    <% for (MyData md : mdList) { %>
    <div class="card" style="background-color: <%= md.getColor() %>;">
        <div class="data-text">
            <%= md.getData() %>
        </div>
        <div class="datetime">
            登録日時：<%= sdf.format(md.getEntryDatetime()) %>
        </div>
    </div>
<% } %>

</div>

</body>
</html>
