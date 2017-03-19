@extends('voyager::master')

@section('css')
@stop

@section('page_header')
    <a href="/admin/order"><h1 class="page-title"><i class="voyager-laptop"></i>orders</h1></a>
@stop

@section('content')

    <div class="container-fluid">
        <form role="form" class="form-inline" enctype="multipart/form-data" action="/admin/order/search">
            <div class="form-group">
                <select class="form-control" name="search_type">
                    <option value="order_number">单号</option>
                    <option value="name">姓名</option>
                    <option value="tel">电话</option>
                    <option value="model_name">型号</option>
                    <option value="color">颜色</option>
                    <option value="IMEI">串号</option>
                    <option value="created_at">日期</option>
                </select>
            </div>
            <div class="form-group">
                <input class="form-control" type="text" name="value">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>单号</th>
                <th>姓名</th>
                <th>电话</th>
                <th>型号</th>
                <th>颜色</th>
                <th>串号</th>
                <th>外观</th>
                <th>附件</th>
                <th>故障现象</th>
                <th>维修措施</th>
                <th>费用</th>
                <th>保修期</th>
                <th>其他</th>
                <th>修复</th>
                <th>日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            @foreach($orders as $order)
                <tr data-id="{{$order->id}}">
                    <td>{{$order->order_number}}</td>
                    <td>{{$order->name}}</td>
                    <td>{{$order->tel}}</td>
                    <td>{{$order->model_name}}</td>
                    <td>{{$order->color}}</td>
                    <td>{{$order->IMEI}}</td>
                    <td>{{$order->surface}}</td>
                    <td>{{$order->attachment}}</td>
                    <td>{{$order->symptom}}</td>
                    <td>{{$order->repair_plan}}</td>
                    <td>{{$order->spend}}</td>
                    <td>{{$order->guarantee_time}}</td>
                    <td>{{$order->statement}}</td>
                    <td>
                        <span class="{{$order->is_repaired ? 'voyager-check' : 'voyager-x'}}"></span>
                    </td>
                    <td>{{$order->created_at}}</td>
                    <td><span class="voyager-trash delete"> </span></td>
                </tr>
            @endforeach
            </tbody>
        </table>
        <div class="page-bottom text-bottom text-center">
            <?php echo $orders->render();?>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.delete').click(function () {
                var id = $(this).parents('tr').first().attr('data-id');
                if (confirm('确认删除?')) {
                    $.ajax({
                        type: 'get',
                        url: '/admin/order/delete/' + id,
                        success: function (data) {
                            $('tr[data-id=' + id + ']').hide();
                        }
                    })
                }
            });
        });
    </script>
@stop