<#import "parts/common.ftl" as c>
<@c.page>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4 text-center">
            <table class="table table-bordered table-sm mb-0">
                <thead>
                <tr>
                    <th style="padding-right:5px ">Name</th>
                    <th>Role</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                    <#list users as user>
                    <tr>
                        <td>${user.username}</td>
                        <td><#list user.roles as role>${role}<#sep>, </#list></td>
                        <td><a class="btn btn-primary btn-sm" href="/user/${user.id}">Изменить</a></td>
                    </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    </div>
</div>
</@c.page>