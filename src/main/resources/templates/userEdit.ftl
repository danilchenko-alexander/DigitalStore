<#import "parts/common.ftl" as c>
<@c.page>
<div class="container mt-5">
    <div class="row col-sm-2">
    <form action="/user" method="post">
        <!-- Default input -->
        <label for="exampleForm2">Имя пользователя</label>
        <input type="text" id="exampleForm2" class="form-control"  name="username" value="${user.username}">
        <#list roles as role>
            <div>
                <label class="ml-1 mt-2"><input type="checkbox"
                              name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button class="btn btn-primary" type="submit">Сохранить</button>
    </form>
    </div>

</div>
</@c.page>