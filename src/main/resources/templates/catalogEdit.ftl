<#import "parts/common.ftl" as c>
<@c.page>
<div>
    <form method="post" action="/catalogList/addSubcatalog">
        <input type="text" name="name" placeholder="enter subcatalog name">
        <input type="hidden" name="catalogName" value="${catalogName}">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">Save</button>
    </form>
</div>
<div>
    <#list subcatalogs as subcatalog>
        <div>
            <a href="/catalogList/${catalogName}/edit/${subcatalog.id}">${subcatalog.name}</a>
        </div>
    </#list>
</div>
</@c.page>