<#macro login path>
<form action="${path}" method="post">
    <div class="col-sm-4">
        <div class="form-group">
            <label for="formGroupInputName"> User Name : </label>
            <input class="form-control" type="text" name="username" id="formGroupInputName">
        </div>
        <div class="form-group">
            <label for="formGroupInputPassword"> Password: </label>
            <input class="form-control" type="password" name="password" id="formGroupInputPassword">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div><button class="btn btn-primary" type="submit">Sign in</button></div>
    </div>
</form>
</#macro>


<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <a class="dropdown-item" href="#" onclick="this.parentNode.submit();">Выход</a>
</form>
</#macro>