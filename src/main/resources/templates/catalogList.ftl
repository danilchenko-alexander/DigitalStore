<#import "parts/common.ftl" as c>
<@c.page>
<div class="text-center">
    <#list catalogs as catalog>
        <div>
            <a class="btn btn-primary" style="width: 30%;" href="/catalogList/${catalog}">${catalog}</a>
        </div>
    </#list>
</div>
</@c.page>