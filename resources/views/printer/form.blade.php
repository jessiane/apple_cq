@extends('voyager::master')

@section('css')
    <link href="/css/printer.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap-datepicker/1.7.0-RC1/css/bootstrap-datepicker3.standalone.min.css"
          rel="stylesheet">
@stop

@section('page_header')
    <h1 class="page-title"><i class="voyager-laptop"></i>printer</h1>
@stop

@section('content')
    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-heading">
                    </div>
                    <form role="form"
                          method="POST" class="form-inline" enctype="multipart/form-data"
                          id="order_form">
                        {!! csrf_field() !!}
                        <div class="panel-body">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <div class="form-group">
                                        <label class="control-label" for="name">维修单编号</label>
                                        <input type="text" class="form-control" name="order_number"
                                               value="No.{{$order_number_prefix.$order_number_suffix}}">
                                    </div>
                                    <input type="hidden" name="order_number_prefix" id="order_prefix"
                                           value="{{$order_number_prefix}}">
                                    <input type="hidden" name="order_number_suffix" id="order_suffix"
                                           value="{{$order_number_suffix}}">
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
                                        <input type="text" class="form-control" id="input-model-name" name="model_name"
                                               placeholder="">
                                        <select class="form-control" id="selector-model-name">
                                            @foreach($categories as $category)
                                                <option value="{{$category->id}}">{{$category->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">颜色</label>
                                        <input type="text" class="form-control" name="color" placeholder=""
                                               id="input-color">
                                        <select class="form-control" id="selector-color">
                                            @foreach($colors as $color)
                                                <option value="{{$color->id}}">{{$color->name}}</option>
                                            @endforeach
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
                                        <input type="text" class="form-control" name="surface" placeholder=""
                                               id="input-surface">
                                        <select class="form-control" id="selector-surface">
                                            @foreach(config('set.surface') as $surface)
                                                <option value="{{$surface}}">{{$surface}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">附件</label>
                                        <input type="text" class="form-control" name="attachment" placeholder=""
                                               id="input-attachment">
                                        <select class="form-control" id="selector-attachment">
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
                                        <input type="text" class="form-control" placeholder="" name="guarantee_time"
                                               id="input-guarantee-time">
                                        <select class="form-control" id="selector-guarantee-time">
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
                                        <input type="text" class="form-control" placeholder="" name="retrieve_time"
                                               id="retrieve_time">
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="panel-footer ">
                            <button type="button" class="btn btn-primary" id="submit">提交</button>
                        </div>
                    </form>
                </div>
                <div class="pre-view" id="printer-warp">
                    <p><span id="p-1-1">No.1703180010</span></p>
                    <p><span id="p-2-1">秦先生</span><span id="p-2-2">15881881925</span><span
                                id="p-2-3">2017-03-18</span><span id="p-2-4">No.001</span></p>
                    <p><span id="p-3-1">iphone6s</span><span id="p-3-2">白色</span><span id="p-3-3">NIS732</span></p>
                    <p><span id="p-4-1">正常</span><span id="p-4-2">手机壳</span><span id="p-4-3">123456</span></p>
                    <p><span id="p-5-1">故障现象故障现象故障现象</span></p>
                    <p><span id="p-6-1">√</span><span id="p-6-2">√</span></p>
                    <p><span id="p-7-1">其他说明其他说明其他说明</span></p>
                    <p><span id="p-8-1">维修措施维修措施维修措施</span></p>
                    <p><span id="p-9-1">30天</span><span id="p-9-2">120+50</span><span id="p-9-3">No.001</span></p>
                    <p><span id="p-10-1">2017-01-05</span></p>
                </div>
            </div>
        </div>
    </div>
@stop

@section('javascript')
    <script src="//cdn.bootcss.com/bootstrap-datepicker/1.7.0-RC1/js/bootstrap-datepicker.min.js"></script>
    <script src="http://cdn.bootcss.com/jQuery.print/1.5.1/jQuery.print.min.js"></script>
    <script src="/js/printer.js"></script>
@stop