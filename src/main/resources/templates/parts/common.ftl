<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DigitalStore</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>
    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Material Design Bootstrap -->
    <link href="/static/css/mdb.min.css" rel="stylesheet"/>
    <!-- Your custom styles (optional) -->
    <link href="/static/css/style.css" rel="stylesheet"/>
</head>
<body>
    <#include "security.ftl">
    <#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">DigitalStore</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link mr-4" href="/contactUs"><i class="fa fa-envelope mr-2" aria-hidden="true"></i>Замечания
                    и предложения</a>
            </li>
            <li class="nav-item">
                <a class="nav-link mr-4" href="/Contacts">Контакты</a>
            </li>
            <li class="nav-item">
                <a class="nav-link mr-4" href="/Reviews">Отзывы</a>
            </li>
            <li class="nav-item dropdown mr-4">
                <#if !known>
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Авторизация
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a href="" class="dropdown-item" data-toggle="modal" data-target="#modalLoginForm">Логин</a>
                        <a class="dropdown-item" data-toggle="modal" data-target="#modalRegisterForm">Регистриция</a>
                    </div>
                <#elseif isAdmin>
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${name}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/user">Редактировать пользователей</a>
                        <a class="dropdown-item" href="/catalogList">Редактировать каталог</a>
                        <a class="dropdown-item" href="/orders">Просмотреть заказы</a>
                        <div class="dropdown-divider"></div>
                        <@l.logout />
                    </div>
                <#else>
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${name}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <div class="dropdown-divider"></div>
                        <@l.logout />
                    </div>
                </#if>
            </li>
        </ul>
        <div class="mr-4">
        <#--<i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i>-->
            <!-- Button trigger modal-->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCart"
                    onclick="getCart()"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i></button>

                <!-- Modal: modalCart -->
                <div class="modal fade" id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <!--Header-->
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Корзина</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <!--Body-->
                            <div class="modal-body">

                                <table class="table table-hover text-center">
                                    <thead>
                                    <tr>
                                        <th>Кол-во</th>
                                        <th>Название продукта</th>
                                        <th>Цена за единицу</th>
                                        <th>Действие</th>
                                    </tr>
                                    </thead>
                                    <tbody id="#mcc">

                                    </tbody>
                                </table>

                            </div>
                            <!--Footer-->
                            <form method="post" action="/checkout">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Закрыть
                                </button>
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input type="hidden" value="" id="JSONfield" name="jsonfieldd">
                                <button class="btn btn-primary" type="submit" onclick="checkout()">Оформить</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

            <!-- Modal: modalCart -->
        </div>
    </div>
</nav>


<#--login-->
<form action="/login" method="post">
    <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-5">
                        <i class="fas fa-user prefix grey-text"></i>
                        <input type="text" class="form-control" name="username">
                        <label data-error="wrong" data-success="right" for="defaultForm-email">Логин</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-lock prefix grey-text"></i>
                        <input type="password" id="defaultForm-pass" class="form-control" name="password">
                        <label data-error="wrong" data-success="right" for="defaultForm-pass">Пароль</label>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="submit" class="btn btn-default">Войти</button>
                </div>
            </div>
        </div>
    </div>
</form>
<#--loginEnd-->

<form action="/registration" method="post">
    <div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Регистрация</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-5">
                        <i class="fas fa-user prefix grey-text"></i>
                        <input type="text" id="orangeForm-name" class="form-control validate" name="username">
                        <label data-error="wrong" data-success="right" for="orangeForm-name">Логин</label>
                    </div>
                    <div class="md-form mb-5">
                        <i class="fas fa-lock prefix grey-text"></i>
                        <input type="password" id="orangeForm-email" class="form-control validate" name="password">
                        <label data-error="wrong" data-success="right" for="orangeForm-email">Пароль</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-lock prefix grey-text"></i>
                        <input type="password" id="orangeForm-pass" class="form-control validate">
                        <label data-error="wrong" data-success="right" for="orangeForm-pass">Повторите пароль</label>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-deep-orange">Зарегистрироваться</button>
                </div>
            </div>
        </div>
    </div>
</form>
<#--registration-->

<#--registrationEnd-->
    <#nested>
<script type="text/javascript" src="/static/js/localstoragejs.js"></script>
<script type="text/javascript" src="/static/js/jquery-3.4.0.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="/static/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="/static/js/mdb.min.js"></script>
</body>
</html>

</#macro>