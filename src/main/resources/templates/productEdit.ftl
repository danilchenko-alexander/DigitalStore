<#import "parts/common.ftl" as c>
<@c.page>
<div style="padding-top: 15px">
    <form action="/productEdit" method="post" enctype="multipart/form-data">
        <input type="text" name="name" value="${product.name}" placeholder="product name">
        <input type="text" name="price" value="${product.price?replace(",",".")}" placeholder="price">
        <input type="text" name="description" value="${product.description}" placeholder="description">
        <input type="file" name="file">
        <div>
            <#if product.filename??>
                <img src="../img/${product.filename}">
            </#if>
        </div>
        <input type="hidden" value="${product.id}" name="productId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">Save</button>
    </form>

    <form method="get" action="/productEdit/delete">
        <input type="hidden" name="productId" value="${product.id}">
        <button type="submit">delete</button>
    </form>
</div>
</@c.page>