<#import "parts/common.ftl" as c>
<@c.page>
<div>

    <p>add new product to subcatalog ${subcatalog.name} of catalog ${catalog}</p>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseForm" role="button" aria-expanded="false"
       aria-controls="collapseForm">
        Добавить
    </a>
    <#if catalog=="Computer">
        <div class="collapse" id="collapseForm">
            <form method="post" enctype="multipart/form-data"
                  action="/catalogList/${catalog}/edit/${subcatalog.id}/saveComputer">
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            <input type="hidden" name="subcatalogName" value="${subcatalog}">
                            <div class="form-group">
                                <label for="formс1"> Название продукта: </label>
                                <input class="form-control" type="text" name="name" id="formс1">
                            </div>
                            <div class="form-group">
                                <label for="formс2"> Цена: </label>
                                <input class="form-control" type="text" name="price" id="formс2">
                            </div>
                            <div class="form-group">
                                <label for="formс3"> Описание:</label>
                                <input class="form-control" type="text" name="description" id="formс3">
                            </div>
                            <div class="form-group">
                                <label for="formс4"> Количество процессоров:</label>
                                <input class="form-control" type="number" name="numCPU" id="formс4">
                            </div>
                            <div class="form-group">
                                <label for="formс5"> Название процессора:</label>
                                <input class="form-control" type="text" name="nameCPU" id="formс5">
                            </div>
                            <div class="form-group">
                                <label for="formс6"> Кол-во ядер:</label>
                                <input class="form-control" type="number" name="numOfCores" id="formс6">
                            </div>

                            <div class="form-group">
                                <label for="formс7"> Тактовая частота:</label>
                                <input class="form-control" type="number" name="frequency" id="formс7">
                            </div>

                            <div class="form-group">
                                <label for="formс8"> Кэш(общий , L2 или L3):</label>
                                <input class="form-control" type="number" name="sharedCache" id="formс8">
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label for="formс9"> Чипсет:</label>
                                <input class="form-control" type="text" name="chipset" id="formс9">
                            </div>
                            <div class="form-group">
                                <label for="formс10"> Кол-во слотов памяти:</label>
                                <input class="form-control" type="String" name="numOfSlots" id="formс10">
                            </div>
                            <div class="form-group">
                                <label for="formс11"> Максимальный объем памяти:</label>
                                <input class="form-control" type="number" name="maxMemorySize" id="formс11">
                            </div>
                            <div class="form-group">
                                <label for="formс12"> Объем памяти:</label>
                                <input class="form-control" type="number" name="memorySize" id="formс12">
                            </div>

                            <div class="form-group">
                                <label for="formс13"> Тип оперативной памяти:</label>
                                <input class="form-control" type="text" name="typeRAM" id="formс13">
                            </div>
                            <div class="form-group">
                                <label for="formс14"> Частота оперативной памяти:</label>
                                <input class="form-control" type="text" name="frequencyRAM" id="formс14">
                            </div>

                            <div class="form-group">
                                <label for="formс15"> Графический адаптер(видеокарта):</label>
                                <input class="form-control" type="text" name="graphicAdapter" id="formс15">
                            </div>
                            <div class="form-group">
                                <label for="formс16"> Тип графического адаптера:</label>
                                <input class="form-control" type="text" name="typeOfGraphicAdapter" id="formс16">
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label for="formс17"> Емкость накопителя:</label>
                                <input class="form-control" type="number" name="storageCapacity" id="formс17">
                            </div>
                            <div class="form-group">
                                <label for="formс18"> Карты памяти:</label>
                                <input class="form-control" type="text" name="memoryCards" id="formс18">
                            </div>
                            <div class="form-group">
                                <label for="formс19"> Конфигурация накопителя:</label>
                                <input class="form-control" type="text" name="configCapacity" id="formс19">
                            </div>
                            <div class="form-group">
                                <label for="formс20"> Скорость вращения:</label>
                                <input class="form-control" type="number" name="rotationalSpeed" id="formс20">
                            </div>
                            <div class="form-group">
                                <label for="formс21"> Тип хранения:</label>
                                <input class="form-control" type="text" name="storageType" id="formс21">
                            </div>
                            <div class="custom-file form-group">
                                <input type="file" class="custom-file-input" id="customFileLang" name="file">
                                <label class="custom-file-label" for="customFileLang">Выберите Файл</label>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button class="btn btn-primary" type="submit">Добавить</button>
                    </div>
            </form>
        </div>
    <#elseif catalog=="Phone">
        <div class="collapse" id="collapseForm">
            <form method="post" enctype="multipart/form-data"
                  action="/catalogList/${catalog}/edit/${subcatalog.id}/savePhone">
                <input type="hidden" name="subcatalogName" value="${subcatalog}">
                <div class="form-group">
                    <label for="formp1"> Название продукта: </label>
                    <input class="form-control" type="text" name="name" id="formp1">
                </div>
                <div class="form-group">
                    <label for="formp2"> Цена: </label>
                    <input class="form-control" type="text" name="price" id="formp2">
                </div>
                <div class="form-group">
                    <label for="formp3"> Описание:</label>
                    <input class="form-control" type="text" name="description" id="formp3">
                </div>
                <input type="file" name="file">
                <div class="form-group">
                    <label for="formp4"> Встроенная камера (да/нет):</label>
                    <input class="form-control" type="text" name="camera" id="formp4">
                </div>
                <div class="form-group">
                    <label for="formp5"> Кол-во сим карт:</label>
                    <input class="form-control" type="number" name="numOfSim" id="formp5">
                </div>
                <div class="form-group">
                    <label for="formp6"> Кол-во точек матрицы:</label>
                    <input class="form-control" type="number" name="numOfDots" id="formp6">
                </div>
                <div class="form-group">
                    <label for="formp7"> Операционная система:</label>
                    <input class="form-control" type="text" name="OS" id="formp7">
                </div>
                <div class="form-group">
                    <label for="formp8"> Размер экрана:</label>
                    <input class="form-control" type="text" name="screenSize" id="formp8">
                </div>
                <div class="form-group">
                    <label for="formp9"> Разрешение экрана:</label>
                    <input class="form-control" type="text" name="screenResolution" id="formp9">
                </div>
                <div class="form-group">
                    <label for="formp10"> Оперативная память:</label>
                    <input class="form-control" type="number" name="RAM" id="formp10">
                </div>
                <div class="form-group">
                    <label for="formp11"> Флэш-память:</label>
                    <input class="form-control" type="number" name="flashMemory" id="formp11">
                </div>
                <div class="form-group">
                    <label for="formp12"> Количество ядер:</label>
                    <input class="form-control" type="number" name="numOfCores" id="formp12">
                </div>
                <div class="form-group">
                    <label for="formp13"> Платформа:</label>
                    <input class="form-control" type="text" name="platform" id="formp13">
                </div>
                <div class="form-group">
                    <label for="formp14"> Разрядность процессора:</label>
                    <input class="form-control" type="text" name="capacityCPU" id="formp14">
                </div>
                <div class="form-group">
                    <label for="formp15"> Тактовая частота процессора:</label>
                    <input class="form-control" type="text" name="frequencyCPU" id="formp15">
                </div>
                <div class="form-group">
                    <label for="formp16"> Название процессора:</label>
                    <input class="form-control" type="text" name="nameCPU" id="formp16">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit">Добавить</button>
            </form>
        </div>
    </#if>
</div>
<!-- Container -->
<div class="row">
    <!-- Column -->
    <#if catalog == "Computer">
        <#list computers?if_exists as computer>
            <div class="col-md-3 mb-4 d-flex align-items-stretch">
                <!--Card-->
                <div class="card">
                    <div class="view overlay">
                        <img src="/img/${computer.filename?if_exists}" class="card-img-top"
                             alt="">
                        <a href="#">
                            <div class="mask rgba-white-slight"></div>
                        </a>
                    </div>
                    <!--Card content-->
                    <div class="card-body text-center">
                        <!--Title-->
                        <h4 class="card-title">${computer.name}</h4>
                        <!--Text-->
                        <a class="btn btn-primary"
                           href="/catalogList/${catalog}/edit/${subcatalog.id}/editComputer/${computer.id}">Изменить</a>
                    </div>
                </div>
                <!--/.Card-->
            </div>
        <#else>
            no products
            <!-- Column -->
        </#list>
    <#elseif catalog=="Phone">
        <#list phones?if_exists as phone>
            <div class="col-md-3 mb-4 d-flex align-items-stretch">
                <!--Card-->
                <div class="card">
                    <div class="view overlay">
                        <img src="/img/${phone.filename?if_exists}" class="card-img-top"
                             alt="">
                        <a href="#">
                            <div class="mask rgba-white-slight"></div>
                        </a>
                    </div>
                    <!--Card content-->
                    <div class="card-body text-center">
                        <!--Title-->
                        <h4 class="card-title">${phone.name}</h4>
                        <!--Text-->
                        <a class="btn btn-primary"
                           href="/catalogList/${catalog}/edit/${subcatalog.id}/editPhone/${phone.id}">edit</a>
                    </div>
                </div>
                <!--/.Card-->
            </div>
        <#else>
            no products
        </#list>
    </#if>

</div>
<!-- Container -->
</@c.page>