<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Order;
use Illuminate\Support\Facades\Input;

class PrinterController extends Controller {


  /**
   * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
   */
  public function form() {
    $date   = date('ymd');
    $number = Order::where('order_number_prefix', $date)->count('id');
    return view("printer.form", [
      'order_number' => 'No.' . $date . $this->_numberRemix($number + 1),
    ]);
  }

  public function save() {
    $data                        = Input::get();
    $data['order_number_prefix'] = date('ymd');
    Order::create($data);

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
}