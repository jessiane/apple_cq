@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_header')
    <h1 class="page-title"><i class="voyager-laptop"></i>Color</h1>
@stop

@section('content')
    <div class="page-header container-fluid">
        <form role="form" method="get" class="form-inline" enctype="multipart/form-data"
              action="{{url()->current()}}/save">
            <div class="form-group">
                <label class="control-label">颜色名</label>
                <input type="text" class="form-control" name="name" placeholder="">
            </div>
            <button type="submit" class="btn btn-success ">添加</button>
        </form>
        <br />
    </div>
    <div class="page-content container-fluid">
        <h4>已有颜色</h4>
        @foreach($colors as $color)
            <p>{{$color->name}}<a class="btn btn-default btn-xs " href="/admin/color/delete/{{$color->id}}">删除</a></p>
        @endforeach
    </div>
@stop
