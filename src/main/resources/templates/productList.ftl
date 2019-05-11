<#import "parts/common.ftl" as c>
<@c.page>
<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    add new product to catalog ${subcatalog.name}
</a>
<div class="collapse" id="collapseExample">
    <form method="post" enctype="multipart/form-data">
        <input type="hidden" name="subcatalogName" value="${subcatalog}">
        <input type="text" name="name" placeholder="product name">
        <input type="text" name="price" placeholder="price">
        <input type="text" name="description" placeholder="description">
        <input type="file" name="file">
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
        <div>
            <#if product.filename??>
                <img src="/img/${product.filename}">
            </#if>
        </div>
        <a href="/product/${product.id}">edit</a>
    </div>
    <#else>
    No products
    </#list>
</@c.page>