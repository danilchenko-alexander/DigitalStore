<#import "parts/mainPart.ftl" as mp>
<@mp.page2>
<div class="container text-center">
    <#assign x=0>
    <div class="row">
        <div class="col">
            <table class="table table-borderless">
                <thead>
                <tr>
                    <th scope="col">Название</th>
                    <th scope="col">Кол-во</th>
                    <th scope="col">Цена</th>
                </tr>
                </thead>
                <tbody>
                    <#list products as product>
                    <tr>
                        <td>
                        ${product["compName"]}
                        </td>
                        <td>
                        ${product["amount"]}
                        </td>
                        <td>
                            <#assign x+=product["price"]?replace(",",".")?number*product["amount"]?number>
                        ${((product["price"]?replace(",","."))?number*(product["amount"]?number))} руб.
                        </td>
                    </tr>
                    </#list>
                <tr class="text-center">
                    <td colspan="3" style="font-size: 30px">Сумма заказа: ${x} руб.</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <form method="post" action="/sendOrder">
        <div class="row pb-2">
            <div class="col border-right">
                <h5>Личные данные</h5>
                <div class="row">
                    <div class="col col-sm-6">
                        <input class="form-control form-control-sm" type="text" name="name" placeholder="Ваше имя">
                    </div>
                    <div class="col col-sm-6">
                        <input class="form-control form-control-sm" type="text" name="fam" placeholder="Ваша фамилия">
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col col-sm-6">
                        <input class="form-control form-control-sm" type="text" name="email" placeholder="Ваш e-mail">
                    </div>
                    <div class="col col-sm-6">
                        <input class="form-control form-control-sm" id="phone" name="number" type="text"
                               placeholder="Ваш контактный телефон">
                        <p id="message">
                        </p>
                    </div>
                </div>
            </div>
            <div class="col">
                <h5>Адрес доставки</h5>
                <div class="row">

                    <div class="col col-sm-12">
                        <select class="browser-default custom-select custom-select-sm" name="city">
                            <option selected>Минск</option>
                            <option value="1">Гомель</option>
                            <option value="2">Бобруйск</option>
                            <option value="3">Могилёв</option>
                        </select>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <#--<input type="hidden" name="prod" value=${products}>-->

                </div>
                <div class="row mt-2">
                    <div class="col col-sm-12">
                        <input class="form-control form-control-sm" type="text" placeholder="Ваш адрес" name="address">
                    </div>
                </div>
            </div>
        </div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#basicExampleModal">
            Все данные верны, оформить заказ
        </button>
        <div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Подтвердите заказ. После подтверждения вы будете перенаправлены на главную страницу.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                        <input type="hidden" value="" id="JSONfield2" name="jsonfieldd2">
                        <input type="hidden" name="summaryPrice" value="${x}">
                        <button type="submit" class="btn btn-primary" onclick="checkout2();">Подтвердить</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

</@mp.page2>