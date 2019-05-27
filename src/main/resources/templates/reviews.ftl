<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <#include "parts/security.ftl">
<style>
    .my-custom-scrollbar {
        position: relative;
        height: 350px;
        overflow: auto;
    }
    .table-wrapper-scroll-y {
        display: block;
    }
</style>

<div class="container mt-5">
<div class="table-wrapper-scroll-y my-custom-scrollbar">

    <table class="table table-bordered table-striped table-sm mb-0">
        <thead>
        <tr>
            <th scope="col" style="width: 10%">#</th>
            <th scope="col" style="width: 10%">Пользователь</th>
            <th scope="col">Отзыв</th>
            <#if isAdmin>
                <th scope="col" style="width: 10%;">Действие</th>
            </#if>
        </tr>
        </thead>
        <tbody>
        <#list messages as message>
        <tr>
            <th scope="row">${message?counter}</th>
            <td>${message.authorName}</td>
            <td>${message.msg}</td>
            <#if isAdmin>
                <td align="center">
                    <form method="post" action="/Reviews/delete" id="delete-form${message.id}" name="delete-form${message.id}">
                        <input type="hidden" name="messageId" value="${message.id}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <a class="btn btn-primary btn-sm" onclick="document.getElementById('delete-form${message.id}').submit();">Delete</a>
                    </form>
                </td>
            </#if>
        </tr>
        </#list>
        </tbody>
    </table>


</div>
    <form method="post" id="review-form" name="review-form">
        <div class="md-form">
            <textarea type="text" id="message" name="msg" rows="2" class="form-control md-textarea"></textarea>
            <label for="message">Текст</label>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
    </form>
    <div class="text-center text-md-left">
        <a class="btn btn-primary" onclick="document.getElementById('review-form').submit();">Send</a>
    </div>
    <div class="status"></div>
</div>
</@c.page>