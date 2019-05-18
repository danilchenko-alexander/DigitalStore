<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>

<style>
    .dropdown:hover > .dropdown-menu {
        display: block;
    }

    .dropdown-item:hover{
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
                        <input type="text" class="form-control mr-sm-2" placeholder="Search" aria-label="Search">
                    <#--<i class="fa fa-search" aria-hidden="true"></i>-->
                    </div>
                </form>
            </div>
        </nav>

        <#switch currentCatalog?if_exists>
            <#case "Phone">
                Phone
                <#break>
            <#case "Notebook">
            Notebook
                <#break>
            <#case "Printer">
            Printer
                <#break>
            <#case "TheTablet">
            TheTablet
                <#break>
            <#case "Monoblock">
            Monoblock
                <#break>
            <#case "Monitor">
            Monitor
                <#break>
            <#default>
                <section class="text-center mb-4">
                    <div class="row wow fadeIn">
                        <#list computers as computer>
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="card">
                                <div class="view overlay">
                                    <img class="card-img-top"
                                         src="https://kursor.by/image/cache/catalog/quad/54/img_rd54973_1-170x170.jpg"
                                         alt="comp">
                                    <a href="#">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body text-center">
                                    <a href="#" class="grey-text">
                                        <h5>${computer.name}</h5>
                                    </a>
                                    <p>
                                        <strong>
                                            <a href="#" class="dark-grey-text">${computer.description}</a>
                                        </strong>
                                    </p>
                                    <h4 class="font-weight-bold blue-text">
                                        <strong>${computer.price}$</strong>
                                    </h4>
                                </div>
                            </div>
                        </div>
                        </#list>
                    </div>
                </section>
                <#break>
        </#switch>

        <nav class="d-flex justify-content-center wow fadeIn">
            <ul class="pagination pg-blue">
                <li class="page-item disabled">
                    <a class="page-link" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item active">
                    <a class="page-link" aria-label="Previous">
                        <span aria-hidden="true">1</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" aria-label="Previous">
                        <span aria-hidden="true">2</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" aria-label="Previous">
                        <span aria-hidden="true">3</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" aria-label="Previous">
                        <span aria-hidden="true">4</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</main>
</@c.page>