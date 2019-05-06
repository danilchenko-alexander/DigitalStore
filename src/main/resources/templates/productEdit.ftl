<#import "parts/common.ftl" as c>
<@c.page>
<div style="padding-top: 15px">
<form action="/productEdit" method="post">
    <input type="text" name="name" value="${product.name}" placeholder="product name">
    <input type="text" name="price" value="${product.price?replace(",",".")}" placeholder="price">
    <input type="text" name="description" value="${product.description}" placeholder="description">
    <#list catalogs as catalog>
        <div>
            <label><input type="checkbox" name="${catalog}" ${product.catalogs?seq_contains(catalog)?string("checked", "")}>${catalog}</label>
        </div>
    </#list>
    <input type="hidden" value="${product.id}" name="productId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button type="submit">Save</button>
</form>
</div>
</@c.page>