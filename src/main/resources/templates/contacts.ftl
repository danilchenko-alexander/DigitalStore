<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>


<@c.page>
    <#include "parts/security.ftl">
<#if isAdmin>
<section class="mb-4">
<div class="row justify-content-center">

    <!--Grid column-->
<div class="col-md-9 mb-md-0 mb-5 mt-5">
<form method="post">
    <div>
        <div class="md-form">
            <textarea type="text" id="timeWork" name="timeWork" rows="2" class="form-control md-textarea">${contacts.timeWorking?if_exists}</textarea>
            <label for="timeWork">Время работы</label>
        </div>
        <div class="md-form">
            <textarea type="text" id="phoneNumbers" name="phoneNumbers" rows="2" class="form-control md-textarea">${contacts.phoneNumbers?if_exists}</textarea>
            <label for="phoneNumbers">Phone numbers</label>
        </div>
        <div class="md-form">
            <textarea type="text" id="links" name="links" rows="2" class="form-control md-textarea">${contacts.links?if_exists}</textarea>
            <label for="links">Ссылки</label>
        </div>
        <div class="md-form">
            <textarea type="text" id="address" name="address" rows="2" class="form-control md-textarea">${contacts.address?if_exists}</textarea>
            <label for="address">Адрес</label>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="d-flex justify-content-center"><button class="btn btn-primary" type="submit">Save</button></div>
    </div>
</form>
</div>
</div>
</section>
<#else>
<div class="container mt-5">
    <h3>Адрес</h3>
    <p>${address}</p>
    <h3>Время работы</h3>
    <#list timeWork as t>
        <p>${t}</p>
    </#list>
    <h3>Телефоны</h3>
    <#list phoneNumbers as p>
        <p>${p}</p>
    </#list>
    <#list links as l>
        <p><a href="#">${l}</a></p>
    </#list>
</div>
</#if>

</@c.page>