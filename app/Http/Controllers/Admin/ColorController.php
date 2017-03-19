<?php

namespace App\Http\Controllers\Admin;

use App\Color;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;

class ColorController extends Controller {

    public function form() {
        return view('color.form', [
            'colors' => Color::orderBy('id', 'desc')->get()
        ]);
    }

    public function save() {
        Color::create(Input::get());
        return redirect()->action('Admin\ColorController@form')->with([
            'message' => "Successfully Added New " . Input::get('name'),
            'alert-type' => 'success',
        ]);
    }

    public function delete($id) {
        Color::where('id', $id)->delete();
        return redirect()->action('Admin\ColorController@form')->with([
            'message' => "Successfully Delete " . Input::get('name'),
            'alert-type' => 'success',
        ]);
    }


}