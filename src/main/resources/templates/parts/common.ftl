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
<#import "login.ftl" as l>
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
                <li class="dropdown">
                    <#if !known>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Авторизация<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/login">Логин</a></li>
                        <li><a href="/registration">Регистрация</a></li>
                    </ul>
                    <#elseif isAdmin>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> ${name} <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/user">Список пользователей</a></li>
                            <li><a href="/product">Список продуктов</a></li>
                            <li><@l.logout /></li>

                        </ul>
                    <#else>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> ${name} <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><@l.logout /></li>
                        </ul>
                    </#if>
                </li>

                <li><a href="/">greeting</a></li>
                <li><a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i></a></li>
            </ul>

        </div>
    </div>
</div>
<#nested>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
</#macro>