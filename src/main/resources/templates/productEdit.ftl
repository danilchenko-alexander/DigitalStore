<#import "parts/common.ftl" as c>
<@c.page>
<div style="padding-top: 15px">
    <#if computer?exists>
        <div class="col-sm-4">
            <form method="post" enctype="multipart/form-data"
                  action="/catalogList/${catalog}/saveEditedComp">
                <input type="hidden" name="subcatalogName" value="${subcatalog}">
                <div class="form-group">
                    <label for="formс1"> Название продукта: </label>
                    <input class="form-control" type="text" name="name" id="formс1" value="${computer.name}">
                </div>
                <div class="form-group">
                    <label for="formс2"> Цена: </label>
                    <input class="form-control" type="text" name="price" id="formс2"
                           value="${computer.price?replace(",",".")}">
                </div>
                <div class="form-group">
                    <label for="formс3"> Описание:</label>
                    <input class="form-control" type="text" name="description" id="formс3"
                           value="${computer.description}">
                </div>
                <input type="file" name="file">
                <div class="form-group">
                    <label for="formс4"> Количество процессоров:</label>
                    <input class="form-control" type="number" name="numCPU" id="formс4"
                           value="${computer.numCPU?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formс5"> Название процессора:</label>
                    <input class="form-control" type="text" name="nameCPU" id="formс5" value="${computer.nameCPU}">
                </div>
                <div class="form-group">
                    <label for="formс6"> Кол-во ядер:</label>
                    <input class="form-control" type="number" name="numOfCores" id="formс6"
                           value="${computer.numOfCores?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formс7"> Тактовая частота:</label>
                    <input class="form-control" type="number" name="frequency" id="formс7"
                           value="${computer.frequency?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formс8"> Кэш(общий , L2 или L3):</label>
                    <input class="form-control" type="number" name="sharedCache" id="formс8"
                           value="${computer.sharedCache?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formс9"> Чипсет:</label>
                    <input class="form-control" type="text" name="chipset" id="formс9" value="${computer.chipset}">
                </div>
                <div class="form-group">
                    <label for="formс10"> Кол-во слотов памяти:</label>
                    <input class="form-control" type="text" name="numOfSlots" id="formс10"
                           value="${computer.numOfSlots}">
                </div>
                <div class="form-group">
                    <label for="formс11"> Максимальный объем памяти:</label>
                    <input class="form-control" type="number" name="maxMemorySize" id="formс11"
                           value="${computer.maxMemorySize?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formс12"> Объем памяти:</label>
                    <input class="form-control" type="number" name="memorySize" id="formс12"
                           value="${computer.memorySize?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formс13"> Тип оперативной памяти:</label>
                    <input class="form-control" type="text" name="typeRAM" id="formс13" value="${computer.typeRAM}">
                </div>
                <div class="form-group">
                    <label for="formс14"> Частота оперативной памяти:</label>
                    <input class="form-control" type="number" name="frequencyRAM" id="formс14"
                           value="${computer.frequencyRAM?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formс15"> Графический адаптер(видеокарта):</label>
                    <input class="form-control" type="text" name="graphicAdapter" id="formс15"
                           value="${computer.graphicAdapter}">
                </div>
                <div class="form-group">
                    <label for="formс16"> Тип графического адаптера:</label>
                    <input class="form-control" type="text" name="typeOfGraphicAdapter" id="formс16"
                           value="${computer.typeOfGraphicAdapter}">
                </div>
                <div class="form-group">
                    <label for="formс17"> Емкость накопителя:</label>
                    <input class="form-control" type="number" name="storageCapacity" id="formс17"
                           value="${computer.storageCapacity?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formс18"> Карты памяти:</label>
                    <input class="form-control" type="text" name="memoryCards" id="formс18"
                           value="${computer.memoryCards}">
                </div>
                <div class="form-group">
                    <label for="formс19"> Конфигурация накопителя:</label>
                    <input class="form-control" type="text" name="configCapacity" id="formс19"
                           value="${computer.configCapacity}">
                </div>
                <div class="form-group">
                    <label for="formс20"> Скорость вращения:</label>
                    <input class="form-control" type="number" name="rotationalSpeed" id="formс20"
                           value="${computer.rotationalSpeed?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formс21"> Тип хранения:</label>
                    <input class="form-control" type="text" name="storageType" id="formс21"
                           value="${computer.storageType}">
                </div>
                <div>
                    <#if computer.filename??>
                        <img src="../img/${computer.filename}">
                    </#if>
                </div>

                <input type="hidden" value="${computer.id}" name="compId">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit">сохранить</button>
            </form>
        </div>

        <form method="post" action="/catalogList/${catalog}/edit/${subcatalog.id}/deleteComputer">
            <input type="hidden" value="${computer.id}" name="compId">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Удалить</button>
        </form>



    <#elseif phone?exists>
        <div class="col-sm-4">
            <form method="post" enctype="multipart/form-data"
                  action="/catalogList/${catalog}/saveEditedPhone">
                <input type="hidden" name="subcatalogName" value="${subcatalog}">
                <div class="form-group">
                    <label for="formp1"> Название продукта: </label>
                    <input class="form-control" type="text" name="name" id="formp1" value="${phone.name}">
                </div>
                <div class="form-group">
                    <label for="formp2"> Цена: </label>
                    <input class="form-control" type="text" name="price" id="formp2"
                           value="${phone.price?replace(",",".")}">
                </div>
                <div class="form-group">
                    <label for="formp3"> Описание:</label>
                    <input class="form-control" type="text" name="description" id="formp3" value="${phone.description}">
                </div>
                <input type="file" name="file">
                <div class="form-group">
                    <label for="formp4"> Встроенная камера (да/нет):</label>
                    <input class="form-control" type="text" name="camera" id="formp4" value="${phone.camera}">
                </div>
                <div class="form-group">
                    <label for="formp5"> Кол-во сим карт:</label>
                    <input class="form-control" type="number" name="numOfSim" id="formp5"
                           value="${phone.numOfSim?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formp6"> Кол-во точек матрицы:</label>
                    <input class="form-control" type="number" name="numOfDots" id="formp6"
                           value="${phone.numOfDots?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formp7"> Операционная система:</label>
                    <input class="form-control" type="text" name="OS" id="formp7" value="${phone.OS}">
                </div>
                <div class="form-group">
                    <label for="formp8"> Размер экрана:</label>
                    <input class="form-control" type="text" name="screenSize" id="formp8" value="${phone.screenSize}">
                </div>
                <div class="form-group">
                    <label for="formp9"> Разрешение экрана:</label>
                    <input class="form-control" type="text" name="screenResolution" id="formp9"
                           value="${phone.screenResolution}">
                </div>
                <div class="form-group">
                    <label for="formp10"> Оперативная память:</label>
                    <input class="form-control" type="number" name="RAM" id="formp10" value="${phone.RAM?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formp11"> Флэш-память:</label>
                    <input class="form-control" type="number" name="flashMemory" id="formp11"
                           value="${phone.flashMemory?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formp12"> Количество ядер:</label>
                    <input class="form-control" type="number" name="numOfCores" id="formp12"
                           value="${phone.numOfCores?if_exists}">
                </div>
                <div class="form-group">
                    <label for="formp13"> Платформа:</label>
                    <input class="form-control" type="text" name="platform" id="formp13" value="${phone.platform}">
                </div>
                <div class="form-group">
                    <label for="formp14"> Разрядность процессора:</label>
                    <input class="form-control" type="text" name="capacityCPU" id="formp14"
                           value="${phone.capacityCPU}">
                </div>
                <div class="form-group">
                    <label for="formp15"> Тактовая частота процессора:</label>
                    <input class="form-control" type="text" name="frequencyCPU" id="formp15"
                           value="${phone.frequencyCPU}">
                </div>
                <div class="form-group">
                    <label for="formp16"> Название процессора:</label>
                    <input class="form-control" type="text" name="nameCPU" id="formp16" value="${phone.nameCPU}">
                </div>
                <input type="hidden" value="${phone.id}" name="phoneId">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit">Сохранить</button>

                <div>
                    <#if phone.filename??>
                        <img src="../img/${phone.filename}">
                    </#if>
                </div>

            </form>
            <form method="post" action="/catalogList/${catalog}/edit/${subcatalog.id}/deletePhone">
                <input type="hidden" value="${phone.id}" name="phoneId">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit">Удалить</button>
            </form>
        </div>
    </#if>

</div>

</@c.page>