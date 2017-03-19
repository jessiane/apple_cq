<?php

namespace App\Http\Controllers\Admin;


use App\Color;
use App\Http\Controllers\Controller;
use App\Order;
use Illuminate\Support\Facades\Input;
use TCG\Voyager\Models\Category;

class PrinterController extends Controller {

    private $date;

    function __construct() {
        $this->date = date('ymd');
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function form() {
        $categories = Category::orderBy('order','asc')->get();
        return view("printer.form", [
            'order_number_prefix' => $this->date,
            'order_number_suffix' => $this->_getSuffix($this->date),
            'categories'=>$categories,
            'colors'=>Color::get()
        ]);
    }

    public function save() {
        $data                        = Input::all();
        $data['order_number_suffix'] = $this->_getSuffix($this->date);
        $data['order_number']        = 'No.' . $data['order_number_prefix'] . $data['order_number_suffix'];
        return Order::create($data);
    }

    private function _numberRemix($number) {
        $result = '';
        switch (count($number)) {
            case 1:
                $result .= '00';
                break;
            case 2:
                $result .= '0';
                break;
            default:
                break;
        }
        return $result . $number;
    }

    private function _getSuffix($date) {
        $number = Order::where('order_number_prefix', $date)->orderBy('order_number_suffix', 'desc')->pluck('order_number_suffix')->first();
        return $this->_numberRemix($number + 1);
    }
}