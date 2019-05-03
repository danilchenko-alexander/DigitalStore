<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DigitalStore</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
<#include "security.ftl">
<div class ="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="nav-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">DigitalStore</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="/MainPage">Main</a></li>
                <li><a href="/login">Login</a></li>
                <li><a href="/">greeting</a></li>
                <li><a href="/user">user List</a>
                <li><a href="/registration">регистрация</a></li>
                <li><a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i></a></li>
            </ul>
        </div>
        <div class="navbar-text">${name}</div>
    </div>
</div>
<#nested>
</body>
</html>
</#macro>