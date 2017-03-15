@extends('voyager::master')

@section('css')
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <style type="text/css">

    .pre-view {
      background-color: #00A000;
      min-height: 2em;
    }
    .panel {
      margin: auto;
    }
  </style>
@stop

@section('page_header')
  <h1 class="page-title"><i class="voyager-laptop"></i>printer
  </h1>
@stop

@section('content')
  <div class="page-content container-fluid">
    @include('voyager::alerts')
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-bordered">
          <div class="panel-heading">
            <h3 class="panel-title">11122111</h3>
          </div>
          <form role="form"
                method="POST" class="form-inline" enctype="multipart/form-data" action="/admin/printer/save">
            <div class="panel-body">
              <ul class="list-group">
                <li class="list-group-item">

                  <div class="form-group">
                    <label class="control-label" for="name">维修单编号</label>
                    <input type="text" class="form-control" name="order_number" value="{{$order_number}}">
                  </div>
                </li>
                <li class="list-group-item">

                  <div class="form-group">
                    <label class="control-label">客户姓名</label>
                    <input type="text" class="form-control" name="name" placeholder="">
                  </div>

                  <div class="form-group">
                    <label class="checkbox-inline">
                      <input type="radio" name="sex" id="optionsRadios3"
                             value="1" checked>先生
                    </label>
                    <label class="checkbox-inline">
                      <input type="radio" name="sex" id="optionsRadios4"
                             value="2">女士
                    </label>
                  </div>


                  <div class="form-group">
                    <label class="control-label">电话</label>
                    <input type="text" class="form-control" name="tel" placeholder="">
                  </div>

                  <div class="form-group">
                    <label>受理人</label>
                    <select class="form-control" name="service_user">
                      @foreach(config('set.service_user') as $serviceUser)
                        <option value="{{$serviceUser}}">{{$serviceUser}}</option>
                      @endforeach
                    </select>
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="form-group">
                    <label class="control-label">设备/型号</label>
                    <input type="text" class="form-control" name="model_name" placeholder="">
                    <select class="form-control">
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="control-label">颜色</label>
                    <input type="text" class="form-control" name="color" placeholder="">
                    <select class="form-control">
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="control-label">串号</label>
                    <input type="text" class="form-control" name="IMEI" placeholder="">
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="form-group">
                    <label class="control-label">&nbsp;外观检测</label>
                    <input type="text" class="form-control" name="surface" placeholder="">
                    <select class="form-control">
                      @foreach(config('set.surface') as $surface)
                        <option value="{{$surface}}">{{$surface}}</option>
                      @endforeach
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="control-label">附件</label>
                    <input type="text" class="form-control" name="attachment" placeholder="">
                    <select class="form-control">
                      @foreach(config('set.attachment') as $attachment)
                        <option value="{{$attachment}}">{{$attachment}}</option>
                      @endforeach
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="control-label" for="name">密码</label>
                    <input type="text" class="form-control" name="password" placeholder="">
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="form-group">
                    <label for="name">故障现象</label>
                    <textarea class="form-control" rows="1" cols="98" name="symptom"></textarea>
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="form-group">
                    <label>保修状态</label>
                    <label class="checkbox-inline">
                      <input type="radio" name="guarantee_type"
                             value="1">店保
                    </label>
                    <label class="checkbox-inline">
                      <input type="radio" name="guarantee_type"
                             value="2" checked>脱保
                    </label>
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="form-group">
                    <label>其他说明</label>
                    <textarea class="form-control" rows="1" cols="98" name="statement"></textarea>
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="form-group">
                    <label for="name">维修措施/费用明细</label>
                    <textarea class="form-control" rows="1" cols="90" name="repair_plan"></textarea>
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="form-group">
                    <label class="control-label">保修期</label>
                    <input type="text" class="form-control" placeholder="" name="guarantee_time">
                    <select class="form-control">
                      @foreach(config('set.guarantee_time') as $guarantee_time)
                        <option value="{{$guarantee_time}}">{{$guarantee_time}}</option>
                      @endforeach
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="control-label">维修费用</label>
                    <input type="text" class="form-control" placeholder="" name="spend">
                  </div>
                  <div class="form-group">
                    <label class="control-label">工程师签字</label>
                    <select class="form-control" name="sign">
                      @foreach(config('set.service_user') as $serviceUser)
                        <option value="{{$serviceUser}}">{{$serviceUser}}</option>
                      @endforeach
                    </select>
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="form-group">
                    <label class="control-label" for="name">取机日期</label>
                    <input type="text" class="form-control" placeholder="" name="retrieve_time">
                  </div>
                </li>
              </ul>
            </div>
            <div class="panel-footer ">
              <button type="submit" class="btn btn-primary">提交</button>
              <button type="button" id="my-test">test_printe</button>
            </div>
          </form>
        </div>
        <div class="pre-view" id="printer-warp">
          111
        </div>
      </div>
    </div>
  </div>
@stop

@section('javascript')
  <script type="text/javascript">
    $(document).ready(function () {

      $("#my-test").click(function () {
        $("#printer-warp").print({
          addGlobalStyles: true,
          stylesheet: null,
          rejectWindow: true,
          noPrintSelector: ".no-print",
          iframe: true,
          append: null,
          prepend: null
        });

      })

    });
  </script>
  <script src="http://cdn.bootcss.com/jQuery.print/1.5.1/jQuery.print.min.js"></script>
@stop