<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div>Список продуктов</div>
    <#list products?if_exists as product>
    <div>
        <div>
            <#if product.filename??>
                <img src="../img/${product.filename}">
            </#if>
        </div>
        <b>${product.name}</b><br>
        <span>${product.price?replace(",",".")}</span><br>
        <strong>${product.description}</strong><br>
    </div>
    <#else>
    No productss
    </#list>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="../static/js/bootstrap.js"></script>
</@c.page>