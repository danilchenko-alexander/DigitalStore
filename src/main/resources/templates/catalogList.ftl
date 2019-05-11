<#import "parts/common.ftl" as c>
<@c.page>
<div>
    <#list catalogs as catalog>
        <div>
            <a href="/catalogList/${catalog}">${catalog}</a>
        </div>
    </#list>
</div>
</@c.page>