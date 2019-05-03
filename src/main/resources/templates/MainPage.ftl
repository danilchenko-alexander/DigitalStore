<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div class="navbar">
    <div>
        <@l.logout />
    </div>
    <div>
        <form method="post">
            <input type="text" name="msg" placeholder="message">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Добавить</button>

        </form>
        <form method="get" action="/MainPage">
            <input type="number" name="filter" placeholder="enter id">
            <button type="submit">Удалить</button>
        </form>
    </div>
    <div>Список имен</div>
    <#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.msg}</span>
        <strong>${message.authorName}</strong>
    </div>
    <#else>
    No messages
    </#list>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="../static/js/bootstrap.js"></script>
</@c.page>