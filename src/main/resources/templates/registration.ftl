<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div style="margin-top:15px ;">
Add new user
    <@l.login "/registration" />
</div>
${message?ifExists}
</@c.page>