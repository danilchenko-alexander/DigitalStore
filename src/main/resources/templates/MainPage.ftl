<#import "parts/mainPart.ftl" as mp>
<@mp.page2>
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
                                     src="/img/${computer.filename?if_exists}"
                                     alt="comp">

                                <form action="/show/${currentCatalog}/${computer.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <a href="#" onclick="this.parentNode.submit();"><div class="mask rgba-white-slight"></div></a>
                                </form>
                            </div>
                            <div class="card-body text-center">
                                <a href="#" class="black-text">
                                    <h5>${computer.name}</h5>
                                </a>
                                <p>
                                    <strong>
                                        <a href="#" class="dark-grey-text" style="font-size: 12px">${computer.description}</a>
                                    </strong>
                                </p>
                                <h4 class="font-weight-bold blue-text">
                                    <strong>${computer.price} руб.</strong>
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
</@mp.page2>