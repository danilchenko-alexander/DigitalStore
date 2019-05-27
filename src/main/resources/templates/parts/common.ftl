<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DigitalStore</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Material Design Bootstrap -->
    <link href="/static/css/mdb.min.css" rel="stylesheet" />
    <!-- Your custom styles (optional) -->
    <link href="/static/css/style.css" rel="stylesheet" />
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
                <a class="nav-link mr-4" href="/contactUs"><i class="fa fa-envelope mr-2" aria-hidden="true"></i>Замечания и предложения</a>
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
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><@l.logout /></a>
                    </div>
                <#else>
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${name}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#" data-target="#logoutForm"></a>
                    </div>
                </#if>
            </li>
        </ul>
        <div class="mr-4">
            <#--<i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i>-->
                <!-- Button trigger modal-->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCart"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i></button>

                <!-- Modal: modalCart -->
                <div class="modal fade" id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <!--Header-->
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Your cart</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <!--Body-->
                            <div class="modal-body">

                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Product name</th>
                                        <th>Price</th>
                                        <th>Remove</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Компьютер Apple Mac mini (MGEN2)</td>
                                        <td>723,20 руб</td>
                                        <td><a><i class="fas fa-times"></i></a></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Компьютер ASUS PN40-BB014MC</td>
                                        <td>434,40 руб</td>
                                        <td><a><i class="fas fa-times"></i></a></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Компьютер ASUS PN40-BB013</td>
                                        <td>441,60 руб</td>
                                        <td><a><i class="fas fa-times"></i></a></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Компьютер ASUS VivoMini-VC66-BB31</td>
                                        <td>955,20руб</td>
                                        <td><a><i class="fas fa-times"></i></a></td>
                                    </tr>
                                    </tbody>
                                </table>

                            </div>
                            <!--Footer-->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Закрыть</button>
                                <button class="btn btn-primary">Оформить</button>
                            </div>
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
                    <input type="text" id="orangeForm-name" class="form-control validate" name="name">
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