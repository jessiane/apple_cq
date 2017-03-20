/**
 * Created by Administrator on 2017/3/19.
 */
$(document).ready(function () {

    var form = $('#order_form');
    var inputModelName = $('#input-model-name');
    var inputColor = $('#input-color');
    var inputSurface = $('#input-surface');
    var inputAttachment = $("#input-attachment");
    var inputGuaranteeTime = $("#input-guarantee-time");

    $("#submit").click(function () {
        var formData = form.serialize();
        $.ajax({
            type: 'post',
            url: '/admin/printer/save',
            data: formData,
            success: function (data) {
                var p61 = $('#p-6-1');
                var p62 = $('#p-6-2');
                p61.show();
                p62.show();
                switch (data.guarantee_type) {
                    case '1':
                        p62.hide();
                        break;
                    case "2":
                        p61.hide();
                        break;
                    default:
                        p61.hide();
                        p62.hide();
                        break;
                }

                setData(data);
                startPrint();
            }
        });
    });


    $('#selector-model-name').change(function () {
        setInputValue($(this), inputModelName);
    });

    $("#selector-color").change(function () {
        setInputValue($(this), inputColor);
    });
    $("#selector-surface").change(function () {
        setInputValue($(this), inputSurface);
    });
    $("#selector-attachment").change(function () {
        setInputValue($(this), inputAttachment);
    });
    $("#selector-guarantee-time").change(function () {
        setInputValue($(this), inputGuaranteeTime);
    });
    $('#retrieve_time').datepicker({
        format: 'yyyy-mm-dd'
    });


    function setInputValue(selectObj, inputObj) {
        var text = selectObj.find("option:selected").text();
        inputObj.val(text);
    }


    function startPrint() {
        $("#printer-warp").print({
            addGlobalStyles: false,
            stylesheet: '/css/printer_window.css',
            rejectWindow: false,
            noPrintSelector: ".no-print",
            iframe: true,
            append: null,
            prepend: null
        });
    }

    function setData(data) {
        var sex = data.sex == 1 ? '先生' : '女士';
        $('#p-1-1').html(data.order_number);
        $('#p-2-1').html(data.name + sex);
        $('#p-2-2').html(data.tel);
        $('#p-2-3').html(getFormatDate());
        $('#p-2-4').html(data.service_user);
        $('#p-3-1').html(data.model_name);
        $('#p-3-2').html(data.color);
        $('#p-3-3').html(data.IMEI);
        $('#p-4-1').html(data.surface);
        $('#p-4-2').html(data.attachment);
        $('#p-4-3').html(data.password);
        $('#p-5-1').html(data.symptom);
        $('#p-7-1').html(data.statement);
        $('#p-8-1').html(data.repair_plan);
        $('#p-9-1').html(data.guarantee_time);
        $('#p-9-2').html(data.spend);
        $('#p-9-3').html(data.sign);
        $('#p-10-1').html(data.retrieve_time);
    }

    function getFormatDate() {
        var date = new Date();
        var month = numberHandle(date.getMonth() + 1);
        var day = numberHandle(date.getDate());
        return date.getFullYear() + "-" + month + "-" + day;

        function numberHandle(number) {
            if (number < 10) {
                number = "0" + number;
            }
            return number;
        }
    }
});