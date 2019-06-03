<#import "parts/common.ftl" as c>
<@c.page>
<div class="col-sm-3 mt-sm-3 text-center">
    <form method="post" action="/catalogList/addSubcatalog">

        <div class="form-group">
            <label for="formpC1"> добавить новый подкаталог</label>
            <input class="form-control" type="text" name="name" id="formpC1"">
        </div>
        <input type="hidden" name="catalogName" value="${catalogName}">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-success" style="width: 100%;">Save</button>
    </form>
    <div class="mt-sm-4">
        <#list subcatalogs as subcatalog>
            <div>
                <a class="btn btn-primary" style="width: 100%;"
                   href="/catalogList/${catalogName}/edit/${subcatalog.id}">${subcatalog.name}</a>
            </div>
        </#list>
    </div>
</div>
</@c.page>