<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Order;
use Illuminate\Support\Facades\Input;

class OrderController extends Controller {

    public function index() {
        return view('order.index', ['orders' => Order::orderBy('created_at', 'desc')->paginate(15)]);
    }

    public function delete($id) {
        return Order::where('id', $id)->delete();
    }

    public function search() {
        $searchType = Input::get('search_type');
        $value      = Input::get('value');
        $orders     = Order::where($searchType, 'like', '%' . $value . '%')->orderBy('created_at', 'desc')->paginate(15);
        return view('order.index', [
            'orders' => $orders
        ]);
    }


}