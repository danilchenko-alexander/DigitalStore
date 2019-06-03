<#import "parts/common.ftl" as c>
<@c.page>
<!-- Nav tabs -->
<div class="container mt-5">
    <ul class="nav nav-tabs md-tabs nav-justified grey darken-3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active rgba-teal-ligh" data-toggle="tab" href="#panel555" role="tab">
                <i class="fas fa-file-alt mr-2"></i>Необслуженные</a>
        </li>
        <li class="nav-item">
            <a class="nav-link rgba-teal-ligh" data-toggle="tab" href="#panel666" role="tab">
                <i class="fas fa-check mr-2"></i>Обслуженные</a>
        </li>
    </ul>
    <!-- Nav tabs -->

    <!-- Tab panels -->
    <div class="tab-content">

        <!-- Panel 1 -->
        <div class="tab-pane fade in show active" id="panel555" role="tabpanel">
            <div class="pt-5">
                <table class="table text-center table-sm">
                    <thead class="black white-text">

                    <tr>
                        <th scope="col">Номер заказа</th>
                        <th scope="col">Заказ</th>
                        <th scope="col">Контактные данные</th>
                        <th scope="col">Действие</th>
                    </tr>
                    </thead>
                    <tbody class="text-center">
                        <#list products as product>
                        <tr>
                            <#if (contacts[product?index].reviewed == false)>
                                <th style="vertical-align: middle">
                                ${contacts[product?index].id}
                                </th>
                                <td style="width: 30%; vertical-align: middle">
                                    <#list product as prod>
                                        <p>[Кол-во: ${prod.amount}], [Название: ${prod.compName}],
                                            [Цена: ${prod.price}]</p>
                                    </#list>
                                    <i class="fas fa-calendar mr-2"> ${contacts[product?index].date}</i>
                                </td>
                                <td>
                                    <p>${contacts[product?index].name} ${contacts[product?index].fam}</p>
                                    <p>${contacts[product?index].number}</p>
                                    <p>${contacts[product?index].em}</p>
                                    <p>${contacts[product?index].city}</p>
                                    <p>${contacts[product?index].address}</p>
                                </td>
                                <td style="width: 15%">
                                    <form action="/deleteOrder" method="post">
                                        <input type="hidden" value="${contacts[product?index].id}" name="orderId">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <button class="btn btn-primary btn-sm" style="width:100%" type="submit">
                                            Отклонить
                                        </button>
                                    </form>
                                    <form action="/markAsRead" method="post">
                                        <input type="hidden" value="${contacts[product?index].id}" name="orderId">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <button class="btn btn-primary btn-sm" style="width:100%" type="submit">
                                            Завершить
                                        </button>
                                    </form>
                                </td>
                            </#if>
                        </tr>
                        </#list>
                    </tbody>
                </table>
            </div>
        </div>




        <#--SECOND PANEL!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
        <div class="tab-pane fade" id="panel666" role="tabpanel">
            <div class="pt-5">
                <table class="table text-center table-sm">
                    <thead class="black white-text">
                    <tr>
                        <th scope="col">Номер заказа</th>
                        <th scope="col">Заказ</th>
                        <th scope="col">Контактные данные</th>
                        <th scope="col">Действие</th>
                    </tr>
                    </thead>
                    <tbody class="text-center">
                        <#list products as product>
                        <tr>
                            <#if (contacts[product?index].reviewed == true)>
                                <th style="vertical-align: middle">
                                ${contacts[product?index].id}
                                </th>
                                <td style="width: 30%; vertical-align: middle">
                                    <#list product as prod>
                                        <p>[Кол-во: ${prod.amount}], [Название: ${prod.compName}],
                                            [Цена: ${prod.price}]</p>
                                    </#list>
                                    <i class="fas fa-calendar mr-2"> ${contacts[product?index].date}</i>
                                </td>
                                <td>
                                    <p>${contacts[product?index].name} ${contacts[product?index].fam}</p>
                                    <p>${contacts[product?index].number}</p>
                                    <p>${contacts[product?index].em}</p>
                                    <p>${contacts[product?index].city}</p>
                                    <p>${contacts[product?index].address}</p>
                                </td>
                                <td style="width: 15%">
                                    <form action="/deleteOrder" method="post">
                                        <input type="hidden" value="${contacts[product?index].id}" name="orderId">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <button class="btn btn-primary btn-sm" style="width:100%" type="submit">
                                            Удалить
                                        </button>
                                    </form>
                                    <form action="/markAsUnread" method="post">
                                        <input type="hidden" value="${contacts[product?index].id}" name="orderId">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <button class="btn btn-primary btn-sm" style="width:100%" type="submit">
                                            Вернуть на рассмотрение
                                        </button>
                                    </form>
                                </td>
                            </#if>
                        </tr>
                        </#list>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Panel 2 -->

    </div>
</div>
<!-- Tab panels -->
</@c.page>
