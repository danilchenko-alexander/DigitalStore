<#import "parts/common.ftl" as c>
<@c.page>
<div style="padding-top:15px">
    <form method="post">
        <input type="text" name="name" placeholder="product name">
        <input type="text" name="price" placeholder="price">
        <input type="text" name="description" placeholder="description">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Добавить</button>
    </form>
</div>

<div>Список Продуктов</div>
    <#list products?if_exists as product>
    <div>
        <b>${product.name}</b>
        <span>${product.price?replace(",",".")}</span>
        <strong>${product.description}</strong><br>
        <a href="/product/${product.id}">edit</a>
    </div>
    <#else>
    No products
    </#list>
</@c.page>