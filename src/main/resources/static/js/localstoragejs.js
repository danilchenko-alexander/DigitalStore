function funnyfun() {
    var amount;
    var comp;
    var pt = document.getElementById('productType').value;
    var id = document.getElementById('getFromID').value;
    var compName = document.getElementById('getFromCN').value;
    var price = document.getElementById('getFromPR').value;
    if (localStorage.getItem(String(id)) != null) {
        amount = JSON.parse(localStorage.getItem(String(id))).amount;
        amount++;
        comp = {
            productType: pt,
            amount: amount,
            id: id,
            compName: compName,
            price: price
        };
        localStorage.setItem(id, JSON.stringify(comp));
    } else {
        comp = {
            productType: pt,
            amount: 1,
            id: id,
            compName: compName,
            price: price
        };
        localStorage.setItem(id, JSON.stringify(comp));
    }
    ;
}

function getCart() {
    deleteAll();
    var id;
    var obj;
    var tbody = document.getElementById('#mcc');
    for (var i = 0; i < localStorage.length; i++) {
        id = JSON.parse(localStorage.key(i));
        obj = JSON.parse(localStorage.getItem(String(id)));
        var tr = document.createElement('tr');
        var th = document.createElement('th');
        var td1 = document.createElement('td');
        var td2 = document.createElement('td');
        var td3 = document.createElement('td');
        var ii = document.createElement('i');
        var a = document.createElement('a');
        var atr = document.createAttribute('onclick');
        var atr2 = document.createAttribute('id');
        atr.value = 'deleteRow(this.parentNode.parentNode)';
        atr2.value = obj.id;
        th.innerHTML = obj.amount;
        td1.innerHTML = obj.compName;
        td2.innerHTML = (obj.price.replace(",", ".") + " руб");
        ii.className = "fas fa-times";

        a.appendChild(ii);
        tr.setAttributeNode(atr2);
        a.setAttributeNode(atr);
        td3.appendChild(a);
        tr.appendChild(th);
        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td3);
        tbody.appendChild(tr);
    }
}

function deleteRow(r) {
    console.log(r.getAttribute('id'));
    localStorage.removeItem(r.getAttribute('id'))
    r.parentNode.removeChild(r);
}

function deleteAll() {
    var tabb = document.getElementById('#mcc');
    var l = tabb.rows.length;
    for (var i = l; i > 0; i--) {
        tabb.deleteRow(0);
    }
}

function checkout() {
    var jsonObj;
    jsonObj = {
        "products": []
    };
    for (var i = 0; i < localStorage.length; i++) {
        id = JSON.parse(localStorage.key(i));
        obj = JSON.parse(localStorage.getItem(String(id)));
        jsonObj.products[i] = obj;
    }
    document.querySelector('#JSONfield').value = JSON.stringify(jsonObj);
}

function checkout2() {
    var jsonObj;
    jsonObj = {
        "products": []
    };
    for (var i = 0; i < localStorage.length; i++) {
        id = JSON.parse(localStorage.key(i));
        obj = JSON.parse(localStorage.getItem(String(id)));
        jsonObj.products[i] = obj;
    }
    document.querySelector('#JSONfield2').value = JSON.stringify(jsonObj);
}