<#import "parts/mainPart.ftl" as mp>
<@mp.page2>
<div class="container">
    <div class="row">
        <div class="col-sm-6 border-right">
            <img src="/img/${computer.filename?if_exists}" class="card-img-top"
                 alt="">
        </div>
        <div class="col-sm-6">
            <h1>${computer.name}</h1>
            <p class="mt-5">Наличие: Есть в наличии</p>
            <p>Описание: ${computer.description}</p>
            <h2 class="mt-5 mb-5">${computer.price} руб (с НДС)</h2>
            <button class="btn btn-primary" style="width: 100%;">В корзину
                <i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
        </div>
    </div>
    <div class="row">
        <table class="table table-bordered mt-2">
            <thead>
            <tr>
                <th colspan="2" bgcolor="#add8e6">Общая информация</th>
            </tr>
            </thead>
            <tbody>
                <#if computer.numCPU??>
                <tr>
                    <th scope="row">Количество ядер</th>
                    <td>${computer.numCPU}</td>
                </tr>
                </#if>
                <#if computer.nameCPU!="">
                <tr>
                    <th scope="row">Процессор</th>
                    <td>${computer.nameCPU}</td>
                </tr>
                </#if>
                <#if computer.numOfCores??>
                <tr>
                    <th scope="row">Количество ядер</th>
                    <td>${computer.numOfCores}</td>
                </tr>
                </#if>
                <#if computer.frequency??>
                <tr>
                    <th scope="row">Частота тактирования</th>
                    <td>${computer.frequency}</td>
                </tr>
                </#if>
                <#if computer.sharedCache??>
                <tr>
                    <th scope="row">кэш(общий , L2 или L3)</th>
                    <td>${computer.sharedCache}</td>
                </tr>
                </#if>
                <#if computer.chipset!="">
                <tr>
                    <th scope="row">Чипсет</th>
                    <td>${computer.chipset}</td>
                </tr>
                </#if>
                <#if computer.numOfSlots!="">
                <tr>
                    <th scope="row">Количество слотов памяти</th>
                    <td>${computer.numOfSlots}</td>
                </tr>
                </#if>
                <#if computer.maxMemorySize??>
                <tr>
                    <th scope="row">максимальный объем памяти</th>
                    <td>${computer.maxMemorySize} ГБ</td>
                </tr>
                </#if>
                <#if computer.memorySize??>
                <tr>
                    <th scope="row">объем памяти</th>
                    <td>${computer.memorySize}</td>
                </tr>
                </#if>
                <#if computer.typeRAM!="">
                <tr>
                    <th scope="row">тип оперативной памяти</th>
                    <td>${computer.typeRAM}</td>
                </tr>
                </#if>
                <#if computer.frequencyRAM??>
                <tr>
                    <th scope="row">частота оперативной памяти</th>
                    <td>${computer.frequencyRAM}</td>
                </tr>
                </#if>
                <#if computer.typeOfGraphicAdapter!="">
                <tr>
                    <th scope="row">тип графического адаптера</th>
                    <td>${computer.typeOfGraphicAdapter}</td>
                </tr>
                </#if>
                <#if computer.storageCapacity??>
                <tr>
                    <th scope="row">емкость накопителя</th>
                    <td>${computer.storageCapacity}</td>
                </tr>
                </#if>
                <#if computer.memoryCards!="">
                <tr>
                    <th scope="row">карты памяти</th>
                    <td>${computer.memoryCards}</td>
                </tr>
                </#if>
                <#if computer.configCapacity!="">
                <tr>
                    <th scope="row">Конфигурация накопителя</th>
                    <td>${computer.configCapacity}</td>
                </tr>
                </#if>
                <#if computer.rotationalSpeed??>
                <tr>
                    <th scope="row">Скорость вращения</th>
                    <td>${computer.rotationalSpeed}</td>
                </tr>
                </#if>
                <#if computer.storageType!="">
                <tr>
                    <th scope="row">тип накопителя</th>
                    <td>${computer.storageType}</td>
                </tr>
                </#if>
            </tbody>
        </table>
    </div>
</div>
</@mp.page2>