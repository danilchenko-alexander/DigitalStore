<#macro page2>
    <#import "common.ftl" as c>
    <#import "login.ftl" as l>
    <@c.page>

    <style>
        .dropdown:hover > .dropdown-menu {
            display: block;
        }

        .dropdown-item:hover {
            background-color: #9ab0ff;
        }
    </style>

    <main>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark mdb-color lighten-3 mt-3 mb-5">
                <span class="navbar-brand">Категории: </span>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#nextNav" aria-controls="nextNav" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="nextNav">
                    <ul class="navbar-nav mr-auto">
                        <#list catalogs?keys as key>
                            <li class="nav-item dropdown">
                                <a href="/products/${key}" class="nav-link dropdown-toggle" id="dropdownSub">
                                ${catalogs[key]}</a>
                                <#list subb?keys as keyy>
                                    <div class="dropdown-menu" aria-labelledby="dropdownSub">
                                        <#list subb[key] as kk>
                                            <a class="dropdown-item" href="/products/${key}/${kk.id}">${kk.name}</a>
                                        </#list>
                                    </div>
                                </#list>
                            </li>

                        </#list>
                    </ul>
                    <form class="form-inline">
                        <div class="md-form my-0">
                            <form action="/find/nuplz" method="get">
                                <input type="text" name="text" class="form-control mr-sm-2" placeholder="Search"
                                       aria-label="Search">
                            </form>
                        <#--<i class="fa fa-search" aria-hidden="true"></i>-->
                        </div>
                    </form>
                </div>
            </nav>

            <#nested>

        </div>
    </main>
    </@c.page>
</#macro>